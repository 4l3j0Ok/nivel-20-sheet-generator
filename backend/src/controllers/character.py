"""Character controller for fetching and converting Nivel20 characters."""

import os
from typing import Optional, Dict, Any, List
from functools import wraps

import requests
from jinja2 import Template
from markdown import markdown

from logger import logger
from models.character import (
    Character,
    Background,
    FeatsAndTraits,
    Feat,
    Fields,
    Class,
    Ability,
    Skill,
    Attack,
    Spells,
    SpellList,
)
from controllers.exceptions import Nivel20APIError, ConvertCharacterError, InvalidURL


def validate_url(func):
    """Decorator to validate Nivel20 URLs."""

    @wraps(func)
    def wrapper(*args, **kwargs):
        if "nivel20.com" not in str(args[0]):
            raise InvalidURL()
        return func(*args, **kwargs)

    return wrapper


@validate_url
def get_base_character(character_url: str) -> Optional[Dict[str, Any]]:
    """Fetch character data from Nivel20 API.

    Args:
        character_url: URL of the Nivel20 character.

    Returns:
        Dictionary with character data.

    Raises:
        Nivel20APIError: If the API request fails.
    """
    try:
        # Resolve redirect
        response = requests.head(character_url, allow_redirects=True)
        response.raise_for_status()
        character_url = response.url

        # Fetch character JSON
        json_url = f"{character_url}.json"
        response = requests.get(json_url)
        response.raise_for_status()

        character = response.json().get("printable_hash")
        return character
    except requests.HTTPError as e:
        logger.warning(f"HTTP error fetching character: {e}")
        raise Nivel20APIError(
            "Error al obtener el personaje. Verifica que la URL sea correcta."
        )
    except Exception as e:
        logger.error(f"Error fetching character: {e}")
        raise Exception("Error desconocido al obtener el personaje.")


def _format_modifier(value: int) -> str:
    """Format a modifier with + or - sign."""
    return f"+{value}" if value > 0 else str(value)


def _find_ability_by_name(abilities: List[Dict], name: str) -> Optional[Dict]:
    """Find an ability by name in the abilities list."""
    return next((ability for ability in abilities if ability.get("name") == name), None)


def _find_skill_by_name(skills: List[Dict], name: str) -> Optional[Dict]:
    """Find a skill by name in the skills list."""
    return next((skill for skill in skills if skill.get("name") == name), None)


def _create_ability(ability_data: Optional[Dict]) -> Optional[Ability]:
    """Create an Ability object from API data."""
    if not ability_data:
        return None
    return Ability(
        total=ability_data.get("total", 0),
        modifier=_format_modifier(ability_data.get("mod", 0)),
    )


def _create_skill(skill_data: Optional[Dict]) -> Optional[Skill]:
    """Create a Skill object from API data."""
    if not skill_data:
        return None
    return Skill(
        proficiency=(skill_data.get("proficiency") != "none"),
        value=_format_modifier(skill_data.get("total", 0)),
    )


def _create_saving_throw(ability_data: Optional[Dict]) -> Optional[Skill]:
    """Create a saving throw Skill object from API data."""
    if not ability_data:
        return None
    saving_throw = ability_data.get("saving_throw", {})
    return Skill(
        proficiency=(saving_throw.get("proficiency") != "none"),
        value=_format_modifier(saving_throw.get("total", 0)),
    )


@validate_url
def convert_to_character(character_url: str) -> Character:
    """Convert Nivel20 character data to Character object.

    Args:
        character_url: URL of the Nivel20 character.

    Returns:
        Character object with all data.

    Raises:
        ConvertCharacterError: If conversion fails.
    """
    try:
        character_data = get_base_character(character_url)

        background = Background.from_dict(character_data.get("background", {}))
        fields = Fields.from_dict(character_data.get("fields", {}))
        feats_and_traits = get_feats_and_traits(character_data)

        info = character_data.get("info", {})
        spell_books = character_data.get("spell_books", [])
        last_spell_book = spell_books[-1] if spell_books else {}
        professions = character_data.get("professions", [])
        last_profession = professions[-1] if professions else {}

        character = Character(
            name=info.get("name", ""),
            player_name=info.get("player", ""),
            race=info.get("race", ""),
            classes=[Class.from_dict(profession) for profession in professions],
            level=info.get("level", 1),
            background=background,
            fields=fields,
            image=info.get("image_url", ""),
            abilities=get_abilities(character_data),
            saving_throws=get_saving_throws(character_data),
            skills=get_skills(character_data),
            attacks=get_attacks(character_data),
            equipment=get_equipment(character_data),
            proficiencies=get_proficiencies(character_data),
            passive_wisdom=get_passive_wisdom(character_data),
            proficiency_bonus=info.get("proficiency_bonus", 2),
            armor_class=character_data.get("armor", {}).get("normal", 10),
            initiative=_format_modifier(
                character_data.get("initiative", {}).get("total", 0)
            ),
            speed=character_data.get("speed", {}).get("total", 30),
            max_hit_points=info.get("hit_points", 0),
            hit_dice=f"{last_profession.get('level', 1)}d{last_profession.get('hit_points_dice', 6)}",
            spellcasting_ability=last_spell_book.get("spell_ability_name", ""),
            spell_save_dc=last_spell_book.get("spell_save_dc", 0),
            spell_attack_bonus=_format_modifier(
                last_spell_book.get("spell_attack_bonus", 0)
            ),
            spells=get_spells(character_data),
            feats_and_traits=feats_and_traits,
        )
        return character
    except Exception as e:
        logger.error(f"Error converting character: {e}")
        logger.exception(e)
        raise ConvertCharacterError(
            "Error en el proceso de conversión del personaje. Verifica que la URL sea correcta."
        )


def create_sheet(character: Character) -> str:
    """Render character as HTML.

    Args:
        character: Character object to render.

    Returns:
        HTML string of the character sheet.

    Raises:
        Exception: If rendering fails.
    """
    try:
        template_path = os.path.join(
            os.path.dirname(__file__), "..", "templates", "index.html.tpl"
        )
        with open(template_path, "r", encoding="utf-8") as file:
            template_content = file.read()
        template = Template(template_content)
        return template.render(character=character)
    except Exception as e:
        logger.exception(e)
        logger.error(f"Error rendering character: {e}")
        raise Exception("Error al renderizar el personaje")


def get_abilities(character_data: Dict[str, Any]) -> Dict[str, Ability]:
    """Extract abilities from character data.

    Args:
        character_data: Raw character data from API.

    Returns:
        Dictionary mapping ability names to Ability objects.
    """
    abilities_list = character_data.get("abilities", [])
    ability_names = [
        ("Fuerza", "strength"),
        ("Destreza", "dexterity"),
        ("Constitución", "constitution"),
        ("Inteligencia", "intelligence"),
        ("Sabiduría", "wisdom"),
        ("Carisma", "charisma"),
    ]

    abilities = {}
    for spanish_name, english_key in ability_names:
        ability_data = _find_ability_by_name(abilities_list, spanish_name)
        abilities[english_key] = _create_ability(ability_data)

    return abilities


def get_saving_throws(character_data: Dict[str, Any]) -> Dict[str, Skill]:
    """Extract saving throws from character data.

    Args:
        character_data: Raw character data from API.

    Returns:
        Dictionary mapping ability names to saving throw Skill objects.
    """
    abilities_list = character_data.get("abilities", [])
    ability_names = [
        ("Fuerza", "strength"),
        ("Destreza", "dexterity"),
        ("Constitución", "constitution"),
        ("Inteligencia", "intelligence"),
        ("Sabiduría", "wisdom"),
        ("Carisma", "charisma"),
    ]

    saving_throws = {}
    for spanish_name, english_key in ability_names:
        ability_data = _find_ability_by_name(abilities_list, spanish_name)
        saving_throws[english_key] = _create_saving_throw(ability_data)

    return saving_throws


def get_skills(character_data: Dict[str, Any]) -> Dict[str, Skill]:
    """Extract skills from character data.

    Args:
        character_data: Raw character data from API.

    Returns:
        Dictionary mapping skill names to Skill objects.
    """
    skills_list = character_data.get("skills", [])
    skill_names = [
        ("Acrobacias", "acrobatics"),
        ("Trato con animales", "animal_handling"),
        ("Arcanos", "arcana"),
        ("Atletismo", "athletics"),
        ("Engañar", "deception"),
        ("Historia", "history"),
        ("Perspicacia", "insight"),
        ("Intimidar", "intimidation"),
        ("Investigación", "investigation"),
        ("Medicina", "medicine"),
        ("Naturaleza", "nature"),
        ("Percepción", "perception"),
        ("Interpretación", "performance"),
        ("Persuasión", "persuasion"),
        ("Religión", "religion"),
        ("Juego de Manos", "sleight_of_hand"),
        ("Sigilo", "stealth"),
        ("Supervivencia", "survival"),
    ]

    skills = {}
    for spanish_name, english_key in skill_names:
        skill_data = _find_skill_by_name(skills_list, spanish_name)
        skills[english_key] = _create_skill(skill_data)

    return skills


def get_attacks(character_data: Dict[str, Any]) -> List[Attack]:
    """Extract attacks from character data.

    Args:
        character_data: Raw character data from API.

    Returns:
        List of Attack objects.
    """
    attacks = []
    for attack in character_data.get("attacks", []):
        attacks.append(
            Attack(
                name=attack.get("name", ""),
                bonus=attack.get("attack", {}).get("to_hit", {}).get("value", ""),
                damage=attack.get("attack", {}).get("damage", {}).get("value", ""),
            )
        )
    return attacks


def get_equipment(character_data: Dict[str, Any]) -> List[str]:
    """Extract equipment from character data.

    Args:
        character_data: Raw character data from API.

    Returns:
        List of equipment strings.
    """
    equipment = []
    items = character_data.get("items", {})

    for item in items.get("armaduras", []):
        armor_value = item.get("armor", {}).get("value")
        name = item.get("name", "")
        equipment.append(f"{name} {'CA ' + armor_value if armor_value else ''}".strip())

    for item in items.get("equipo_de_aventuras", []):
        armor_value = item.get("armor", {}).get("value")
        name = item.get("name", "")
        equipment.append(f"{name} {'CA ' + armor_value if armor_value else ''}".strip())

    return equipment


def get_proficiencies(character_data: Dict[str, Any]) -> str:
    """Extract proficiencies from character data.

    Args:
        character_data: Raw character data from API.

    Returns:
        HTML formatted proficiencies string.
    """
    proficiencies_data = character_data.get("proficiencies", {})
    proficiencies_html = ""

    # Item groups proficiencies
    item_groups = proficiencies_data.get("item_groups", {}).get("proficient", [])
    if item_groups:
        proficiencies_html += "<p>-"
        proficiencies_html += ", ".join(item_groups)
        proficiencies_html += "</p>"

    # Items proficiencies
    items = proficiencies_data.get("items", {}).get("proficient", [])
    if items:
        proficiencies_html += "<p>-"
        proficiencies_html += ", ".join(items)
        proficiencies_html += "</p>"

    return proficiencies_html if proficiencies_html else "<p>-</p>"


def get_passive_wisdom(character_data: Dict[str, Any]) -> int:
    """Calculate passive wisdom (perception).

    Args:
        character_data: Raw character data from API.

    Returns:
        Passive wisdom value.
    """
    passive_wisdom = 10
    info = character_data.get("info", {})

    for skill in character_data.get("skills", []):
        if skill.get("name") == "Percepción":
            passive_wisdom += skill.get("ability_mod", 0)
            if skill.get("proficiency") != "none":
                passive_wisdom += info.get("proficiency_bonus", 0)
            break

    return passive_wisdom


def get_spells(character_data: Dict[str, Any]) -> Spells:
    """Extract spells from character data.

    Args:
        character_data: Raw character data from API.

    Returns:
        Spells object with all spell data organized by level.
    """
    spells = Spells(
        cantrips=SpellList(slots=0, list=[]),
        level_1=SpellList(slots=0, list=[]),
        level_2=SpellList(slots=0, list=[]),
        level_3=SpellList(slots=0, list=[]),
        level_4=SpellList(slots=0, list=[]),
        level_5=SpellList(slots=0, list=[]),
        level_6=SpellList(slots=0, list=[]),
        known_spells=0,
        known_cantrips=0,
    )

    for spell_book in character_data.get("spell_books", []):
        # Add spell slots
        for level, total in spell_book.get("current_level_slots", {}).items():
            if not level.isdigit():
                continue
            level_key = f"level_{level}"
            if hasattr(spells, level_key):
                spell_list_obj = getattr(spells, level_key)
                spell_list_obj.slots += int(total) if total else 0

        # Update known spells count
        spells.known_spells += spell_book.get("known_spells") or 0
        spells.known_cantrips += spell_book.get("cantrips") or 0

        # Add individual spells
        for spell_level_data in spell_book.get("spells", []):
            # spell_level_data is a tuple: (level_int, [spell_list])
            if len(spell_level_data) < 2:
                continue

            spell_list = spell_level_data[1]
            for spell in spell_list:
                spell_level = spell.get("level", 0)
                level_key = "cantrips" if spell_level == 0 else f"level_{spell_level}"

                if not hasattr(spells, level_key):
                    continue

                spell_dict = {
                    "level": "Truco" if spell_level == 0 else spell_level,
                    "name": spell.get("name", ""),
                    "school": spell.get("spell_school_name", ""),
                    "casting_time": spell.get("casting_time", ""),
                    "duration": spell.get("duration", ""),
                    "range": spell.get("range", ""),
                    "components": spell.get("short_components", ""),
                    "description": _process_spell_description(
                        spell.get("description", "")
                    ),
                }

                getattr(spells, level_key).list.append(spell_dict)

    return spells


def _process_spell_description(description: str) -> str:
    """Process spell description from markdown to HTML.

    Args:
        description: Markdown description.

    Returns:
        HTML formatted description.
    """
    if not description:
        return ""

    html = markdown(description, extensions=["extra"])
    html = html.replace('<a href="/', '<a href="https://nivel20.com/')
    return html


def get_feats_and_traits(character_data: Dict[str, Any]) -> List[FeatsAndTraits]:
    """Extract feats and traits from character data.

    Args:
        character_data: Raw character data from API.

    Returns:
        List of FeatsAndTraits objects.
    """
    feats_list = []

    # Add race feats
    race_feats = FeatsAndTraits(
        origin=character_data.get("info", {}).get("subrace_name", ""), list=[]
    )
    for feat in character_data.get("race_feats", []):
        race_feats.list.append(_create_feat_from_data(feat))
    feats_list.append(race_feats)

    # Add class feats
    for profession in character_data.get("professions", []):
        class_feats = FeatsAndTraits(origin=profession.get("name", ""), list=[])
        for feat in profession.get("feats", []):
            class_feats.list.append(_create_feat_from_data(feat))
        feats_list.append(class_feats)

    return feats_list


def _create_feat_from_data(feat_data: Dict[str, Any]) -> Feat:
    """Create a Feat object from API data.

    Args:
        feat_data: Raw feat data from API.

    Returns:
        Feat object.
    """
    description = feat_data.get("description", "")
    summary = feat_data.get("summary", "")

    if description:
        description = markdown(description, extensions=["extra"])
        description = description.replace("<p>", '<p style="margin-bottom: 0.3rem;">')
        description = description.replace('<a href="/', '<a href="https://nivel20.com/')

    if summary:
        summary = markdown(summary, extensions=["extra"])
        summary = summary.replace("<p>", '<p style="margin-bottom: 0.3rem;">')
        summary = summary.replace('<a href="/', '<a href="https://nivel20.com/')

    return Feat(
        name=feat_data.get("name", ""),
        description=description,
        summary=summary,
    )

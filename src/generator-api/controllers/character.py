import os
from jinja2 import Template
import requests
from typing import Union
from markdown import markdown
from logger import logger
from models.character import Character, Background, FeatsAndTraits, Feat, Fields, Class
from controllers.exceptions import Nivel20APIError, ConvertCharacterError, InvalidURL


def validate_url(func):
    def wrapper(*args, **kwargs):
        if "nivel20.com" not in str(args[0]):
            raise InvalidURL()
        return func(*args, **kwargs)

    return wrapper


@validate_url
def get_base_character(character_url: str) -> Union[dict, None]:
    """Obtiene un personaje de Nivel20."""
    try:
        # Primero hay que resolver la url que nos llega ya que hace un redirect.
        response = requests.head(character_url, allow_redirects=True)
        response.raise_for_status()
        character_url = response.url
        json_url = character_url + ".json"
        response = requests.get(json_url)
        response.raise_for_status()
        character = response.json().get("printable_hash")
        return character
    except requests.HTTPError as e:
        logger.warning(f"Error HTTP al obtener el personaje: {e}")
        raise Nivel20APIError(
            "Error al obtener el personaje. Verifica que la URL sea correcta."
        )
    except Exception as e:
        logger.error(f"Error al obtener el personaje: {e}")
        raise Exception("Error desconocido al obtener el personaje.")


@validate_url
def convert_to_character(character_url) -> Character:
    """Convierte un personaje de Nivel20 en un objeto Character."""
    try:
        character_data = get_base_character(character_url)
        background = Background(**character_data.get("background"))
        fields = Fields(**character_data.get("fields"))
        feats_and_traits = get_feats_and_traits(character_data)
        character = Character(
            name=character_data.get("info").get("name"),
            player_name=character_data.get("info").get("player"),
            race=character_data.get("info").get("race"),
            classes=[
                Class(**profession) for profession in character_data.get("professions")
            ],
            level=character_data.get("info").get("level"),
            background=background,
            fields=fields,
            image=character_data.get("info").get("image_url"),
            abilities=get_abilities(character_data),
            saving_throws=get_saving_throws(character_data),
            skills=get_skills(character_data),
            attacks=get_attacks(character_data),
            equipment=get_equipment(character_data),
            proficiencies=get_proficiencies(character_data),
            passive_wisdom=get_passive_wisdom(character_data),
            proficiency_bonus=character_data.get("info").get("proficiency_bonus"),
            armor_class=character_data.get("armor").get("normal"),
            initiative=character_data.get("initiative").get("total"),
            speed=character_data.get("speed").get("total"),
            max_hit_points=character_data.get("info").get("hit_points"),
            hit_dice=f"{character_data.get('professions')[-1].get('level')}d{character_data.get('professions')[-1].get('hit_points_dice')}"
            if character_data.get("professions")
            else "",
            spellcasting_ability=character_data.get("spell_books")[-1].get(
                "spell_ability_name"
            )
            if character_data.get("spell_books")
            else "",
            spell_save_dc=character_data.get("spell_books")[-1].get("spell_save_dc")
            if character_data.get("spell_books")
            else 0,
            spell_attack_bonus=character_data.get("spell_books")[-1].get(
                "spell_attack_bonus"
            )
            if character_data.get("spell_books")
            else 0,
            spells=get_spells(character_data),
            feats_and_traits=feats_and_traits,
        )
        return character
    except Exception as e:
        logger.error(f"Error al convertir el personaje: {e}")
        raise ConvertCharacterError("Error en el proceso de conversión del personaje.")


def create_sheet(character: Character) -> str:
    """Renderiza un personaje en HTML."""
    try:
        # "./templates/index.html.tpl"
        template_path = os.path.join(
            os.path.dirname(__file__), "..", "templates", "index.html.tpl"
        )
        with open(template_path, "r", encoding="utf-8") as file:
            template_content = file.read()
        template = Template(template_content)
        return template.render(character=character)
    except Exception as e:
        logger.error(f"Error al renderizar el personaje: {e}")
        raise Exception("Error al renderizar el personaje")


def get_abilities(character: dict) -> dict:
    """Obtiene las habilidades de un personaje."""
    abilities = dict(
        strength=next(
            (
                dict(
                    total=ability.get("total"),
                    modifier=f"+{ability.get('mod')}"
                    if ability.get("mod") > 0
                    else ability.get("mod"),
                )
                for ability in character.get("abilities")
                if ability.get("name") == "Fuerza"
            ),
            None,
        ),
        dexterity=next(
            (
                dict(
                    total=ability.get("total"),
                    modifier=f"+{ability.get('mod')}"
                    if ability.get("mod") > 0
                    else ability.get("mod"),
                )
                for ability in character.get("abilities")
                if ability.get("name") == "Destreza"
            ),
            None,
        ),
        constitution=next(
            (
                dict(
                    total=ability.get("total"),
                    modifier=f"+{ability.get('mod')}"
                    if ability.get("mod") > 0
                    else ability.get("mod"),
                )
                for ability in character.get("abilities")
                if ability.get("name") == "Constitución"
            ),
            None,
        ),
        intelligence=next(
            (
                dict(
                    total=ability.get("total"),
                    modifier=f"+{ability.get('mod')}"
                    if ability.get("mod") > 0
                    else ability.get("mod"),
                )
                for ability in character.get("abilities")
                if ability.get("name") == "Inteligencia"
            ),
            None,
        ),
        wisdom=next(
            (
                dict(
                    total=ability.get("total"),
                    modifier=f"+{ability.get('mod')}"
                    if ability.get("mod") > 0
                    else ability.get("mod"),
                )
                for ability in character.get("abilities")
                if ability.get("name") == "Sabiduría"
            ),
            None,
        ),
        charisma=next(
            (
                dict(
                    total=ability.get("total"),
                    modifier=f"+{ability.get('mod')}"
                    if ability.get("mod") > 0
                    else ability.get("mod"),
                )
                for ability in character.get("abilities")
                if ability.get("name") == "Carisma"
            ),
            None,
        ),
    )
    return abilities


def get_saving_throws(character: dict) -> dict:
    """Obtiene los saving throws de un personaje."""
    saving_throws = dict(
        strength=next(
            (
                {
                    "proficiency": (
                        ability.get("saving_throw").get("proficiency") != "none"
                    ),
                    "value": f"+{ability.get('saving_throw').get('total')}"
                    if ability.get("saving_throw").get("total") > 0
                    else ability.get("saving_throw").get("total"),
                }
                for ability in character.get("abilities")
                if ability.get("name") == "Fuerza"
            ),
            None,
        ),
        dexterity=next(
            (
                {
                    "proficiency": (
                        ability.get("saving_throw").get("proficiency") != "none"
                    ),
                    "value": f"+{ability.get('saving_throw').get('total')}"
                    if ability.get("saving_throw").get("total") > 0
                    else ability.get("saving_throw").get("total"),
                }
                for ability in character.get("abilities")
                if ability.get("name") == "Destreza"
            ),
            None,
        ),
        constitution=next(
            (
                {
                    "proficiency": (
                        ability.get("saving_throw").get("proficiency") != "none"
                    ),
                    "value": f"+{ability.get('saving_throw').get('total')}"
                    if ability.get("saving_throw").get("total") > 0
                    else ability.get("saving_throw").get("total"),
                }
                for ability in character.get("abilities")
                if ability.get("name") == "Constitución"
            ),
            None,
        ),
        intelligence=next(
            (
                {
                    "proficiency": (
                        ability.get("saving_throw").get("proficiency") != "none"
                    ),
                    "value": f"+{ability.get('saving_throw').get('total')}"
                    if ability.get("saving_throw").get("total") > 0
                    else ability.get("saving_throw").get("total"),
                }
                for ability in character.get("abilities")
                if ability.get("name") == "Inteligencia"
            ),
            None,
        ),
        wisdom=next(
            (
                {
                    "proficiency": (
                        ability.get("saving_throw").get("proficiency") != "none"
                    ),
                    "value": f"+{ability.get('saving_throw').get('total')}"
                    if ability.get("saving_throw").get("total") > 0
                    else ability.get("saving_throw").get("total"),
                }
                for ability in character.get("abilities")
                if ability.get("name") == "Sabiduría"
            ),
            None,
        ),
        charisma=next(
            (
                {
                    "proficiency": (
                        ability.get("saving_throw").get("proficiency") != "none"
                    ),
                    "value": f"+{ability.get('saving_throw').get('total')}"
                    if ability.get("saving_throw").get("total") > 0
                    else ability.get("saving_throw").get("total"),
                }
                for ability in character.get("abilities")
                if ability.get("name") == "Carisma"
            ),
            None,
        ),
    )
    return saving_throws


def get_skills(character: dict) -> dict:
    """Obtiene las habilidades de un personaje."""
    skills = dict(
        acrobatics=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Acrobacias"
            ),
            None,
        ),
        animal_handling=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Trato con animales"
            ),
            None,
        ),
        arcana=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Arcanos"
            ),
            None,
        ),
        athletics=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Atletismo"
            ),
            None,
        ),
        deception=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Engañar"
            ),
            None,
        ),
        history=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Historia"
            ),
            None,
        ),
        insight=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Perspicacia"
            ),
            None,
        ),
        intimidation=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Intimidar"
            ),
            None,
        ),
        investigation=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Investigación"
            ),
            None,
        ),
        medicine=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Medicina"
            ),
            None,
        ),
        nature=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Naturaleza"
            ),
            None,
        ),
        perception=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Percepción"
            ),
            None,
        ),
        performance=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Interpretación"
            ),
            None,
        ),
        persuasion=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Persuasión"
            ),
            None,
        ),
        religion=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Religión"
            ),
            None,
        ),
        sleight_of_hand=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Juego de Manos"
            ),
            None,
        ),
        stealth=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Sigilo"
            ),
            None,
        ),
        survival=next(
            (
                {
                    "proficiency": (skill.get("proficiency") != "none"),
                    "value": f"+{skill.get('total')}"
                    if skill.get("total") > 0
                    else skill.get("total"),
                }
                for skill in character.get("skills")
                if skill.get("name") == "Supervivencia"
            ),
            None,
        ),
    )
    return skills


def get_attacks(character: dict) -> list:
    """Obtiene los ataques de un personaje."""
    attacks = []
    for attack in character.get("attacks"):
        attacks.append(
            dict(
                name=attack.get("name"),
                bonus=attack.get("attack").get("to_hit").get("value"),
                damage=attack.get("attack").get("damage").get("value"),
            )
        )
    return attacks


def get_equipment(character: dict) -> list:
    """Obtiene el equipo de un personaje."""
    equipment = []
    for item in character.get("items").get("armaduras"):
        equipment.append(
            f"{item.get('name')} {'CA ' + item.get('armor').get('value') if item.get('armor').get('value') else ''}"
        )
    for item in character.get("items").get("equipo_de_aventuras"):
        equipment.append(
            f"{item.get('name')} {'CA ' + item.get('armor').get('value') if item.get('armor').get('value') else ''}"
        )
    return equipment


def get_proficiencies(character: dict) -> str:
    """Obtiene las proficiencias de un personaje."""
    proficiencies = "<p>-"
    for i, proficiency in enumerate(
        character.get("proficiencies").get("item_groups").get("proficient")
    ):
        proficiencies += (
            f"{proficiency}, "
            if i
            < len(character.get("proficiencies").get("item_groups").get("proficient"))
            - 1
            else f"{proficiency}</p>"
        )
    proficiencies += (
        "</p><p>-"
        if len(character.get("proficiencies").get("items").get("proficient")) > 0
        else ""
    )
    for i, proficiency in enumerate(
        character.get("proficiencies").get("items").get("proficient")
    ):
        proficiencies += (
            f"{proficiency}, "
            if i
            < len(character.get("proficiencies").get("items").get("proficient")) - 1
            else f"{proficiency}</p>"
        )

    return proficiencies


def get_passive_wisdom(character: dict) -> int:
    """Obtiene la sabiduría pasiva de un personaje."""
    # Sumar 10 al modificador de Sabiduría del personaje
    # Si el personaje tiene competencia en percepción, sumar también su bonificación por competencia
    passive_wisdom = 10
    for skill in character.get("skills"):
        if skill.get("name") == "Percepción":
            passive_wisdom += skill.get("ability_mod")
            if skill.get("proficiency") != "none":
                passive_wisdom += character.get("info").get("proficiency_bonus")
            break
    return passive_wisdom


def get_spells(character: dict) -> list:
    """Obtiene los hechizos de un personaje."""
    spells = dict(
        cantrips=dict(
            list=[],
        ),
        level_1=dict(
            slots=0,
            list=[],
        ),
        level_2=dict(
            slots=0,
            list=[],
        ),
        level_3=dict(
            slots=0,
            list=[],
        ),
        level_4=dict(
            slots=0,
            list=[],
        ),
        level_5=dict(
            slots=0,
            list=[],
        ),
        level_6=dict(
            slots=0,
            list=[],
        ),
        known_spells=0,
        known_cantrips=0,
    )
    for spell_book in character.get("spell_books"):
        for level, total in spell_book.get("current_level_slots").items():
            if not level.isdigit():
                continue
            spells[f"level_{level}"]["slots"] += int(total)
        for i in spell_book.get("spells"):
            # indice 1 es la lista de hechizos, indice 0 es el int de nivel de hechizo
            for spell in i[1]:
                spells[
                    f"level_{spell.get('level')}"
                    if spell.get("level") != 0
                    else "cantrips"
                ]["list"].append(
                    dict(
                        level=spell.get("level")
                        if spell.get("level") != 0
                        else "Truco",
                        name=spell.get("name"),
                        school=spell.get("spell_school_name"),
                        casting_time=spell.get("casting_time"),
                        duration=spell.get("duration"),
                        range=spell.get("range"),
                        components=spell.get("short_components"),
                        description=markdown(
                            # Agregamos extension de tablas y de citas (cuando se pone > asdasd)
                            spell.get("description"),
                            extensions=["extra"],
                        ).replace('<a href="/', '<a href="https://nivel20.com/')
                        if spell.get("description")
                        else "",
                    )
                )
    return spells


def get_feats_and_traits(character: dict) -> list:
    """Obtiene los rasgos y características de un personaje."""
    classes_feats = []
    for profession in character.get("professions"):
        class_feats = FeatsAndTraits(list=[], origin=profession.get("name"))
        for feat in profession.get("feats"):
            class_feats.list.append(
                Feat(
                    name=feat.get("name"),
                    description=markdown(
                        feat.get("description", ""), extensions=["extra"]
                    )
                    .replace("<p>", '<p style="margin-bottom: 0.3rem;">')
                    .replace('<a href="/', '<a href="https://nivel20.com/')
                    if feat.get("description")
                    else "",
                    summary=markdown(feat.get("summary", ""), extensions=["extra"])
                    .replace("<p>", '<p style="margin-bottom: 0.3rem;">')
                    .replace('<a href="/', '<a href="https://nivel20.com/')
                    if feat.get("summary")
                    else "",
                )
            )
        classes_feats.append(class_feats)
    race_feats = FeatsAndTraits(
        origin=character.get("info").get("subrace_name"), list=[]
    )
    for feat in character.get("race_feats"):
        race_feats.list.append(
            Feat(
                name=feat.get("name"),
                description=markdown(
                    feat.get("description", ""), extensions=["extra"]
                ).replace('<a href="/', '<a href="https://nivel20.com/')
                if feat.get("description")
                else "",
                summary=markdown(feat.get("summary", ""), extensions=["extra"]).replace(
                    '<a href="/', '<a href="https://nivel20.com/'
                )
                if feat.get("summary")
                else "",
            )
        )
    return [race_feats, class_feats]

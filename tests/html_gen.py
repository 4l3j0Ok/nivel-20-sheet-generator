from jinja2 import Template


class Character:
    def __init__(
        self,
        name,
        class_,
        level,
        background,
        race,
        alignment,
        experience,
        image,
        abilities,
        saving_throws,
        skills,
        attacks,
        equipment,
        proficiencies,
        languages,
        passive_wisdom,
        proficiency_bonus,
        armor_class,
        initiative,
        speed,
        max_hit_points,
        hit_dice,
        spellcasting_ability,
        spell_save_dc,
        spell_attack_bonus,
        spells,
        cantrips,
        traits,
    ):
        self.name = name
        self.class_ = class_
        self.level = level
        self.background = background
        self.race = race
        self.alignment = alignment
        self.experience = experience
        self.image = image
        self.abilities = abilities
        self.saving_throws = saving_throws
        self.skills = skills
        self.attacks = attacks
        self.equipment = equipment
        self.proficiencies = proficiencies
        self.languages = languages
        self.passive_wisdom = passive_wisdom
        self.proficiency_bonus = proficiency_bonus
        self.armor_class = armor_class
        self.initiative = initiative
        self.speed = speed
        self.max_hit_points = max_hit_points
        self.hit_dice = hit_dice
        self.spellcasting_ability = spellcasting_ability
        self.spell_save_dc = spell_save_dc
        self.spell_attack_bonus = spell_attack_bonus
        self.spells = spells
        self.cantrips = cantrips
        self.traits = traits


class Player:
    def __init__(self, name):
        self.name = name


# Cargar el template desde un archivo
with open("./templates/index.html.tpl", "r", encoding="utf-8") as file:
    template_content = file.read()

template = Template(template_content)

character = Character(
    name="Thrain Stormforge",
    class_="Brujo",
    level="8",
    background="Noble",
    race="Humano",
    alignment="Caótico Neutral",
    experience="15000",
    image="https://s3-eu-west-2.amazonaws.com/dungeon20/images/2797669/original-d5cf450b00db31ade5bba47049882691884e1f87.png?1740764819",
    abilities={
        "strength": {"modifier": "+2", "value": "14"},
        "dexterity": {"modifier": "+3", "value": "16"},
        "constitution": {"modifier": "+1", "value": "12"},
        "intelligence": {"modifier": "+0", "value": "10"},
        "wisdom": {"modifier": "+1", "value": "12"},
        "charisma": {"modifier": "+2", "value": "14"},
    },
    saving_throws={
        "strength": "+4",
        "dexterity": "+5",
        "constitution": "+3",
        "intelligence": "+1",
        "wisdom": "+2",
        "charisma": "+4",
    },
    skills={
        "acrobatics": "+5",
        "arcana": "+1",
        "athletics": "+4",
        "deception": "+4",
        "history": "+1",
        "insight": "+2",
        "intimidation": "+4",
        "investigation": "+1",
        "medicine": "+2",
        "nature": "+1",
        "perception": "+3",
        "performance": "+4",
        "persuasion": "+4",
        "religion": "+1",
        "sleight_of_hand": "+5",
        "stealth": "+5",
        "survival": "+3",
    },
    attacks=[
        {"name": "Espada larga", "bonus": "+5", "damage": "1d8 + 2"},
        {"name": "Arco corto", "bonus": "+5", "damage": "1d6 + 3"},
    ],
    equipment=["Espada larga", "Arco corto", "Armadura de cuero"],
    proficiencies="Espadas, Arcos, Sigilo",
    languages="Común, Élfico",
    passive_wisdom="13",
    proficiency_bonus="+3",
    armor_class="15",
    initiative="+3",
    speed="30",
    max_hit_points="38",
    hit_dice="5d10",
    spellcasting_ability="Carisma",
    spell_save_dc="13",
    spell_attack_bonus="+5",
    spells={
        "total": "5",
        "level_1": {
            "slots": "4",
            "list": [
                {
                    "level": "1",
                    "name": "Rayo ardiente",
                    "school": "Evocación",
                    "casting_time": "1 acción",
                    "duration": "Instantáneo",
                    "range": "120 pies",
                    "components": "V, S",
                    "description": "Haces 2d6 de daño de fuego a una criatura.",
                },
                {
                    "level": "1",
                    "name": "Espejismo arcano",
                    "school": "Ilusión",
                    "casting_time": "1 acción",
                    "duration": "1 minuto",
                    "range": "30 pies",
                    "components": "V, S",
                    "description": "Creas un espejismo visual que ocupa un cubo de 10 pies.",
                },
            ],
        },
        "level_2": {"slots": "3", "list": []},
        "level_3": {"slots": "0", "list": []},
        "level_4": {"slots": "0", "list": []},
        "level_5": {"slots": "0", "list": []},
        "level_6": {"slots": "0", "list": []},
    },
    cantrips={"total": "3"},
    traits=[
        {
            "name": "Visión en la oscuridad",
            "description": "Puede ver en la oscuridad hasta 60 pies.",
        },
        {
            "name": "Sangre élfica",
            "description": "Ventaja en tiradas contra encantamientos.",
        },
    ],
)

player = Player(name="Alejoide")

data = {
    "character": character,
    "player": player,
}

# Renderizar el template con los datos
rendered_html = template.render(data)

# Guardar el resultado en un archivo
with open("output.html", "w", encoding="utf-8") as output_file:
    output_file.write(rendered_html)

print("Archivo generado: output.html")

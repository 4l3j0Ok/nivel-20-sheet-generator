from jinja2 import Template
from controllers import character


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


# Cargar el template desde un archivo
with open("./templates/index.html.tpl", "r", encoding="utf-8") as file:
    template_content = file.read()

template = Template(template_content)

# Crear un personaje

character_url = "https://nivel20.com/s/yfv6zczc"
character = character.convert_to_character(character_url)
print(character.classes)
character_html = template.render(character=character)

# Guardar el personaje en un archivo

with open("./test.html", "w", encoding="utf-8") as file:
    file.write(character_html)

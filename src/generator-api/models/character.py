from dataclasses import dataclass
from typing import List
from markdown import markdown
# TODO: Agregar mas clases


class Background:
    name: str
    feat_description: str
    ideals: str
    bonds: str
    flaws: str
    traits: str

    def __init__(self, **kwargs):
        self.name = kwargs.get("name")
        self.feat_description = kwargs.get("feat_description")
        self.ideals = kwargs.get("ideals")
        self.bonds = kwargs.get("bonds")
        self.flaws = kwargs.get("flaws")
        self.traits = kwargs.get("traits")


@dataclass
class Feat:
    name: str
    description: str
    summary: str

    def __init__(self, **kwargs):
        self.name = kwargs.get("name")
        self.description = kwargs.get("description")
        self.summary = kwargs.get("summary")


class Class:
    name: str
    description: str
    archetype_name: str
    archetype_description: str
    level: int
    hit_points_dice: int
    feats: List

    def __init__(self, **kwargs):
        self.name = kwargs.get("name")
        self.description = kwargs.get("description")
        self.archetype_name = kwargs.get("archetype_name")
        self.archetype_description = kwargs.get("archetype_description")
        self.level = kwargs.get("level")
        self.hit_points_dice = kwargs.get("hit_points_dice")
        self.feats = [Feat(**feat) for feat in kwargs.get("feats")]


@dataclass
class FeatsAndTraits:
    origin: str
    list: List[Feat]


@dataclass
class Fields:
    alignment: str
    appearance: str
    age: str
    history: str
    languages: str
    notes: str
    experience_points: int
    perception: dict
    profession_save_dc: dict
    spell_attack: dict
    spell_save: dict

    def __init__(self, **kwargs):
        self.alignment = kwargs.get("alineamiento")
        self.appearance = kwargs.get("apariencia")
        self.age = kwargs.get("edad")
        self.history = (
            markdown(kwargs.get("historia")) if kwargs.get("historia") else ""
        )
        self.languages = kwargs.get("idiomas")
        self.notes = kwargs.get("notas")
        self.experience_points = kwargs.get("puntos_de_experiencia")
        self.perception = kwargs.get("perception")
        self.profession_save_dc = kwargs.get("profession_save_dc")
        self.spell_attack = kwargs.get("spell_attack")
        self.spell_save = kwargs.get("spell_save")


@dataclass
class Character:
    name: str
    player_name: str
    race: str
    classes: List[Class]
    level: int
    background: Background
    fields: Fields
    feats_and_traits: List[FeatsAndTraits]
    image: str
    abilities: List
    saving_throws: List
    skills: List
    attacks: List
    equipment: List
    proficiencies: List
    passive_wisdom: int
    proficiency_bonus: int
    armor_class: int
    initiative: int
    speed: int
    max_hit_points: int
    hit_dice: str
    spellcasting_ability: str
    spell_save_dc: int
    spell_attack_bonus: int
    spells: List

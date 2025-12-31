"""Character models for D&D sheet generation."""

from dataclasses import dataclass, field
from typing import List, Dict, Optional, Any
from markdown import markdown


@dataclass
class Ability:
    """Character ability score (Strength, Dexterity, etc.)."""

    total: int
    modifier: str


@dataclass
class Skill:
    """Character skill with proficiency."""

    proficiency: bool
    value: str


@dataclass
class Attack:
    """Character attack."""

    name: str
    bonus: str
    damage: str


@dataclass
class SpellList:
    """Spell list for a specific level."""

    slots: int = 0
    list: List[Dict[str, Any]] = field(default_factory=list)


@dataclass
class Spells:
    """Character spells organized by level."""

    cantrips: SpellList = field(default_factory=SpellList)
    level_1: SpellList = field(default_factory=SpellList)
    level_2: SpellList = field(default_factory=SpellList)
    level_3: SpellList = field(default_factory=SpellList)
    level_4: SpellList = field(default_factory=SpellList)
    level_5: SpellList = field(default_factory=SpellList)
    level_6: SpellList = field(default_factory=SpellList)
    known_spells: int = 0
    known_cantrips: int = 0

    def __iter__(self):
        """Make Spells iterable for template compatibility."""
        return iter(
            [
                "cantrips",
                "level_1",
                "level_2",
                "level_3",
                "level_4",
                "level_5",
                "level_6",
            ]
        )

    def __getitem__(self, key: str):
        """Make Spells subscriptable for template compatibility."""
        return getattr(self, key)


@dataclass
class Background:
    """Character background information."""

    name: Optional[str] = None
    feat_description: Optional[str] = None
    ideals: Optional[str] = None
    bonds: Optional[str] = None
    flaws: Optional[str] = None
    traits: Optional[str] = None

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "Background":
        """Create Background from dictionary."""
        return cls(
            name=data.get("name"),
            feat_description=data.get("feat_description"),
            ideals=data.get("ideals"),
            bonds=data.get("bonds"),
            flaws=data.get("flaws"),
            traits=data.get("traits"),
        )


@dataclass
class Feat:
    """Character feat or trait."""

    name: str
    description: str = ""
    summary: str = ""

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "Feat":
        """Create Feat from dictionary."""
        return cls(
            name=data.get("name", ""),
            description=data.get("description", ""),
            summary=data.get("summary", ""),
        )


@dataclass
class Class:
    """Character class information."""

    name: str
    description: Optional[str] = None
    archetype_name: Optional[str] = None
    archetype_description: Optional[str] = None
    level: int = 1
    hit_points_dice: int = 6
    feats: List[Feat] = field(default_factory=list)

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "Class":
        """Create Class from dictionary."""
        return cls(
            name=data.get("name", ""),
            description=data.get("description"),
            archetype_name=data.get("archetype_name"),
            archetype_description=data.get("archetype_description"),
            level=data.get("level", 1),
            hit_points_dice=data.get("hit_points_dice", 6),
            feats=[Feat.from_dict(feat) for feat in data.get("feats", [])],
        )


@dataclass
class FeatsAndTraits:
    """Collection of feats and traits from a specific origin."""

    origin: str
    list: List[Feat] = field(default_factory=list)


@dataclass
class Fields:
    """Additional character fields."""

    alignment: Optional[str] = None
    appearance: Optional[str] = None
    age: Optional[str] = None
    history: Optional[str] = None
    languages: Optional[str] = None
    notes: Optional[str] = None
    experience_points: int = 0
    perception: Dict[str, Any] = field(default_factory=dict)
    profession_save_dc: Dict[str, Any] = field(default_factory=dict)
    spell_attack: Dict[str, Any] = field(default_factory=dict)
    spell_save: Dict[str, Any] = field(default_factory=dict)

    @classmethod
    def from_dict(cls, data: Dict[str, Any]) -> "Fields":
        """Create Fields from dictionary."""
        return cls(
            alignment=data.get("alineamiento"),
            appearance=data.get("apariencia"),
            age=data.get("edad"),
            history=markdown(data.get("historia", "")) if data.get("historia") else "",
            languages=data.get("idiomas"),
            notes=data.get("notas"),
            experience_points=data.get("puntos_de_experiencia", 0),
            perception=data.get("perception", {}),
            profession_save_dc=data.get("profession_save_dc", {}),
            spell_attack=data.get("spell_attack", {}),
            spell_save=data.get("spell_save", {}),
        )


@dataclass
class Character:
    """Complete character sheet data."""

    name: str
    player_name: str
    race: str
    classes: List[Class]
    level: int
    background: Background
    fields: Fields
    feats_and_traits: List[FeatsAndTraits]
    image: str
    abilities: Dict[str, Ability]
    saving_throws: Dict[str, Skill]
    skills: Dict[str, Skill]
    attacks: List[Attack]
    equipment: List[str]
    proficiencies: str
    passive_wisdom: int
    proficiency_bonus: int
    armor_class: int
    initiative: str
    speed: int
    max_hit_points: int
    hit_dice: str
    spellcasting_ability: str
    spell_save_dc: int
    spell_attack_bonus: str
    spells: Spells

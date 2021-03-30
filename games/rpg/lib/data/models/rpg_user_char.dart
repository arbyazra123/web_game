// To parse this JSON data, do
//
//     final rpgUserChar = rpgUserCharFromJson(jsonString);

import 'dart:convert';

RpgUserChar rpgUserCharFromJson(String str) => RpgUserChar.fromJson(json.decode(str));

String rpgUserCharToJson(RpgUserChar data) => json.encode(data.toJson());

class RpgUserChar {
    RpgUserChar({
        this.characters,
    });

    List<Character> characters;

    RpgUserChar copyWith({
        List<Character> characters,
    }) => 
        RpgUserChar(
            characters: characters ?? this.characters,
        );

    factory RpgUserChar.fromJson(Map<String, dynamic> json) => RpgUserChar(
        characters: json["characters"] == null ? null : List<Character>.from(json["characters"].map((x) => Character.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "characters": characters == null ? null : List<dynamic>.from(characters.map((x) => x.toJson())),
    };
}

class Character {
    Character({
        this.currentDungeonEffect,
        this.currentDungeonId,
        this.skills,
        this.currentEquipments,
        this.dropEquipmentRate,
        this.characterClass,
        this.dropSkillRate,
        this.health,
        this.currentLevel,
        this.currentDungeon,
        this.name,
        this.id,
        this.dropItemRate,
    });

    dynamic currentDungeonEffect;
    dynamic currentDungeonId;
    List<String> skills;
    List<dynamic> currentEquipments;
    String dropEquipmentRate;
    String characterClass;
    String dropSkillRate;
    String health;
    String currentLevel;
    List<dynamic> currentDungeon;
    String name;
    String id;
    String dropItemRate;

    Character copyWith({
        dynamic currentDungeonEffect,
        dynamic currentDungeonId,
        List<String> skills,
        List<dynamic> currentEquipments,
        int dropEquipmentRate,
        String characterClass,
        String dropSkillRate,
        String health,
        String currentLevel,
        List<dynamic> currentDungeon,
        String name,
        String id,
        String dropItemRate,
    }) => 
        Character(
            currentDungeonEffect: currentDungeonEffect ?? this.currentDungeonEffect,
            currentDungeonId: currentDungeonId ?? this.currentDungeonId,
            skills: skills ?? this.skills,
            currentEquipments: currentEquipments ?? this.currentEquipments,
            dropEquipmentRate: dropEquipmentRate ?? this.dropEquipmentRate,
            characterClass: characterClass ?? this.characterClass,
            dropSkillRate: dropSkillRate ?? this.dropSkillRate,
            health: health ?? this.health,
            currentLevel: currentLevel ?? this.currentLevel,
            currentDungeon: currentDungeon ?? this.currentDungeon,
            name: name ?? this.name,
            id: id ?? this.id,
            dropItemRate: dropItemRate ?? this.dropItemRate,
        );

    factory Character.fromJson(Map<String, dynamic> json) => Character(
        currentDungeonEffect: json["current_dungeon_effect"],
        currentDungeonId: json["current_dungeon_id"],
        skills: json["skills"] == null ? null : List<String>.from(json["skills"].map((x) => x)),
        currentEquipments: json["current_equipments"] == null ? null : List<dynamic>.from(json["current_equipments"].map((x) => x)),
        dropEquipmentRate: json["drop_equipment_rate"] == null ? null : json["drop_equipment_rate"],
        characterClass: json["class"] == null ? null : json["class"],
        dropSkillRate: json["drop_skill_rate"] == null ? null : json["drop_skill_rate"],
        health: json["health"] == null ? null : json["health"],
        currentLevel: json["current_level"] == null ? null : json["current_level"],
        currentDungeon: json["current_dungeon"] == null ? null : List<dynamic>.from(json["current_dungeon"].map((x) => x)),
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
        dropItemRate: json["drop_item_rate"] == null ? null : json["drop_item_rate"],
    );

    Map<String, dynamic> toJson() => {
        "current_dungeon_effect": currentDungeonEffect,
        "current_dungeon_id": currentDungeonId,
        "skills": skills == null ? null : List<dynamic>.from(skills.map((x) => x)),
        "current_equipments": currentEquipments == null ? null : List<dynamic>.from(currentEquipments.map((x) => x)),
        "drop_equipment_rate": dropEquipmentRate == null ? null : dropEquipmentRate,
        "class": characterClass == null ? null : characterClass,
        "drop_skill_rate": dropSkillRate == null ? null : dropSkillRate,
        "health": health == null ? null : health,
        "current_level": currentLevel == null ? null : currentLevel,
        "current_dungeon": currentDungeon == null ? null : List<dynamic>.from(currentDungeon.map((x) => x)),
        "name": name == null ? null : name,
        "id": id == null ? null : id,
        "drop_item_rate": dropItemRate == null ? null : dropItemRate,
    };
}

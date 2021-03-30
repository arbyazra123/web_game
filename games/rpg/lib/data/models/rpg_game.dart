// To parse this JSON data, do
//
//     final rpgGame = rpgGameFromJson(jsonString);

import 'dart:convert';

RpgGame rpgGameFromJson(String str) => RpgGame.fromJson(json.decode(str));

String rpgGameToJson(RpgGame data) => json.encode(data.toJson());

class RpgGame {
    RpgGame({
        this.id,
        this.img,
        this.isMultiplayer,
        this.mainBgm,
        this.name,
        this.mainColors,
        this.passiveAttributes,
        this.consumableItems,
        this.skills,
        this.stats,
        this.classes,
        this.equipments,
        this.enemies,
        this.dungeons,
    });

    String id;
    String img;
    bool isMultiplayer;
    String mainBgm;
    String name;
    List<MainColor> mainColors;
    List<RpgGamePassiveAttribute> passiveAttributes;
    List<ConsumableItem> consumableItems;
    List<Skill> skills;
    List<StatElement> stats;
    List<Class> classes;
    List<Equipment> equipments;
    List<EnemyElement> enemies;
    List<Dungeon> dungeons;

    RpgGame copyWith({
        String id,
        String img,
        bool isMultiplayer,
        String mainBgm,
        String name,
        List<MainColor> mainColors,
        List<RpgGamePassiveAttribute> passiveAttributes,
        List<ConsumableItem> consumableItems,
        List<Skill> skills,
        List<StatElement> stats,
        List<Class> classes,
        List<Equipment> equipments,
        List<EnemyElement> enemies,
        List<Dungeon> dungeons,
    }) => 
        RpgGame(
            id: id ?? this.id,
            img: img ?? this.img,
            isMultiplayer: isMultiplayer ?? this.isMultiplayer,
            mainBgm: mainBgm ?? this.mainBgm,
            name: name ?? this.name,
            mainColors: mainColors ?? this.mainColors,
            passiveAttributes: passiveAttributes ?? this.passiveAttributes,
            consumableItems: consumableItems ?? this.consumableItems,
            skills: skills ?? this.skills,
            stats: stats ?? this.stats,
            classes: classes ?? this.classes,
            equipments: equipments ?? this.equipments,
            enemies: enemies ?? this.enemies,
            dungeons: dungeons ?? this.dungeons,
        );

    factory RpgGame.fromJson(Map<String, dynamic> json) => RpgGame(
        id: json["id"] == null ? null : json["id"],
        img: json["img"] == null ? null : json["img"],
        isMultiplayer: json["is_multiplayer"] == null ? null : json["is_multiplayer"],
        mainBgm: json["main_bgm"] == null ? null : json["main_bgm"],
        name: json["name"] == null ? null : json["name"],
        mainColors: json["main_colors"] == null ? null : List<MainColor>.from(json["main_colors"].map((x) => MainColor.fromJson(x))),
        passiveAttributes: json["passive_attributes"] == null ? null : List<RpgGamePassiveAttribute>.from(json["passive_attributes"].map((x) => RpgGamePassiveAttribute.fromJson(x))),
        consumableItems: json["consumable_items"] == null ? null : List<ConsumableItem>.from(json["consumable_items"].map((x) => ConsumableItem.fromJson(x))),
        skills: json["skills"] == null ? null : List<Skill>.from(json["skills"].map((x) => Skill.fromJson(x))),
        stats: json["stats"] == null ? null : List<StatElement>.from(json["stats"].map((x) => StatElement.fromJson(x))),
        classes: json["classes"] == null ? null : List<Class>.from(json["classes"].map((x) => Class.fromJson(x))),
        equipments: json["equipments"] == null ? null : List<Equipment>.from(json["equipments"].map((x) => Equipment.fromJson(x))),
        enemies: json["enemies"] == null ? null : List<EnemyElement>.from(json["enemies"].map((x) => EnemyElement.fromJson(x))),
        dungeons: json["dungeons"] == null ? null : List<Dungeon>.from(json["dungeons"].map((x) => Dungeon.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "img": img == null ? null : img,
        "is_multiplayer": isMultiplayer == null ? null : isMultiplayer,
        "main_bgm": mainBgm == null ? null : mainBgm,
        "name": name == null ? null : name,
        "main_colors": mainColors == null ? null : List<dynamic>.from(mainColors.map((x) => x.toJson())),
        "passive_attributes": passiveAttributes == null ? null : List<dynamic>.from(passiveAttributes.map((x) => x.toJson())),
        "consumable_items": consumableItems == null ? null : List<dynamic>.from(consumableItems.map((x) => x.toJson())),
        "skills": skills == null ? null : List<dynamic>.from(skills.map((x) => x.toJson())),
        "stats": stats == null ? null : List<dynamic>.from(stats.map((x) => x.toJson())),
        "classes": classes == null ? null : List<dynamic>.from(classes.map((x) => x.toJson())),
        "equipments": equipments == null ? null : List<dynamic>.from(equipments.map((x) => x.toJson())),
        "enemies": enemies == null ? null : List<dynamic>.from(enemies.map((x) => x.toJson())),
        "dungeons": dungeons == null ? null : List<dynamic>.from(dungeons.map((x) => x.toJson())),
    };
}

class Class {
    Class({
        this.id,
        this.name,
        this.description,
        this.dominantStatType,
        this.stat,
        this.color,
        this.passiveAttributes,
    });

    String id;
    String name;
    String description;
    String dominantStatType;
    StatCharMutliplierClass stat;
    String color;
    List<String> passiveAttributes;

    Class copyWith({
        String id,
        String name,
        String description,
        String dominantStatType,
        StatCharMutliplierClass stat,
        String color,
        List<String> passiveAttributes,
    }) => 
        Class(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            dominantStatType: dominantStatType ?? this.dominantStatType,
            stat: stat ?? this.stat,
            color: color ?? this.color,
            passiveAttributes: passiveAttributes ?? this.passiveAttributes,
        );

    factory Class.fromJson(Map<String, dynamic> json) => Class(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        dominantStatType: json["dominant_stat_type"] == null ? null : json["dominant_stat_type"],
        stat: json["stat"] == null ? null : StatCharMutliplierClass.fromJson(json["stat"]),
        color: json["color"] == null ? null : json["color"],
        passiveAttributes: json["passive_attributes"] == null ? null : List<String>.from(json["passive_attributes"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "dominant_stat_type": dominantStatType == null ? null : dominantStatType,
        "stat": stat == null ? null : stat.toJson(),
        "color": color == null ? null : color,
        "passive_attributes": passiveAttributes == null ? null : List<dynamic>.from(passiveAttributes.map((x) => x)),
    };
}

class StatCharMutliplierClass {
    StatCharMutliplierClass({
        this.statInt,
        this.dex,
        this.str,
        this.health,
    });

    String statInt;
    String dex;
    String str;
    String health;

    StatCharMutliplierClass copyWith({
        String statInt,
        String dex,
        String str,
        String health,
    }) => 
        StatCharMutliplierClass(
            statInt: statInt ?? this.statInt,
            dex: dex ?? this.dex,
            str: str ?? this.str,
            health: health ?? this.health,
        );

    factory StatCharMutliplierClass.fromJson(Map<String, dynamic> json) => StatCharMutliplierClass(
        statInt: json["int"] == null ? null : json["int"],
        dex: json["dex"] == null ? null : json["dex"],
        str: json["str"] == null ? null : json["str"],
        health: json["health"] == null ? null : json["health"],
    );

    Map<String, dynamic> toJson() => {
        "int": statInt == null ? null : statInt,
        "dex": dex == null ? null : dex,
        "str": str == null ? null : str,
        "health": health == null ? null : health,
    };
}

class ConsumableItem {
    ConsumableItem({
        this.name,
        this.id,
        this.type,
        this.typeSlug,
        this.cooldown,
        this.value,
        this.valueType,
        this.color,
        this.colorRef,
        this.description,
    });

    String name;
    String id;
    String type;
    String typeSlug;
    String cooldown;
    String value;
    String valueType;
    String color;
    String colorRef;
    String description;

    ConsumableItem copyWith({
        String name,
        String id,
        String type,
        String typeSlug,
        String cooldown,
        String value,
        String valueType,
        String color,
        String colorRef,
        String description,
    }) => 
        ConsumableItem(
            name: name ?? this.name,
            id: id ?? this.id,
            type: type ?? this.type,
            typeSlug: typeSlug ?? this.typeSlug,
            cooldown: cooldown ?? this.cooldown,
            value: value ?? this.value,
            valueType: valueType ?? this.valueType,
            color: color ?? this.color,
            colorRef: colorRef ?? this.colorRef,
            description: description ?? this.description,
        );

    factory ConsumableItem.fromJson(Map<String, dynamic> json) => ConsumableItem(
        name: json["name"] == null ? null : json["name"],
        id: json["id"] == null ? null : json["id"],
        type: json["type"] == null ? null : json["type"],
        typeSlug: json["type_slug"] == null ? null : json["type_slug"],
        cooldown: json["cooldown"] == null ? null : json["cooldown"],
        value: json["value"] == null ? null : json["value"],
        valueType: json["value_type"] == null ? null : json["value_type"],
        color: json["color"] == null ? null : json["color"],
        colorRef: json["color_ref"] == null ? null : json["color_ref"],
        description: json["description"] == null ? null : json["description"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "id": id == null ? null : id,
        "type": type == null ? null : type,
        "type_slug": typeSlug == null ? null : typeSlug,
        "cooldown": cooldown == null ? null : cooldown,
        "value": value == null ? null : value,
        "value_type": valueType == null ? null : valueType,
        "color": color == null ? null : color,
        "color_ref": colorRef == null ? null : colorRef,
        "description": description == null ? null : description,
    };
}

class Dungeon {
    Dungeon({
        this.id,
        this.bossId,
        this.color,
        this.currentFloor,
        this.defaultEnemyId,
        this.description,
        this.floors,
        this.miniBossId,
        this.name,
        this.scaleRatePerFloor,
        this.statCharMutliplier,
        this.statEnemyMultiplier,
    });

    String id;
    String bossId;
    String color;
    String currentFloor;
    String defaultEnemyId;
    String description;
    List<Floor> floors;
    String miniBossId;
    String name;
    String scaleRatePerFloor;
    StatCharMutliplierClass statCharMutliplier;
    StatCharMutliplierClass statEnemyMultiplier;

    Dungeon copyWith({
        String id,
        String bossId,
        String color,
        String currentFloor,
        String defaultEnemyId,
        String description,
        List<Floor> floors,
        String miniBossId,
        String name,
        String scaleRatePerFloor,
        StatCharMutliplierClass statCharMutliplier,
        StatCharMutliplierClass statEnemyMultiplier,
    }) => 
        Dungeon(
            id: id ?? this.id,
            bossId: bossId ?? this.bossId,
            color: color ?? this.color,
            currentFloor: currentFloor ?? this.currentFloor,
            defaultEnemyId: defaultEnemyId ?? this.defaultEnemyId,
            description: description ?? this.description,
            floors: floors ?? this.floors,
            miniBossId: miniBossId ?? this.miniBossId,
            name: name ?? this.name,
            scaleRatePerFloor: scaleRatePerFloor ?? this.scaleRatePerFloor,
            statCharMutliplier: statCharMutliplier ?? this.statCharMutliplier,
            statEnemyMultiplier: statEnemyMultiplier ?? this.statEnemyMultiplier,
        );

    factory Dungeon.fromJson(Map<String, dynamic> json) => Dungeon(
        id: json["id"] == null ? null : json["id"],
        bossId: json["boss_id"] == null ? null : json["boss_id"],
        color: json["color"] == null ? null : json["color"],
        currentFloor: json["current_floor"] == null ? null : json["current_floor"],
        defaultEnemyId: json["default_enemy_id"] == null ? null : json["default_enemy_id"],
        description: json["description"] == null ? null : json["description"],
        floors: json["floors"] == null ? null : List<Floor>.from(json["floors"].map((x) => Floor.fromJson(x))),
        miniBossId: json["mini_boss_id"] == null ? null : json["mini_boss_id"],
        name: json["name"] == null ? null : json["name"],
        scaleRatePerFloor: json["scale_rate_per_floor"] == null ? null : json["scale_rate_per_floor"],
        statCharMutliplier: json["stat_char_mutliplier"] == null ? null : StatCharMutliplierClass.fromJson(json["stat_char_mutliplier"]),
        statEnemyMultiplier: json["stat_enemy_multiplier"] == null ? null : StatCharMutliplierClass.fromJson(json["stat_enemy_multiplier"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "boss_id": bossId == null ? null : bossId,
        "color": color == null ? null : color,
        "current_floor": currentFloor == null ? null : currentFloor,
        "default_enemy_id": defaultEnemyId == null ? null : defaultEnemyId,
        "description": description == null ? null : description,
        "floors": floors == null ? null : List<dynamic>.from(floors.map((x) => x.toJson())),
        "mini_boss_id": miniBossId == null ? null : miniBossId,
        "name": name == null ? null : name,
        "scale_rate_per_floor": scaleRatePerFloor == null ? null : scaleRatePerFloor,
        "stat_char_mutliplier": statCharMutliplier == null ? null : statCharMutliplier.toJson(),
        "stat_enemy_multiplier": statEnemyMultiplier == null ? null : statEnemyMultiplier.toJson(),
    };
}

class Floor {
    Floor({
        this.id,
        this.level,
        this.name,
        this.acronym,
        this.description,
        this.rooms,
    });

    String id;
    String level;
    String name;
    String acronym;
    String description;
    List<Room> rooms;

    Floor copyWith({
        String id,
        String level,
        String name,
        String acronym,
        String description,
        List<Room> rooms,
    }) => 
        Floor(
            id: id ?? this.id,
            level: level ?? this.level,
            name: name ?? this.name,
            acronym: acronym ?? this.acronym,
            description: description ?? this.description,
            rooms: rooms ?? this.rooms,
        );

    factory Floor.fromJson(Map<String, dynamic> json) => Floor(
        id: json["id"] == null ? null : json["id"],
        level: json["level"] == null ? null : json["level"],
        name: json["name"] == null ? null : json["name"],
        acronym: json["acronym"] == null ? null : json["acronym"],
        description: json["description"] == null ? null : json["description"],
        rooms: json["rooms"] == null ? null : List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "level": level == null ? null : level,
        "name": name == null ? null : name,
        "acronym": acronym == null ? null : acronym,
        "description": description == null ? null : description,
        "rooms": rooms == null ? null : List<dynamic>.from(rooms.map((x) => x.toJson())),
    };
}

class Room {
    Room({
        this.id,
        this.name,
        this.event,
        this.roomEffect,
        this.enemy,
        this.rooms,
    });

    String id;
    String name;
    dynamic event;
    dynamic roomEffect;
    RoomEnemy enemy;
    List<Room> rooms;

    Room copyWith({
        String id,
        String name,
        dynamic event,
        dynamic roomEffect,
        RoomEnemy enemy,
        List<Room> rooms,
    }) => 
        Room(
            id: id ?? this.id,
            name: name ?? this.name,
            event: event ?? this.event,
            roomEffect: roomEffect ?? this.roomEffect,
            enemy: enemy ?? this.enemy,
            rooms: rooms ?? this.rooms,
        );

    factory Room.fromJson(Map<String, dynamic> json) => Room(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        event: json["event"],
        roomEffect: json["room_effect"],
        enemy: json["enemy"] == null ? null : RoomEnemy.fromJson(json["enemy"]),
        rooms: json["rooms"] == null ? null : List<Room>.from(json["rooms"].map((x) => Room.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "event": event,
        "room_effect": roomEffect,
        "enemy": enemy == null ? null : enemy.toJson(),
        "rooms": rooms == null ? null : List<dynamic>.from(rooms.map((x) => x.toJson())),
    };
}

class RoomEnemy {
    RoomEnemy({
        this.enemyId,
    });

    String enemyId;

    RoomEnemy copyWith({
        String enemyId,
    }) => 
        RoomEnemy(
            enemyId: enemyId ?? this.enemyId,
        );

    factory RoomEnemy.fromJson(Map<String, dynamic> json) => RoomEnemy(
        enemyId: json["enemy_id"] == null ? null : json["enemy_id"],
    );

    Map<String, dynamic> toJson() => {
        "enemy_id": enemyId == null ? null : enemyId,
    };
}

class EnemyElement {
    EnemyElement({
        this.id,
        this.description,
        this.color,
        this.colorRef,
        this.stat,
        this.skills,
        this.passives,
        this.name,
        this.baseHealth,
        this.baseDamage,
        this.type,
        this.dominantStatType,
    });

    String id;
    String description;
    String color;
    String colorRef;
    StatCharMutliplierClass stat;
    List<String> skills;
    Passives passives;
    String name;
    String baseHealth;
    String baseDamage;
    String type;
    String dominantStatType;

    EnemyElement copyWith({
        String id,
        String description,
        String color,
        String colorRef,
        StatCharMutliplierClass stat,
        List<String> skills,
        Passives passives,
        String name,
        String baseHealth,
        String baseDamage,
        String type,
        String dominantStatType,
    }) => 
        EnemyElement(
            id: id ?? this.id,
            description: description ?? this.description,
            color: color ?? this.color,
            colorRef: colorRef ?? this.colorRef,
            stat: stat ?? this.stat,
            skills: skills ?? this.skills,
            passives: passives ?? this.passives,
            name: name ?? this.name,
            baseHealth: baseHealth ?? this.baseHealth,
            baseDamage: baseDamage ?? this.baseDamage,
            type: type ?? this.type,
            dominantStatType: dominantStatType ?? this.dominantStatType,
        );

    factory EnemyElement.fromJson(Map<String, dynamic> json) => EnemyElement(
        id: json["id"] == null ? null : json["id"],
        description: json["description"] == null ? null : json["description"],
        color: json["color"] == null ? null : json["color"],
        colorRef: json["color_ref"] == null ? null : json["color_ref"],
        stat: json["stat"] == null ? null : StatCharMutliplierClass.fromJson(json["stat"]),
        skills: json["skills"] == null ? null : List<String>.from(json["skills"].map((x) => x)),
        passives: json["passives"] == null ? null : Passives.fromJson(json["passives"]),
        name: json["name"] == null ? null : json["name"],
        baseHealth: json["base_health"] == null ? null : json["base_health"],
        baseDamage: json["base_damage"] == null ? null : json["base_damage"],
        type: json["type"] == null ? null : json["type"],
        dominantStatType: json["dominant_stat_type"] == null ? null : json["dominant_stat_type"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "description": description == null ? null : description,
        "color": color == null ? null : color,
        "color_ref": colorRef == null ? null : colorRef,
        "stat": stat == null ? null : stat.toJson(),
        "skills": skills == null ? null : List<dynamic>.from(skills.map((x) => x)),
        "passives": passives == null ? null : passives.toJson(),
        "name": name == null ? null : name,
        "base_health": baseHealth == null ? null : baseHealth,
        "base_damage": baseDamage == null ? null : baseDamage,
        "type": type == null ? null : type,
        "dominant_stat_type": dominantStatType == null ? null : dominantStatType,
    };
}

class Passives {
    Passives({
        this.parry,
        this.addict,
        this.criticalDamage,
        this.cricialRate,
        this.vampire,
        this.shield,
        this.haste,
        this.evasion,
        this.accuracy,
    });

    String parry;
    String addict;
    String criticalDamage;
    String cricialRate;
    String vampire;
    String shield;
    String haste;
    String evasion;
    String accuracy;

    Passives copyWith({
        String parry,
        String addict,
        String criticalDamage,
        String cricialRate,
        String vampire,
        String shield,
        String haste,
        String evasion,
        String accuracy,
    }) => 
        Passives(
            parry: parry ?? this.parry,
            addict: addict ?? this.addict,
            criticalDamage: criticalDamage ?? this.criticalDamage,
            cricialRate: cricialRate ?? this.cricialRate,
            vampire: vampire ?? this.vampire,
            shield: shield ?? this.shield,
            haste: haste ?? this.haste,
            evasion: evasion ?? this.evasion,
            accuracy: accuracy ?? this.accuracy,
        );

    factory Passives.fromJson(Map<String, dynamic> json) => Passives(
        parry: json["parry"] == null ? null : json["parry"],
        addict: json["addict"] == null ? null : json["addict"],
        criticalDamage: json["critical_damage"] == null ? null : json["critical_damage"],
        cricialRate: json["cricial_rate"] == null ? null : json["cricial_rate"],
        vampire: json["vampire"] == null ? null : json["vampire"],
        shield: json["shield"] == null ? null : json["shield"],
        haste: json["haste"] == null ? null : json["haste"],
        evasion: json["evasion"] == null ? null : json["evasion"],
        accuracy: json["accuracy"] == null ? null : json["accuracy"],
    );

    Map<String, dynamic> toJson() => {
        "parry": parry == null ? null : parry,
        "addict": addict == null ? null : addict,
        "critical_damage": criticalDamage == null ? null : criticalDamage,
        "cricial_rate": cricialRate == null ? null : cricialRate,
        "vampire": vampire == null ? null : vampire,
        "shield": shield == null ? null : shield,
        "haste": haste == null ? null : haste,
        "evasion": evasion == null ? null : evasion,
        "accuracy": accuracy == null ? null : accuracy,
    };
}

class Equipment {
    Equipment({
        this.type,
        this.color,
        this.colorRef,
        this.description,
        this.name,
        this.rate,
        this.trigger,
        this.triggerType,
        this.rateType,
        this.id,
        this.dominantStatType,
        this.stat,
        this.passiveAttributes,
    });

    String type;
    String color;
    String colorRef;
    String description;
    String name;
    String rate;
    String trigger;
    String triggerType;
    String rateType;
    String id;
    String dominantStatType;
    StatCharMutliplierClass stat;
    List<EquipmentPassiveAttribute> passiveAttributes;

    Equipment copyWith({
        String type,
        String color,
        String colorRef,
        String description,
        String name,
        String rate,
        String trigger,
        String triggerType,
        String rateType,
        String id,
        String dominantStatType,
        StatCharMutliplierClass stat,
        List<EquipmentPassiveAttribute> passiveAttributes,
    }) => 
        Equipment(
            type: type ?? this.type,
            color: color ?? this.color,
            colorRef: colorRef ?? this.colorRef,
            description: description ?? this.description,
            name: name ?? this.name,
            rate: rate ?? this.rate,
            trigger: trigger ?? this.trigger,
            triggerType: triggerType ?? this.triggerType,
            rateType: rateType ?? this.rateType,
            id: id ?? this.id,
            dominantStatType: dominantStatType ?? this.dominantStatType,
            stat: stat ?? this.stat,
            passiveAttributes: passiveAttributes ?? this.passiveAttributes,
        );

    factory Equipment.fromJson(Map<String, dynamic> json) => Equipment(
        type: json["type"] == null ? null : json["type"],
        color: json["color"] == null ? null : json["color"],
        colorRef: json["color_ref"] == null ? null : json["color_ref"],
        description: json["description"] == null ? null : json["description"],
        name: json["name"] == null ? null : json["name"],
        rate: json["rate"] == null ? null : json["rate"],
        trigger: json["trigger"] == null ? null : json["trigger"],
        triggerType: json["trigger_type"] == null ? null : json["trigger_type"],
        rateType: json["rate_type"] == null ? null : json["rate_type"],
        id: json["id"] == null ? null : json["id"],
        dominantStatType: json["dominant_stat_type"] == null ? null : json["dominant_stat_type"],
        stat: json["stat"] == null ? null : StatCharMutliplierClass.fromJson(json["stat"]),
        passiveAttributes: json["passive_attributes"] == null ? null : List<EquipmentPassiveAttribute>.from(json["passive_attributes"].map((x) => EquipmentPassiveAttribute.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "type": type == null ? null : type,
        "color": color == null ? null : color,
        "color_ref": colorRef == null ? null : colorRef,
        "description": description == null ? null : description,
        "name": name == null ? null : name,
        "rate": rate == null ? null : rate,
        "trigger": trigger == null ? null : trigger,
        "trigger_type": triggerType == null ? null : triggerType,
        "rate_type": rateType == null ? null : rateType,
        "id": id == null ? null : id,
        "dominant_stat_type": dominantStatType == null ? null : dominantStatType,
        "stat": stat == null ? null : stat.toJson(),
        "passive_attributes": passiveAttributes == null ? null : List<dynamic>.from(passiveAttributes.map((x) => x.toJson())),
    };
}

class EquipmentPassiveAttribute {
    EquipmentPassiveAttribute({
        this.passiveAttributeId,
        this.value,
        this.valueType,
        this.chance,
    });

    String passiveAttributeId;
    String value;
    String valueType;
    String chance;

    EquipmentPassiveAttribute copyWith({
        String passiveAttributeId,
        String value,
        String valueType,
        String chance,
    }) => 
        EquipmentPassiveAttribute(
            passiveAttributeId: passiveAttributeId ?? this.passiveAttributeId,
            value: value ?? this.value,
            valueType: valueType ?? this.valueType,
            chance: chance ?? this.chance,
        );

    factory EquipmentPassiveAttribute.fromJson(Map<String, dynamic> json) => EquipmentPassiveAttribute(
        passiveAttributeId: json["passive_attribute_id"] == null ? null : json["passive_attribute_id"],
        value: json["value"] == null ? null : json["value"],
        valueType: json["value_type"] == null ? null : json["value_type"],
        chance: json["chance"] == null ? null : json["chance"],
    );

    Map<String, dynamic> toJson() => {
        "passive_attribute_id": passiveAttributeId == null ? null : passiveAttributeId,
        "value": value == null ? null : value,
        "value_type": valueType == null ? null : valueType,
        "chance": chance == null ? null : chance,
    };
}

class MainColor {
    MainColor({
        this.name,
        this.meaning,
        this.color,
    });

    String name;
    List<String> meaning;
    String color;

    MainColor copyWith({
        String name,
        List<String> meaning,
        String color,
    }) => 
        MainColor(
            name: name ?? this.name,
            meaning: meaning ?? this.meaning,
            color: color ?? this.color,
        );

    factory MainColor.fromJson(Map<String, dynamic> json) => MainColor(
        name: json["name"] == null ? null : json["name"],
        meaning: json["meaning"] == null ? null : List<String>.from(json["meaning"].map((x) => x)),
        color: json["color"] == null ? null : json["color"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "meaning": meaning == null ? null : List<dynamic>.from(meaning.map((x) => x)),
        "color": color == null ? null : color,
    };
}

class RpgGamePassiveAttribute {
    RpgGamePassiveAttribute({
        this.id,
        this.name,
        this.description,
        this.isHiddenDesc,
        this.type,
        this.typeSlug,
        this.color,
        this.colorRef,
        this.trigger,
        this.triggerSlug,
    });

    String id;
    String name;
    String description;
    bool isHiddenDesc;
    String type;
    String typeSlug;
    String color;
    String colorRef;
    String trigger;
    String triggerSlug;

    RpgGamePassiveAttribute copyWith({
        String id,
        String name,
        String description,
        bool isHiddenDesc,
        String type,
        String typeSlug,
        String color,
        String colorRef,
        String trigger,
        String triggerSlug,
    }) => 
        RpgGamePassiveAttribute(
            id: id ?? this.id,
            name: name ?? this.name,
            description: description ?? this.description,
            isHiddenDesc: isHiddenDesc ?? this.isHiddenDesc,
            type: type ?? this.type,
            typeSlug: typeSlug ?? this.typeSlug,
            color: color ?? this.color,
            colorRef: colorRef ?? this.colorRef,
            trigger: trigger ?? this.trigger,
            triggerSlug: triggerSlug ?? this.triggerSlug,
        );

    factory RpgGamePassiveAttribute.fromJson(Map<String, dynamic> json) => RpgGamePassiveAttribute(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        description: json["description"] == null ? null : json["description"],
        isHiddenDesc: json["is_hidden_desc"] == null ? null : json["is_hidden_desc"],
        type: json["type"] == null ? null : json["type"],
        typeSlug: json["type_slug"] == null ? null : json["type_slug"],
        color: json["color"] == null ? null : json["color"],
        colorRef: json["color_ref"] == null ? null : json["color_ref"],
        trigger: json["trigger"] == null ? null : json["trigger"],
        triggerSlug: json["trigger_slug"] == null ? null : json["trigger_slug"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "description": description == null ? null : description,
        "is_hidden_desc": isHiddenDesc == null ? null : isHiddenDesc,
        "type": type == null ? null : type,
        "type_slug": typeSlug == null ? null : typeSlug,
        "color": color == null ? null : color,
        "color_ref": colorRef == null ? null : colorRef,
        "trigger": trigger == null ? null : trigger,
        "trigger_slug": triggerSlug == null ? null : triggerSlug,
    };
}

class Skill {
    Skill({
        this.value,
        this.valueType,
        this.id,
        this.dominantStatValue,
        this.dominantStatType,
        this.dominantStatRate,
        this.name,
        this.cooldown,
        this.description,
        this.isEnemy,
        this.type,
        this.color,
        this.colorRef,
        this.typeSlug,
        this.isActive,
        this.baseDamage,
    });

    String value;
    String valueType;
    String id;
    String dominantStatValue;
    String dominantStatType;
    String dominantStatRate;
    String name;
    String cooldown;
    String description;
    bool isEnemy;
    String type;
    String color;
    String colorRef;
    String typeSlug;
    bool isActive;
    String baseDamage;

    Skill copyWith({
        String value,
        String valueType,
        String id,
        String dominantStatValue,
        String dominantStatType,
        String dominantStatRate,
        String name,
        String cooldown,
        String description,
        bool isEnemy,
        String type,
        String color,
        String colorRef,
        String typeSlug,
        bool isActive,
        String baseDamage,
    }) => 
        Skill(
            value: value ?? this.value,
            valueType: valueType ?? this.valueType,
            id: id ?? this.id,
            dominantStatValue: dominantStatValue ?? this.dominantStatValue,
            dominantStatType: dominantStatType ?? this.dominantStatType,
            dominantStatRate: dominantStatRate ?? this.dominantStatRate,
            name: name ?? this.name,
            cooldown: cooldown ?? this.cooldown,
            description: description ?? this.description,
            isEnemy: isEnemy ?? this.isEnemy,
            type: type ?? this.type,
            color: color ?? this.color,
            colorRef: colorRef ?? this.colorRef,
            typeSlug: typeSlug ?? this.typeSlug,
            isActive: isActive ?? this.isActive,
            baseDamage: baseDamage ?? this.baseDamage,
        );

    factory Skill.fromJson(Map<String, dynamic> json) => Skill(
        value: json["value"] == null ? null : json["value"],
        valueType: json["value_type"] == null ? null : json["value_type"],
        id: json["id"] == null ? null : json["id"],
        dominantStatValue: json["dominant_stat_value"] == null ? null : json["dominant_stat_value"],
        dominantStatType: json["dominant_stat_type"] == null ? null : json["dominant_stat_type"],
        dominantStatRate: json["dominant_stat_rate"] == null ? null : json["dominant_stat_rate"],
        name: json["name"] == null ? null : json["name"],
        cooldown: json["cooldown"] == null ? null : json["cooldown"],
        description: json["description"] == null ? null : json["description"],
        isEnemy: json["is_enemy"] == null ? null : json["is_enemy"],
        type: json["type"] == null ? null : json["type"],
        color: json["color"] == null ? null : json["color"],
        colorRef: json["color_ref"] == null ? null : json["color_ref"],
        typeSlug: json["type_slug"] == null ? null : json["type_slug"],
        isActive: json["is_active"] == null ? null : json["is_active"],
        baseDamage: json["base_damage"] == null ? null : json["base_damage"],
    );

    Map<String, dynamic> toJson() => {
        "value": value == null ? null : value,
        "value_type": valueType == null ? null : valueType,
        "id": id == null ? null : id,
        "dominant_stat_value": dominantStatValue == null ? null : dominantStatValue,
        "dominant_stat_type": dominantStatType == null ? null : dominantStatType,
        "dominant_stat_rate": dominantStatRate == null ? null : dominantStatRate,
        "name": name == null ? null : name,
        "cooldown": cooldown == null ? null : cooldown,
        "description": description == null ? null : description,
        "is_enemy": isEnemy == null ? null : isEnemy,
        "type": type == null ? null : type,
        "color": color == null ? null : color,
        "color_ref": colorRef == null ? null : colorRef,
        "type_slug": typeSlug == null ? null : typeSlug,
        "is_active": isActive == null ? null : isActive,
        "base_damage": baseDamage == null ? null : baseDamage,
    };
}

class StatElement {
    StatElement({
        this.name,
        this.slug,
        this.acr,
        this.color,
        this.colorRef,
        this.description,
    });

    String name;
    String slug;
    String acr;
    String color;
    String colorRef;
    String description;

    StatElement copyWith({
        String name,
        String slug,
        String acr,
        String color,
        String colorRef,
        String description,
    }) => 
        StatElement(
            name: name ?? this.name,
            slug: slug ?? this.slug,
            acr: acr ?? this.acr,
            color: color ?? this.color,
            colorRef: colorRef ?? this.colorRef,
            description: description ?? this.description,
        );

    factory StatElement.fromJson(Map<String, dynamic> json) => StatElement(
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        acr: json["acr"] == null ? null : json["acr"],
        color: json["color"] == null ? null : json["color"],
        colorRef: json["color_ref"] == null ? null : json["color_ref"],
        description: json["description"] == null ? null : json["description"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "acr": acr == null ? null : acr,
        "color": color == null ? null : color,
        "color_ref": colorRef == null ? null : colorRef,
        "description": description == null ? null : description,
    };
}

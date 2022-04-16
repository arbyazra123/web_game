import 'package:shared/shared.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GameInjector {
  static Future<void> injectRPGGame() async {
    await FirebaseFirestore.instance.collection(gameCollection).doc("rpg").set({
      "id": "3ea61aca-0419-483f-b740-5dc38080c10f",
      "img":
          "https://firebasestorage.googleapis.com/v0/b/web-game-b5d07.appspot.com/o/games%2Ffallen_king.png?alt=media&token=eda83a56-080b-4f01-be63-5fc014c67c55",
      "is_multiplayer": false,
      "main_bgm":
          "https://www.free-stock-music.com/music/alexander-nakarada-hymn-to-the-gods.mp3",
      "name": "Lets Cook",
      "route": "/rpg",
      "main_colors": [
        {
          "name": "red",
          "meaning": [
            "str",
            "power",
            "hearth",
            "love",
            "strength",
            "attack",
            "damage"
          ],
          "color": "#CF4B4B"
        },
        {
          "name": "blue",
          "meaning": ["int", "mage"],
          "color": "#42BDD8"
        },
        {
          "name": "green",
          "meaning": ["int", "mage"],
          "color": "#57996A"
        },
        {
          "name": "purple",
          "meaning": ["int", "mage", "magic", "widow"],
          "color": "#8C54FE"
        },
        {
          "name": "orange",
          "meaning": ["attack", "mage"],
          "color": "#F4A359"
        },
        {
          "name": "pink",
          "meaning": ["attack", "mage"],
          "color": "#E6318A"
        }
      ],
      "passive_attributes": [
        {
          "id": "519e544a8759",
          "name": "Super-strength",
          "description": "Skills with low accuracy will have increased power.",
          "is_hidden_desc": true,
          "type": "power_multiplier",
          "type_slug": "Power Multiplier",
          "color": "#57996A",
          "color_ref": "red",
          "trigger": "low_accuracy",
          "trigger_slug": "Low Accuracy"
        },
        {
          "id": "3802447eeb69",
          "name": "Max HP",
          "description": "Add additional HP **.",
          "is_hidden_desc": false,
          "type": "hp_adder",
          "type_slug": "Healing",
          "color_ref": "green",
          "color": "#57996A",
          "trigger": "none",
          "trigger_slug": ""
        },
        {
          "id": "47353329acbd",
          "name": "Damage Reduce",
          "description": "Reduce Damage increased with **.",
          "is_hidden_desc": false,
          "type": "damage_reducer",
          "type_slug": "Damage Reducer",
          "color": "#57996A",
          "color_ref": "yellow",
          "trigger": "enemy_hit",
          "trigger_slug": "Enemy Hit"
        }
      ],
      "consumable_items": [
        {
          "name": "Healing Potion",
          "id": "782f137fa012",
          "type": "hp_adder",
          "type_slug": "Healing",
          "cooldown": "5",
          "value": "100",
          "value_type": "value",
          "color": "#F4E285",
          "color_ref": "green",
          "description": "Will heal you with +**HP"
        }
      ],
      "skills": [
        {
          "value": "25",
          "value_type": "value",
          "id": "f80fb6d498c9",
          "dominant_stat_value": "0.5",
          "dominant_stat_type": "str",
          "dominant_stat_rate": "2.5",
          "name": "Slash",
          "cooldown": "4",
          "description": "Slashing enemy will deal ** damage",
          "is_enemy": false,
          "type": "attack",
          "color": "#57996A",
          "color_ref": "red",
          "type_slug": "Attack"
        },
        {
          "id": "399d710f47e0",
          "value": "10",
          "value_type": "value",
          "name": "Frenzy attack",
          "dominant_stat_value": "0.5",
          "dominant_stat_type": "str",
          "dominant_stat_rate": "2.5",
          "description":
              "Troll akan menyerang ** kali secara menggila di dalam satu turn",
          "is_enemy": true,
          "type": "attack",
          "type_slug": "Attack",
          "color": "#57996A",
          "color_ref": "red",
          "cooldown": "5"
        },
        {
          "dominant_stat_type": "str",
          "dominant_stat_rate": "3.0",
          "dominant_stat_value": "2.0",
          "description":
              "Bertahan dengan perisai (blok ** damage di 1 turn yang akan datang)",
          "id": "7448e90d759e",
          "name": "Shield",
          "value": "10",
          "value_type": "percentage",
          "type": "shield",
          "type_slug": "Shield",
          "is_enemy": false,
          "color": "#57996A",
          "color_ref": "blue",
          "cooldown": "1"
        },
        {
          "is_enemy": false,
          "dominant_stat_value": "0.5",
          "is_active": true,
          "dominant_stat_rate": "1.9",
          "base_damage": "20",
          "id": "7d416e0c8ea9",
          "description": "Will throw a fireball to enemy and damaged **",
          "cooldown": "0",
          "dominant_stat_type": "int",
          "type": "attack",
          "type_slug": "Attack",
          "color": "#57996A",
          "color_ref": "purple",
          "name": "fireball"
        },
        {
          "dominant_stat_type": "str",
          "is_enemy": true,
          "cooldown": "0",
          "dominant_stat_rate": "1.8",
          "dominant_stat_value": "0.7",
          "id": "df6799b2cd15",
          "description": "Will attack on an enemy with ** damage",
          "name": "Attack",
          "type": "attack",
          "type_slug": "Attack",
          "value": "18",
          "color": "#57996A",
          "color_ref": "red",
          "value_type": "value"
        },
        {
          "dominant_stat_type": "str",
          "is_enemy": false,
          "cooldown": "0",
          "dominant_stat_rate": "2",
          "dominant_stat_value": "1.5",
          "id": "150d8d7a3db5",
          "description": "Will attack on an enemy with ** damage",
          "name": "Attack",
          "type": "attack",
          "type_slug": "Attack",
          "value": "20",
          "color": "#57996A",
          "color_ref": "red",
          "value_type": "value"
        },
        {
          "dominant_stat_type": "dex",
          "is_enemy": false,
          "cooldown": "0",
          "dominant_stat_rate": "1.8",
          "dominant_stat_value": "0.7",
          "id": "54088ff1b804",
          "description": "Will accurately shooting an enemy with ** damage",
          "name": "Straight-shoot",
          "type": "attack",
          "type_slug": "Attack",
          "value": "15",
          "color": "#57996A",
          "color_ref": "pink",
          "value_type": "value"
        },
        {
          "dominant_stat_type": "str",
          "is_enemy": false,
          "cooldown": "1",
          "dominant_stat_rate": "1.8",
          "dominant_stat_value": "0.7",
          "id": "937b4eb4f3c7",
          "description": "Will defending from incoming turn, -** damage",
          "name": "Defend",
          "type": "defend",
          "type_slug": "Defend",
          "value": "10",
          "color": "#57996A",
          "color_ref": "red",
          "value_type": "percentage"
        }
      ],
      "stats": [
        {
          "name": "int",
          "slug": "Intelligence",
          "acr": "int",
          "color": "#42BDD8",
          "color_ref": "blue",
          "description": "Basic stat of everything"
        },
        {
          "name": "dex",
          "slug": "Dexterity",
          "acr": "dex",
          "color": "#57996A",
          "color_ref": "green",
          "description": "Basic stat of everything"
        },
        {
          "name": "str",
          "slug": "Strength",
          "acr": "str",
          "color": "#CF4B4B",
          "color_ref": "red",
          "description": "Basic stat of everything"
        }
      ],
      "classes": [
        {
          "id": "8e6a3d3c85ef",
          "name": "Archer",
          "description": "A Life must go on",
          "dominant_stat_type": "dex",
          "stat": {"int": "4", "dex": "12", "str": "4"},
          "color": "#57996A",
          "color_ref": "green",
          "passive_attributes": ["3802447eeb69"]
        },
        {
          "id": "678973fe40e8",
          "name": "Warrior",
          "description": "A Life must go on",
          "dominant_stat_type": "str",
          "stat": {"dex": "6", "str": "12", "int": "2"},
          "color": "#57996A",
          "color_ref": "red",
          "passive_attributes": ["519e544a8759"]
        },
        {
          "id": "deb09c483202",
          "description": "A Life must go on",
          "name": "Mage",
          "dominant_stat_type": "int",
          "stat": {"str": "3", "int": "13", "dex": "4"},
          "color": "#57996A",
          "color_ref": "blue",
          "passive_attributes": ["47353329acbd"]
        }
      ],
      "equipments": [
        {
          "type": "armor",
          "color": "#57996A",
          "color_ref": "orange",
          "description": "Menambah Strength +**",
          "name": "Cuirras Armor",
          "rate": "0",
          "trigger": "none",
          "trigger_type": "none",
          "rate_type": "none",
          "id": "54cfbb18e5b1",
          "dominant_stat_type": "str",
          "stat": {"str": "10", "dex": "0", "int": "0"},
          "passive_attributes": [
            {
              "passive_attribute_id": "3802447eeb69",
              "value": "50",
              "value_type": "value",
              "chance": "100"
            },
            {
              "passive_attribute_id": "47353329acbd",
              "value": "10",
              "value_type": "percentage",
              "chance": "100"
            }
          ]
        },
        {
          "id": "pvMx2FsL6ebeDKChGDO6",
          "description":
              "Mengkonversi Magic Damage yang diterima ke HP dengan rate ** % ",
          "type": "addict",
          "color": "#57996A",
          "color_ref": "yellow",
          "name": "Venomancer",
          "rate": "5",
          "trigger": "health_damaged",
          "trigger_type": "magical",
          "rate_type": "divide",
          "dominant_stat_type": "int",
          "stat": {"str": "0", "dex": "0", "int": "5"},
          "passive_attributes": []
        }
      ],
      "enemies": [
        {
          "id": "ff886b5609b3",
          "description": "Dilahirkan untuk menjadi Troll sejati",
          "color": "#57996A",
          "color_ref": "red",
          "stat": {"str": "7", "dex": "4", "int": "4"},
          "skills": ["df6799b2cd15", "399d710f47e0"],
          "passives": {
            "parry": "0",
            "addict": "0",
            "critical_damage": "10",
            "cricial_rate": "1",
            "vampire": "0",
            "shield": "5",
            "haste": "0",
            "evasion": "0",
            "accuracy": "95"
          },
          "name": "Troll",
          "base_health": "20",
          "base_damage": "20",
          "type": "default",
          "dominant_stat_type": "str"
        }
      ],
      "dungeons": [
        {
          "id": "f204f33c6010",
          "boss_id": "ff886b5609b3",
          "color": "#57996A",
          "current_floor": "1",
          "default_enemy_id": "ff886b5609b3",
          "description": "Hutan Gelap",
          "floors": [
            {
              "id": "4e40cb3b6291",
              "level": "1",
              "name": "1 Floor",
              "acronym": "1F",
              "description": "A place that zeuz borned",
              "rooms": [
                {
                  "id": "4ba76c3c693e",
                  "name": "Room 1 Floor 1",
                  "event": null,
                  "room_effect": null,
                  "enemy": {"enemy_id": "ff886b5609b3"},
                  "rooms": [
                    {
                      "id": "4ba76c3c693e",
                      "name": "Room 2 Floor 1",
                      "event": null,
                      "room_effect": null,
                      "enemy": {"enemy_id": "ff886b5609b3"}
                    },
                    {
                      "id": "4ba76c3c693e",
                      "name": "Room 2 Floor 1",
                      "event": null,
                      "room_effect": null,
                      "enemy": {"enemy_id": "ff886b5609b3"}
                    }
                  ]
                }
              ]
            }
          ],
          "mini_boss_id": "ff886b5609b3",
          "name": "Dark Forest",
          "scale_rate_per_floor": "2",
          "stat_char_mutliplier": {
            "dex": "1",
            "health": "1.5",
            "int": "1.8",
            "str": "1.8"
          },
          "stat_enemy_multiplier": {
            "dex": "1",
            "health": "2.5",
            "int": "1",
            "str": "1"
          }
        }
      ]
    });
    print('done inject rpg game');
  }

  static Future<void> injectLetsCookingGame() async {
    await FirebaseFirestore.instance
        .collection(gameCollection)
        .doc("lets_cook")
        .set({
      "id": "3ea61aca-0419-483f-b740-5dc38080c10f",
      "route": "/lets_cook",
      "img":
          "https://firebasestorage.googleapis.com/v0/b/web-game-b5d07.appspot.com/o/games%2Flets_cook.png?alt=media&token=483bc5da-83b6-4385-aed0-245019b9e3cf",
      "is_multiplayer": false,
      "main_bgm":
          "https://www.free-stock-music.com/music/alexander-nakarada-hymn-to-the-gods.mp3",
      "name": "Lets Cook",
    });
    print('done injectLetsCookingGame');
  }
}

import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:rpg/data/models/rpg_game.dart';
import 'package:shared/shared.dart';

class DungeonChoosingScreen extends StatefulWidget {
  @override
  _DungeonChoosingScreenState createState() => _DungeonChoosingScreenState();
}

class _DungeonChoosingScreenState extends State<DungeonChoosingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Container(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              H2Atm(
                "Select available dungeons",
              ),
              SizedBox(
                height: 10,
              ),
              _buildDungeonList(),
              SizedBox(
                height: 20,
              ),
              DefaultButtonMol(
                text: "<- BACK",
                onClick: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDungeonList() {
    var game = AppConfigProvider.of(context).gameData as RpgGame;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10.0, crossAxisCount: 2),
        itemCount: game.dungeons.length,
        itemBuilder: (context, index) {
          var data = game.dungeons[index];
          return _buildDungeonItem(
            data,
          );
        },
      ),
    );
  }

  Container _buildDungeonItem(Dungeon data) {
    return Container(
      height: 150,
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
              BorderSide(width: 1, color: AppColors.primaryColor))),
      child: Center(
        child: H3Atm(data.name),
      ),
    );
  }
}

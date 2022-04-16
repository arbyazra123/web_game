import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpg/injector.dart';
import 'package:rpg/rpg.dart';
// import 'package:flutter_screenutil/screen_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:components/components.dart';
import 'package:shared/shared.dart';
import 'package:core/core.dart';

class GamesWidget extends StatefulWidget {
  @override
  _GamesWidgetState createState() => _GamesWidgetState();
}

class _GamesWidgetState extends State<GamesWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: rpg<HomeRepository>().homeCollection.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return Center(
            child: CircularProgressIndicator(),
          );
        if (snapshot.data.docs.isEmpty)
          return Center(
            child: H2Atm("Game does not exist"),
          );
        return _buildGameList(snapshot.data.docs);
      },
    );
  }

  Widget _buildGameList(List<DocumentSnapshot> games) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.08,
            crossAxisCount:
                Dimens.width(context) > 700 && Dimens.width(context) < 1000
                    ? 3
                    : Dimens.width(context) > 1000
                        ? 5
                        : 2),
        itemCount: games.length,
        itemBuilder: (context, index) {
          var game = games[index];
          return _buildGameItem(game);
        },
      ),
    );
  }

  Widget _buildGameItem(DocumentSnapshot<Map<String, dynamic>> game) {
    // print(game.data());
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, game.data()['route'], arguments: game.id);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ImageURLAtm(
                  width: 170,
                  height: 170,
                  imageUrl: game.data()['img'],
                  fit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            MouseRegion(
              onHover: (v) {},
              child: Center(
                  child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.0),
                        Colors.black.withOpacity(0.2),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // child: Align(
                  //   alignment: Alignment.bottomCenter,
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(bottom: 20),
                  //     child: H5Atm(
                  //       game.data()['name'],
                  //       align: TextAlign.center,
                  //       style: TextStyle(color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

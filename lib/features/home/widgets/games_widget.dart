import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/screen_util.dart';
import 'package:uuid/uuid.dart';
import 'package:viewport/viewport.dart';
import 'package:web_game/components/components.dart';
import 'package:web_game/components/images/images.dart';
import 'package:web_game/shared/shared.dart';

import '../../features.dart';

class GamesWidget extends StatefulWidget {
  @override
  _GamesWidgetState createState() => _GamesWidgetState();
}

class _GamesWidgetState extends State<GamesWidget> {
  @override
  void initState() {
    super.initState();
    context.read<GamesBloc>().add(GetGames());
  }

  @override
  Widget build(BuildContext context) {
    print(Uuid().v1().split("-").join().substring(0, 6));
    print(ViewPort.of(context).aspectRatio);
    print(ViewPort.of(context).width);
    print((ViewPort.of(context).aspectRatio * 7).toInt());
    return BlocBuilder<GamesBloc, GamesState>(
      builder: (context, state) {
        if (state is GamesLoaded) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.08,
                  crossAxisCount: Dimens.width(context) > 700 &&Dimens.width(context) <1000
                      ? 3
                      : Dimens.width(context) > 1000
                          ? 5
                          : 2),
              itemCount: state.games.length,
              itemBuilder: (context, index) {
                var game = state.games[index];
                // print(game.data());
                return Container(
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
                      Center(
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
                                Colors.black.withOpacity(0.2),
                                Colors.black.withOpacity(0.8),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: H5Atm(
                                game.data()['name'],
                                align: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      )),
                      // Align(
                      //   alignment: Alignment.bottomCenter,
                      //   child: Container(
                      //     width: 150,
                      //     height: 64,
                      //     child: H5Atm(
                      //       game.data()['name'],
                      //       align: TextAlign.center,
                      //       style: TextStyle(color: Colors.white),
                      //     ),
                      //   ),
                      // )
                    ],
                  ),
                );
              },
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

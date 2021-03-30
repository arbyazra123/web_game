import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:rpg/data/game_providers/game_config_provider.dart';
import 'package:rpg/rpg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/shared.dart';

class HomeScreen extends StatefulWidget {
  final String gameId;

  const HomeScreen({Key key, this.gameId}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<InitUserBloc>().add(InitUser(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<InitUserBloc, InitUserState>(
        listener: (context, state) {
          if (state is InitUserLoaded) {
            if (state.room != null) {
              print("NULLLL");
              if (state.room.exists)
                AppConfigProvider.of(context).roomId = state.room.id;
            } else {
              print("NGGAk NULLLL");
            }
          }
        },
        builder: (context, state) {
          if (state is InitUserLoaded) {
            return Center(
              child: Container(
                width: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultButtonMol(
                      text: state.room != null ? "CONTINUE" : "START NEW GAME",
                      onClick: () => Navigator.push(
                          context,
                          RoomScreen(
                            gameId: widget.gameId,
                            room: state.room,
                          ).route()),
                    ),
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
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  
}

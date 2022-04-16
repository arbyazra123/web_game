import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rpg/data/models/models.dart';
import 'package:rpg/features/dungeon/pages/dungeon_choosing_screen.dart';
import 'package:rpg/helpers/game_data_helper.dart';
import 'package:shared/shared.dart';
import '../../../injector.dart';
import '../room.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'character_creation_screen.dart';

class RoomScreen extends StatelessWidget {
  final DocumentSnapshot room;
  final String gameId;
  const RoomScreen({Key key, this.room, this.gameId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => rpg<GameRoomBloc>(),
        ),
        BlocProvider(
          create: (context) => rpg<ChooseGameplayCharBloc>(),
        ),
      ],
      child: RoomBody(
        room: room,
        gameId: gameId,
      ),
    );
  }
}

class RoomBody extends StatefulWidget {
  final DocumentSnapshot<Map<String,dynamic>> room;
  final String gameId;
  const RoomBody({Key key, this.room, this.gameId}) : super(key: key);
  @override
  _RoomBodyState createState() => _RoomBodyState();
}

class _RoomBodyState extends State<RoomBody> {
  ChooseGameplayCharBloc _chooseGameplayCharBloc;
  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _chooseGameplayCharBloc = context.read<ChooseGameplayCharBloc>();
    _init();
  }

  void _init() {
    if (widget.room == null) {
      context.read<GameRoomBloc>().add(CreateRoom(context, widget.gameId));
    } else {
      context.read<GameRoomBloc>().add(JoinRoom(
            context: context,
            gameId: widget.gameId,
            room: widget.room,
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocConsumer<GameRoomBloc, GameRoomState>(
        listener: (context, state) {
          if (state is GameRoomLoaded) {
            AppConfigProvider.of(context).roomId = state.roomId;
            if (state.gameRoom != null) {
              _chooseGameplayCharBloc
                  .add(GetCharacters(state.gameRoom.data()['id_gameplay']));
              AppConfigProvider.of(context).gameplayId =
                  state.gameRoom.data()['id_gameplay'];
            } else {
              _chooseGameplayCharBloc
                  .add(GetCharacters(widget.room.data()['id_gameplay']));
              AppConfigProvider.of(context).gameplayId =
                  widget.room.data()['id_gameplay'];
            }
          }
        },
        builder: (context, state) {
          if (state is GameRoomLoaded) {
            //if user has room before, dont show this
            if (state.game == null) {
              return Center(
                child: H2Atm(
                  "No Data",
                ),
              );
            }
            return BlocBuilder<ChooseGameplayCharBloc, ChooseGameplayCharState>(
              builder: (context, state) {
                if (state is ChooseGameplayCharLoaded) {
                  if (!state.result.exists)
                    return Center(child: H2Atm("No Data"));
                  if (state.result.exists) {
                    print(state.result.data());
                    if (state.result.data()['data'] != null) {
                      return _buildLobby(state.result.data()['data']);
                    }
                    return _buildChooseNewCharacter(context);
                  }
                  return _buildChooseNewCharacter(context);
                }
                return Center(child: CircularProgressIndicator());
              },
            );
          }
          return Center(
              child: SizedBox(
            height: 120,
            width: 120,
            child: Image.asset(AssetPaths.loading),
          ));
        },
      ),
    );
  }

  Widget _buildLobby(Map<String, dynamic> data) {
    var gameplay = RpgUserChar.fromJson(data);
    return Center(
      child: SizedBox(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            H2Atm(
              "Select your character to play",
            ),
            SizedBox(
              height: 35,
            ),
            _buildCharList(gameplay),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 250,
              child: DefaultButtonMol(
                text: "CREATE",
                onClick: () => Navigator.push(
                    context,
                    CharacterCreationScreen(
                      gameData: AppConfigProvider.of(context).gameData,
                      gameId: AppConfigProvider.of(context).gameId,
                      chooseGameplayCharBloc: _chooseGameplayCharBloc,
                    ).route()),
              ),
            ),
            SizedBox(
              height: 30,
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

  Stack _buildCharList(RpgUserChar gameplay) {
    return Stack(
      children: [
        Container(
          height: 150,
          child: CarouselSlider.builder(
            itemCount: gameplay.characters.length,
            carouselController: buttonCarouselController,
            options: CarouselOptions(
                aspectRatio: 1.0, height: 150.0, enableInfiniteScroll: false),
            itemBuilder: (context, index, realIndex) {
              var curData = index != gameplay.characters.length
                  ? gameplay.characters[index]
                  : null;
              return index == gameplay.characters.length
                  ? _buildCharacterItem(null, context, isPlus: true)
                  : _buildCharacterItem(curData, context);
            },
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            height: 150,
            width: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.1),
                  ]),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_left,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                buttonCarouselController.animateToPage(0);
              },
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            height: 150,
            width: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.1),
                  ]),
            ),
            child: IconButton(
              icon: Icon(
                Icons.arrow_right,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                buttonCarouselController.nextPage(curve: Curves.easeInOutCirc);
              },
            ),
          ),
        ),
      ],
    );
  }

  Container _buildCharacterItem(Character curData, BuildContext context,
      {bool isPlus = false}) {
    return Container(
      height: 150,
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(
              BorderSide(width: 1, color: AppColors.primaryColor))),
      child: isPlus
          ? Center(
              child: IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () => Navigator.push(
                  context,
                  CharacterCreationScreen(
                    gameData: AppConfigProvider.of(context).gameData,
                    gameId: AppConfigProvider.of(context).gameId,
                    chooseGameplayCharBloc: _chooseGameplayCharBloc,
                  ).route()),
            ))
          : InkWell(
              onTap: () async {
                var result = await FirebaseFirestore.instance
                    .collection(gameplayCollection)
                    .doc(AppConfigProvider.of(context).gameplayId)
                    .get();
                if (result.exists) {
                  var data = Character.fromJson(result.data()['data']);
                  if (data != null) {
                    if (data.currentDungeonId == null) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DungeonChoosingScreen(),
                          ));
                    }
                  }
                } else
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 1),
                    content: H3Atm(
                      "Sorry, we still on development 🔥",
                    ),
                  ));
              },
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: H3Atm(curData.name),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: H3Atm(GameDataHelper.getClassById(
                                context, curData.characterClass)
                            .name +
                        " Lv ${curData.currentLevel ?? "0"}"),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildChooseNewCharacter(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultButtonMol(
              text: "CHOOSE NEW CHARACTER",
              onClick: () => Navigator.push(
                  context,
                  CharacterCreationScreen(
                    gameData: AppConfigProvider.of(context).gameData,
                    gameId: AppConfigProvider.of(context).gameId,
                    chooseGameplayCharBloc: _chooseGameplayCharBloc,
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
}

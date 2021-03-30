import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:rpg/components/components.dart';
import 'package:rpg/data/models/rpg_game.dart';
import 'package:rpg/helpers/game_data_helper.dart';
import 'package:shared/shared.dart';
import 'package:formz/formz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../rpg.dart';

class CharacterCreationScreen extends StatelessWidget {
  final String gameId;
  final RpgGame gameData;
  final String roomId;
  final ChooseGameplayCharBloc chooseGameplayCharBloc;
  const CharacterCreationScreen(
      {Key key,
      this.gameId,
      this.gameData,
      this.roomId,
      this.chooseGameplayCharBloc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => rpg<ChooseGameplayCharBloc>(),
        // ),
        BlocProvider(
          create: (context) => CharacterCreationCubit(gameId),
        ),
      ],
      child: _CharacterCreationScreen(
        gameData: gameData,
        gameId: gameId,
        chooseGameplayCharBloc: chooseGameplayCharBloc,
      ),
    );
  }
}

class _CharacterCreationScreen extends StatefulWidget {
  final String gameId;
  final RpgGame gameData;
  final String roomId;
  final ChooseGameplayCharBloc chooseGameplayCharBloc;
  const _CharacterCreationScreen(
      {Key key,
      this.gameId,
      this.gameData,
      this.roomId,
      this.chooseGameplayCharBloc})
      : super(key: key);
  @override
  _CharacterCreationScreenState createState() =>
      _CharacterCreationScreenState();
}

class _CharacterCreationScreenState extends State<_CharacterCreationScreen> {
  CharacterCreationCubit _bloc;
  CharacterCreationState _state;
  final jobCon = TextEditingController();
  final itemCon = TextEditingController();
  @override
  void initState() {
    super.initState();
    _bloc = context.read<CharacterCreationCubit>();
    Future.delayed(Duration.zero, () {
      AppConfigProvider.of(context).gameData = widget.gameData;
      AppConfigProvider.of(context).gameId = widget.gameId;
    });
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body: BlocConsumer<CharacterCreationCubit, CharacterCreationState>(
        listener: (context, state) {
          if (state.status.isSubmissionInProgress) {
            Utils.showLoadingDialog(context);
          }
          if (state.status.isSubmissionFailure) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              duration: Duration(seconds: 3),
              content: H3Atm(
                "a problem occured, sorry :(",
              ),
            ));
          }
          if (state.status.isSubmissionSuccess) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  content: H3Atm("Success, your character created!."),
                ))
                .closed
                .then((value) {
              widget.chooseGameplayCharBloc
                  .add(GetCharacters(AppConfigProvider.of(context).gameplayId));
              Navigator.pop(context);
            });
          }
        },
        builder: (context, state) {
          _state = state;
          return _buildBody(context);
        },
      ),
    );
  }

  Center _buildBody(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextFieldAtm(
                hasOutlineBorder: true,
                // hintText: ,
                labelText: "Name",
                onChanged: (value) => _bloc.onNameChanged(value),
                errorText:
                    _state.name.length > 0 ? null : "Name must not be null",
              ),
              SizedBox(
                height: 14,
              ),
              DefaultTextFieldAtm(
                hasOutlineBorder: true,
                labelText: _state.job != null ? "Job" : null,
                onTap: () => showJobs(context),
                errorText: _state.job != null ? null : "Job must not be null",
                controller: jobCon,
                style: _state.job != null
                    ? TextStyle(
                        color: GameDataHelper.statColor(
                            context, _state.job.dominantStatType))
                    : null,
                hintText: _state.job != null ? null : "Job",
              ),
              SizedBox(
                height: 14,
              ),
              DefaultTextFieldAtm(
                hasOutlineBorder: true,
                labelText: _state.startingItem != null ? "Starting Item" : null,
                onTap: () => showConsumableItems(context),
                controller: itemCon,
                style: _state.startingItem != null
                    ? TextStyle(
                        color: GameDataHelper.mainColor(
                            context, _state.startingItem.colorRef))
                    : null,
                hintText:
                    _state.startingItem != null ? null : "Consumbable Items",
              ),
              SizedBox(
                height: 35,
              ),
              DefaultButtonMol(
                text: "CREATE NOW",
                onClick: createChar,
              ),
              SizedBox(
                height: 100,
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

  void createChar() async {
    if (!_bloc.isValid) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: H3Atm("Ups, Check your fields!"),
      ));
      return;
    }
    print("Creating character...");
    _bloc.createCharacter(AppConfigProvider.of(context).gameplayId, context);
  }

  void showJobs(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        // barrierColor: Colors.red,
        // useRootNavigator: true,
        backgroundColor: Colors.grey[900],
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) => Container(
              height: MediaQuery.of(context).size.height * .5,
              width: 300,
              child: ClassesDialog(
                setState: setState,
                onPressed: (value) {
                  if (value == null) return;
                  _bloc.onJobChanged(value);
                  jobCon.text = value.name;
                  Navigator.pop(context);
                  print(value.name);
                },
              ),
            ),
          );
        });
  }

  void showConsumableItems(BuildContext context) async {
    showModalBottomSheet(
        context: context,
        isDismissible: true,
        isScrollControlled: true,
        backgroundColor: Colors.grey[900],
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) => Container(
              height: MediaQuery.of(context).size.height * .5,
              width: 300,
              child: ConsumableItemsDialog(
                setState: setState,
                onPressed: (value) {
                  if (value == null) return;
                  _bloc.onConsumableItemChanged(value);
                  itemCon.text = value.name;
                  print(value.colorRef);
                  Navigator.pop(context);
                  print(value.name);
                },
              ),
            ),
          );
        });
  }
}

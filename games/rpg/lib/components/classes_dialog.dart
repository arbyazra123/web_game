import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:rpg/data/models/rpg_game.dart';
import 'package:rpg/helpers/game_data_helper.dart';
import 'package:shared/shared.dart';


class ClassesDialog extends StatefulWidget {
  final ValueChanged<Class> onPressed;
  final Function setState;
  const ClassesDialog({Key key, this.onPressed, this.setState})
      : super(key: key);
  @override
  __ClassesDialogState createState() => __ClassesDialogState();
}

class __ClassesDialogState extends State<ClassesDialog> {
  TextEditingController searchController;
  Class job;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var classes = AppConfigProvider.of(context).gameData.classes;
    return WillPopScope(
      onWillPop: () async {
        widget.onPressed(null);
        return true;
      },
      child: job == null ? _buildClasses(context, classes) : _buildJobDetail(),
    );
  }

  Widget _buildClasses(
    BuildContext context,
    classes,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Choose your Class",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  widget.onPressed(null);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        DefaultDividerAtm(
          color: Colors.grey[200],
        ),
        Expanded(
          child: classes.isEmpty
              ? Center(
                  child: Text(
                  "tingkat tidak ada",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ))
              : ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  itemCount: classes.length,
                  itemBuilder: (context, index) =>
                      _buildItemTile(classes[index])),
        )
      ],
    );
  }

  Widget _buildJobDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 6, 20, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () {
                  // tabC.animateTo(0);
                  job = null;
                  setState(() {});
                },
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                job?.name ?? "",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              DefaultButtonMol(
                height: 30,
                color: Colors.green,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    H3Atm("Choose"),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.white,
                    ),
                  ],
                ),
                onClick: () => widget.onPressed(job),
              )
            ],
          ),
        ),
        DefaultDividerAtm(
          color: Colors.grey[200],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          H3Atm("Job Name"),
                          SizedBox(
                            height: 4,
                          ),
                          H2Atm(job.name),
                          SizedBox(
                            height: 16,
                          ),
                          H3Atm("Main Stat"),
                          SizedBox(
                            height: 4,
                          ),
                          H2Atm(
                            GameDataHelper.stat(context, job.dominantStatType)
                                .slug,
                            style: TextStyle(
                                color: GameDataHelper.statColor(
                                    context, job.dominantStatType)),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          H3Atm("Status"),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 150,
                                child: H2Atm(
                                  GameDataHelper.stat(context, "str").slug,
                                  style: TextStyle(
                                      color: GameDataHelper.statColor(
                                          context, "str")),
                                ),
                              ),
                              H2Atm(
                                job.stat.str,
                                style: TextStyle(
                                    color: GameDataHelper.statColor(
                                        context, "str")),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 150,
                                child: H2Atm(
                                  GameDataHelper.stat(context, "dex").slug,
                                  style: TextStyle(
                                      color: GameDataHelper.statColor(
                                          context, "dex")),
                                ),
                              ),
                              H2Atm(
                                job.stat.dex,
                                style: TextStyle(
                                    color: GameDataHelper.statColor(
                                        context, "dex")),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 150,
                                child: H2Atm(
                                  GameDataHelper.stat(context, "int").slug,
                                  style: TextStyle(
                                      color: GameDataHelper.statColor(
                                          context, "int")),
                                ),
                              ),
                              H2Atm(
                                job.stat.statInt,
                                style: TextStyle(
                                    color: GameDataHelper.statColor(
                                        context, "int")),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          H3Atm("Description"),
                          SizedBox(
                            height: 4,
                          ),
                          H2Atm(
                            job.description,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildItemTile(Class classItem) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      dense: true,
      leading: Text(
        classItem.name,
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {
        setState(() {
          job = classItem;
        });
      },
    );
  }
}

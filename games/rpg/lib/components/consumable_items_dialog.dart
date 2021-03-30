import 'package:components/components.dart';
import 'package:flutter/material.dart';
import 'package:rpg/data/models/rpg_game.dart';
import 'package:rpg/helpers/game_data_helper.dart';
import 'package:shared/shared.dart';

class ConsumableItemsDialog extends StatefulWidget {
  final ValueChanged<ConsumableItem> onPressed;
  final Function setState;
  const ConsumableItemsDialog({Key key, this.onPressed, this.setState})
      : super(key: key);
  @override
  __ClassesDialogState createState() => __ClassesDialogState();
}

class __ClassesDialogState extends State<ConsumableItemsDialog> {
  TextEditingController searchController;
  ConsumableItem selectedData;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data =
        (AppConfigProvider.of(context).gameData as RpgGame).consumableItems;
    return WillPopScope(
      onWillPop: () async {
        widget.onPressed(null);
        return true;
      },
      child: selectedData == null
          ? _buildClasses(context, data)
          : _buildJobDetail(),
    );
  }

  Widget _buildClasses(
    BuildContext context,
    List<ConsumableItem> data,
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
                "Choose starting items",
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
          child: data.isEmpty
              ? Center(
                  child: Text(
                  "tingkat tidak ada",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ))
              : ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 4),
                  itemCount: data.length,
                  itemBuilder: (context, index) => _buildItemTile(data[index])),
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
                  selectedData = null;
                  setState(() {});
                },
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                selectedData?.name ?? "",
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
                onClick: () => widget.onPressed(selectedData),
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
                          H3Atm("Item name"),
                          SizedBox(
                            height: 4,
                          ),
                          H2Atm(selectedData.name),
                          SizedBox(
                            height: 16,
                          ),
                          H3Atm("Type"),
                          SizedBox(
                            height: 4,
                          ),
                          H2Atm(
                            selectedData.typeSlug,
                            style: TextStyle(
                                color: HexColor.fromHex(selectedData.color)),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          H3Atm("Status"),
                          SizedBox(
                            height: 4,
                          ),
                          H2Atm(
                            "+"
                            "${selectedData.value}"
                            " ${GameDataHelper.attrSlug(
                              context,
                              PASSIVE_ATTR.values.firstWhere(
                                  (element) => element
                                      .toString()
                                      .contains(selectedData.type),
                                  orElse: () => null),
                            )}",
                            style: TextStyle(
                                color: HexColor.fromHex(selectedData.color)),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          H3Atm("Description"),
                          SizedBox(
                            height: 4,
                          ),
                          H2Atm(
                            selectedData.description
                                .replaceAll("**", selectedData.value),
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

  Widget _buildItemTile(ConsumableItem classItem) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20),
      dense: true,
      leading: Text(
        classItem.name,
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {
        setState(() {
          selectedData = classItem;
        });
      },
    );
  }
}

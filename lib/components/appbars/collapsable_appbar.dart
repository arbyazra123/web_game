import 'package:flutter/material.dart';
import 'package:web_game/shared/shared.dart';

class CollapsableAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      primary: true,
      expandedHeight: 120.0,
      collapsedHeight: 72,
      floating: false,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: _buildSearchField(),
      ),
      backgroundColor: AppColors.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        titlePadding: EdgeInsets.zero,
        background: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 14),
          child: Text(
            'LOGO',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.grey[100]),
          ),
        ),
        // title:
      ),
    );
  }

  Widget _buildSearchField() {
    return PreferredSize(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 14, right: 14, bottom: 12),
        child: Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  // left:  Dimens.dp16,
                  right: 8,
                  top: 12,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextFormField(
                  style: TextStyle(fontSize: 16),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    alignLabelWithHint: true,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    // isDense: true,
                    hintText: "Search",
                    hintStyle: TextStyle(fontSize: 14),
                    prefixIcon: Icon(
                      Icons.search,
                      color: AppColors.dark,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8),
              child: IconButton(
                onPressed: () {},
                icon: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 34,
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      margin:
                          EdgeInsets.only(top: 4, right: 2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      preferredSize: Size.fromHeight(10),
    );
  }
}

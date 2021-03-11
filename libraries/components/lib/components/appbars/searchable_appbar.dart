import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class SearchableAppBar extends StatelessWidget with PreferredSizeWidget {
  final BuildContext context;
  final VoidCallback onForceBack;
  final bool isHome;
  final List<Widget> actions;
  const SearchableAppBar(
      {Key key,
      this.context,
      this.onForceBack,
      this.actions,
      this.isHome = false})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: onForceBack != null ? false : true,
      elevation: 0.0,
      toolbarHeight: 60,
      backgroundColor: AppColors.primaryColor,
      leading: isHome
          ? Padding(
              padding: const EdgeInsets.only(top: 18,left: 10),
              child: SizedBox(
                height: 50,
                child: Image.asset(
                  "AssetPaths.logo",
                ),
              ),
            )
          : onForceBack != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: onForceBack,
                    padding: EdgeInsets.zero,
                  ),
                )
              : null,
      titleSpacing: onForceBack != null ? 0 : NavigationToolbar.kMiddleSpacing,
      actions: actions ??
          [
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, right:8),
              child: IconButton(
                onPressed: () {},
                icon: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Icon(
                      Icons.notifications,
                      size: 34,
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      margin:
                          EdgeInsets.only(top: 4, right:2),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                    ),
                  ],
                ),
              ),
            )
          ],
      title: _buildSearchField(),
    );
  }

  Widget _buildSearchField() {
    return PreferredSize(
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
          // onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => SearchProductPage(),)),
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
      preferredSize: Size.fromHeight(10),
    );
  }
}

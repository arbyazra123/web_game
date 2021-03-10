import 'package:flutter/material.dart';
import 'package:web_game/shared/shared.dart';

import '../components.dart';


class DefaultAppBarAtm extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final VoidCallback onForceBack;
  final List<Widget> actions;
  const DefaultAppBarAtm({Key key, this.title, this.onForceBack, this.actions})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.4,
      automaticallyImplyLeading: onForceBack != null ? false : true,
      backgroundColor: AppColors.primaryColor,
      actions: actions,
      primary: true,
      leading: onForceBack != null
          ? IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: onForceBack,
            )
          : null,
      iconTheme: IconThemeData(color: Colors.white),
      // titleSpacing: 2,
      title: Padding(
        padding: const EdgeInsets.only(top:4),
        child: H2Atm(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.4,
            fontFamily: metalista
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

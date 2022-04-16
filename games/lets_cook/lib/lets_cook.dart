library lets_cook;

import 'package:flutter/material.dart';

class LetsCookMain extends StatelessWidget {
  static const String route = "/lets_cook";
  const LetsCookMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * .7,
              height: MediaQuery.of(context).size.height * .4,
              decoration: BoxDecoration(
                  color: Colors.grey[200]!,
                  borderRadius: BorderRadius.circular(10)),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .6,
              height: MediaQuery.of(context).size.height * .3,
              decoration: BoxDecoration(
                  color: Colors.grey[300]!,
                  borderRadius: BorderRadius.circular(10)),
            ),
          ],
        ),
      ),
    );
  }
}

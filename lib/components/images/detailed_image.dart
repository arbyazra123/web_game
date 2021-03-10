import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:web_game/shared/shared.dart';

import '../components.dart';

class DetailedImage extends StatelessWidget {
  final String image;

  const DetailedImage({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
            context: context,
            barrierColor: Colors.black.withOpacity(0.8),
            builder:(context) => Dialog(
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              child: Container(
                height: 135,
                width: Dimens.width(context) * .95,
                child: PinchZoom(
                  image: ImageURLAtm(
                    radius: 0,
                    hasBorder: false,
                    width: double.maxFinite,
                    height: null,
                    fit: BoxFit.fitWidth,
                    imageUrl: image,
                  ),
                  zoomedBackgroundColor: Colors.black.withOpacity(0.8),
                  resetDuration: const Duration(milliseconds: 100),
                  maxScale: 2.5,
                ),
              ),
            ));
      },
      child: ImageURLAtm(
        radius: 0,
        hasBorder: false,
        width: double.maxFinite,
        height: null,
        imageUrl: image,
      ),
    );
  }
}

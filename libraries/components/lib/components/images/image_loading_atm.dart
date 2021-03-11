import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shared/shared.dart';

class ImageURLAtm extends StatelessWidget {
  final String imageUrl;
  final String customHeroTag;
  final bool useShimmer;
  final bool hasBorder;
  final BoxFit fit;
  final double height;
  final double radius;
  final double width;
  final Color bgColor;
  final BorderRadiusGeometry borderRadius;
  const ImageURLAtm(
      {Key key,
      this.imageUrl,
      this.useShimmer = false,
      this.height = 100,
      this.radius = 2,
      this.width = 100,
      this.fit = BoxFit.cover,
      this.customHeroTag = "",
      this.hasBorder=true, this.borderRadius, this.bgColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: bgColor??AppColors.bgScaffold,
        borderRadius:borderRadius?? BorderRadius.circular(radius),
        border: !hasBorder
            ? null
            : Border.fromBorderSide(
                BorderSide(color: AppColors.greyDark.withOpacity(0.1))),
      ),
      child: ClipRRect(
        borderRadius: borderRadius??BorderRadius.circular(radius),
        child: imageUrl != null
            ? CachedNetworkImage(
                fit: fit,
                imageUrl: imageUrl,
                placeholder: (context, url) => Center(
                  child: useShimmer
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey[200],
                          highlightColor: Colors.grey[400],
                          child: SizedBox(
                            height: height,
                            width: width,
                          ),
                        )
                      : CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) =>
                    Image.asset(AssetPaths.noAvailableImage),
              )
            : Image.asset(AssetPaths.noAvailableImage),
      ),
    );
  }
}

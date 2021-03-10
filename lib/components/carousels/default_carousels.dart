// import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:maghfirah_donation/components/images/images.dart';

import '../components.dart';

class DefaultCarousels extends StatefulWidget {
  final List items;
  final Function(int index, CarouselPageChangedReason reason) onPageChanged;
  final double height;
  const DefaultCarousels(
      {Key key, this.items, this.onPageChanged, this.height = 300})
      : super(key: key);

  @override
  _DefaultCarouselsState createState() => _DefaultCarouselsState();
}

class _DefaultCarouselsState extends State<DefaultCarousels> {
  int currentIndex = 0;
  List<Widget> get _buildItems => widget.items
      .map(
        (e) => ImageURLAtm(
          radius: 0,
          hasBorder: false,
          width: double.maxFinite,
          imageUrl: widget.items.indexOf(e).isEven
              ? "https://img.freepik.com/free-vector/flat-design-colorful-characters-welcoming_23-2148271988.jpg?size=626&ext=jpg"
              : "https://cdna.artstation.com/p/assets/images/images/013/448/640/large/kellvyn-nascimento-flat-art.jpg?1539648128",
        ),
      )
      .toList();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Stack(
        children: [
          CarouselSlider(
            items: _buildItems,
            options: CarouselOptions(
              height: widget.height,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              onPageChanged: (i, r) {
                currentIndex = i;
                if (widget.onPageChanged != null) widget.onPageChanged(i, r);
                setState(() {});
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
          _buildCarouselsIndicator()
        ],
      ),
    );
  }

  Widget _buildCarouselsIndicator() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
            children: widget.items
                .map((e) => Container(
                      width: 8,
                      height: 8,
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5.0,
                              spreadRadius: 0.1,
                              color: Colors.black.withOpacity(0.3)),
                        ],
                        color: widget.items.indexOf(e) == currentIndex
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                    ))
                .toList()),
      ),
    );
  }
}

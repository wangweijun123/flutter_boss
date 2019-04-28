import 'dart:math';

import 'package:flutter/material.dart';

class DotsIndicator extends AnimatedWidget {
  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onPageSelected;
  final Color color;

  static const double _kDotSize = 5.0;
  static const double _kMaxZoom = 2.0;
  static const double _kDotSpacing = 15.0;

  DotsIndicator(
      {this.controller, this.itemCount, this.onPageSelected, this.color: Colors.white})
      : super(listenable: controller);

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(0.0, 1.0 - ((controller.page??controller.initialPage) - index).abs())
    );
    double zoom = 1.0 + (_kMaxZoom -  1.0)*selectedness;

    return new Container(
      width: _kDotSpacing,
      child: new Material(
        color: color,
        type: MaterialType.circle,
        child: new Container(
          width: _kDotSize * zoom,
          height: _kDotSize * zoom,
          child: new InkWell(
            onTap: () => onPageSelected(index),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot)
    );
  }
}

class IndicatorViewPager extends StatefulWidget{

  final List<Widget> _pages;

   IndicatorViewPager(this._pages);


  @override
  State<StatefulWidget> createState() {
    return new IndicatorViewPagerState();
  }
}

class IndicatorViewPagerState extends State<IndicatorViewPager> {
  final _controller = new PageController();
  static const _kDuration = const Duration(microseconds: 300);
  static const _kCurve = Curves.ease;
  final _kArrowColor = Colors.black.withOpacity(0.9);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new IconTheme(
          data: new IconThemeData(color: _kArrowColor),
          child: new Stack(
            children: <Widget>[
              new PageView.builder(
                physics: new AlwaysScrollableScrollPhysics(),
                controller: _controller,
                itemBuilder: (BuildContext context, int index){
                  return widget._pages[index%widget._pages.length];
                },
              ),

              new Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: new Container(
                    padding: EdgeInsets.all(16),
                    child: new DotsIndicator(
                      controller: _controller,
                      itemCount: widget._pages.length,
                      onPageSelected: (int page){
                        _controller.animateToPage(
                            page,
                            duration: _kDuration,
                            curve: _kCurve,);
                      },
                    ),
                  ),
              ),

            ],
          ),
      ),
    );
  }
}



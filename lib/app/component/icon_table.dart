import 'package:flutter/material.dart';
//常量

const double _kTextAndIconTabHeight = 53.0;
const double _kMarginBottom = 3.0;

class IconTab extends StatefulWidget {
  final String text;
  final String icon;
  final Color color;

  const IconTab({
    Key key,
    this.text,
    this.icon,
    this.color
  }) : assert(text != null ||  icon != null || color != null), super(key:key);

  @override
  _IconTabState createState() {
    return new _IconTabState();
  }
}

class _IconTabState extends State<IconTab> {

  Widget _buildLabelText() {
    return new Text(widget.text,
      softWrap: false,
      overflow: TextOverflow.fade,
      style: TextStyle(color: widget.color),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget label = new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Container(
          child: new Image(
                    image: new AssetImage(widget.icon),
                    height: 30.0,
                    width: 30.0,
                  ),
          margin: EdgeInsets.only(bottom: _kMarginBottom),
        ),
        // 文本
        _buildLabelText(),
      ],
    );

    return new SizedBox(
      height: _kTextAndIconTabHeight,
      child: label,
    );
  }


}
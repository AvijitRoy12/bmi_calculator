import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.color, this.childCard, this.onPress, this.shape,this.borderRadius});

  final Color color;
  final Widget childCard;
  final Function onPress;
  final BoxShape shape;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: childCard,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          shape: shape,
          color: color,
        ),
      ),
    );
  }
}
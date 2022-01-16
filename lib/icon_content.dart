import 'package:flutter/material.dart';
import 'constants.dart';



class IconContent extends StatelessWidget {
  IconContent({@required this.icon, this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 90.0,
        ),
        SizedBox(
          height: 10.0,
        ),
        // Text(
        //   label,
        //   style: kLabelTextStyle,
        // ),
      ],
    );
  }
}

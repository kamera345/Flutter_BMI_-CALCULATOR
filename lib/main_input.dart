import 'package:flutter/material.dart';


class IconContent extends StatelessWidget {
  IconContent({this.icon, this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,
        size: 80.0,
        ),
        SizedBox(height: 10.0),
        Text(text,
        style: TextStyle(
          fontWeight: FontWeight.w400,
        ),),
      ],
    );
  }
}


class Reusable extends StatelessWidget {
 Reusable({this.color, this.cardChild});

 final Color color;
 final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}


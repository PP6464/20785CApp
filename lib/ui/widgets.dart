import 'package:flutter/material.dart';

Widget logo({double radius = 20.0, double padding = 0.0, double border = 2.0}) => Padding(
  padding: EdgeInsets.all(padding),
  child: Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(
        color: Colors.black,
        width: border,
      )
    ),
    child: CircleAvatar(
      radius: radius,
      foregroundImage: const AssetImage("assets/logo-transparent.png"),
      backgroundColor: Colors.white,
    ),
  ),
);
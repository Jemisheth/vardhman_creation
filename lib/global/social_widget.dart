import 'package:flutter/material.dart';
import 'package:vardhman_creation/utils/colors.dart';

Widget socialIcon(String name, String assetPath, {required VoidCallback onTap}) {
  return GestureDetector(
    onTap: onTap, // Handle tap events
    child: Column(
      children: [
        CircleAvatar(
          backgroundColor: blackColor,
          radius: 30, // This can be made responsive if needed
          child: Image.asset(
            assetPath,
            scale: 12,
            color: primaryColorShade0,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          name,
          style: TextStyle(
            color: blackColor,
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
        ),
      ],
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:vardhman_creation/utils/colors.dart';

class CommonButton extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final double? height;
  final double? width;
  final FontWeight? fontWeight;
  final Color? colorBackground;
  final BoxDecoration? decoration;
  final TextStyle? textStyle;
  final BorderRadius? borderRadius;

  const CommonButton({
    super.key,
    required this.onTap,
    required this.title,
    this.height,
    this.width,
    this.fontWeight,
    this.colorBackground,
    this.decoration,
    this.textStyle,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsiveness
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Determine if the device is in landscape mode
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    // Adjust dimensions based on orientation
    final double buttonHeight = height ?? (isLandscape ? screenHeight * 0.1 : screenHeight * 0.055);
    final double buttonWidth = width ?? (isLandscape ? screenWidth * 0.3 : screenWidth * 0.5);
    final double fontSize = isLandscape ? screenWidth * 0.035 : screenWidth * 0.045;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: buttonHeight,
        width: buttonWidth,
        decoration: decoration ??
            BoxDecoration(
              color: colorBackground ?? white,
              borderRadius: borderRadius ?? BorderRadius.circular(5), // Adjusted for consistency with the design
            ),
        child: Center(
          child: Text(
            title,
            style: textStyle ??
                TextStyle(
                  fontSize: fontSize,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  color: white, // Updated to match the design (white text on blush pink button)
                ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:linkhub/shared/themes/colors.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({super.key, this.iconColor, this.iconSize = 30.0, this.backgroundColor, this.borderRadius = 12.0});

  final Color? iconColor;
  final double iconSize;
  final Color? backgroundColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent, // Optional background color
        borderRadius: BorderRadius.circular(borderRadius), // Rounded corners
      ),
      child: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        color: iconColor ?? color4, // Default to color4 if no color is provided
        iconSize: iconSize,
        onPressed: () {
          Navigator.pop(context);
        },
        splashRadius: 24.0, // Adds a ripple effect when pressed
      ),
    );
  }
}
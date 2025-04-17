import 'package:flutter/material.dart';
import 'package:linkhub/shared/themes/colors.dart';
import 'package:linkhub/shared/themes/text.dart';

class ActionButton extends StatelessWidget {
  ActionButton({super.key, required this.title, required this.action,  this.buttonColor,  this.style,this.buttonWidth, this.height});
  String title;
  VoidCallback action;
  Color? buttonColor;
  TextStyle? style;
  double ?buttonWidth;
  double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth,
      height: height,
      child: ElevatedButton(
        onPressed: action,
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(buttonColor ?? color4)),
        child: Text(title, style: style ?? textTheme1),
      ),
    );
  }
}

class ActionButtonWithIcon extends StatelessWidget {
  ActionButtonWithIcon({
    super.key,
    required this.title,
    required this.icon,
    required this.action,
    this.buttonColor,
  });
  String title;
  IconData icon;
  VoidCallback action;
  Color? buttonColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton.icon(
          onPressed: action,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor ?? color4),
            textStyle: WidgetStateProperty.all(
              textTheme1.merge(TextStyle(color: color4)),
            ),
          ),
          icon: Icon(icon, color: Colors.white),
          label: Text(title, style: textTheme1),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokedex/common/constants/app_colours.dart';
import 'package:pokedex/common/constants/size_constants.dart';

class CardView extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color? textColour;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Alignment? textAlignment;
  final double? fontSize;

  CardView({
    required this.title,
    required this.onPressed,
    this.textColour = AppColours.DEFAULT_TEXT,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.symmetric(horizontal: 8),
    this.textAlignment = Alignment.centerLeft,
    this.fontSize = SizeConstaints.FONTSIZE_16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextButton(
        style: TextButton.styleFrom(
          primary: textColour,
          padding: padding,
          alignment: textAlignment,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: AppColours.DEFAULT_TEXT,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokedex/common/constants/app_colours.dart';

class CardView extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color? textColour;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Alignment? textAlignment;

  CardView({
    required this.title,
    required this.onPressed,
    this.textColour = AppColours.DEFAULT_TEXT,
    this.padding = const EdgeInsets.all(8),
    this.margin = const EdgeInsets.symmetric(horizontal: 8),
    this.textAlignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.amber,
          primary: textColour,
          padding: padding,
          alignment: textAlignment,
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}

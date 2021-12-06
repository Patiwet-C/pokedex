import 'package:flutter/material.dart';
import 'package:pokedex/common/constants/app_colours.dart';
import 'package:pokedex/common/constants/size_constants.dart';
import 'package:pokedex/common/constants/string_constants.dart';

class DataNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        StringConstants.NOT_FOUND,
        style: TextStyle(
          fontSize: SizeConstaints.FONTSIZE_24,
          color: AppColours.DEFAULT_TEXT,
        ),
      ),
    );
  }
}

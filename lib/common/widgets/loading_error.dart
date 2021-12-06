import 'package:flutter/material.dart';
import 'package:pokedex/common/constants/app_colours.dart';
import 'package:pokedex/common/constants/size_constants.dart';
import 'package:pokedex/common/constants/string_constants.dart';

class LoadingError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        StringConstants.LOADING_ERROR,
        style: TextStyle(
          fontSize: SizeConstaints.FONTSIZE_24,
          color: AppColours.DEFAULT_TEXT,
        ),
      ),
    );
  }
}

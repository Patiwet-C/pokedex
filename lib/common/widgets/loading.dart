import 'package:flutter/material.dart';
import 'package:pokedex/common/constants/app_colours.dart';
import 'package:pokedex/common/constants/size_constants.dart';
import 'package:pokedex/common/constants/string_constants.dart';

class Loading extends StatelessWidget {
  final String? loadingMessage;

  Loading({this.loadingMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            loadingMessage ?? StringConstants.LOADING,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColours.DEFAULT_TEXT,
              fontSize: SizeConstaints.FONTSIZE_24,
            ),
          ),
          SizedBox(
            height: 24,
          ),
          CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColours.INDICATOR_COLOUR,
            ),
          ),
        ],
      ),
    );
  }
}

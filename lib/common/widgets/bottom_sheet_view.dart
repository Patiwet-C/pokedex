import 'package:flutter/material.dart';
import 'package:pokedex/common/constants/app_colours.dart';
import 'package:pokedex/common/constants/size_constants.dart';
import 'package:pokedex/common/constants/string_constants.dart';

class BottomSheetView extends StatelessWidget {
  final String name;
  final String frontImage;
  final String backImage;
  final int weight;
  final int height;
  final String? loadingMessage;

  BottomSheetView({
    required this.name,
    required this.frontImage,
    required this.backImage,
    required this.weight,
    required this.height,
    this.loadingMessage,
  });

  Widget _renderImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
          frontImage,
          scale: SizeConstaints.SCALE_5,
        ),
        Image.network(
          backImage,
          scale: SizeConstaints.SCALE_5,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _renderDetail({required String title, required String subtitle}) {
      return Row(
        children: <Widget>[
          Text(
            title + StringConstants.COLON,
            style: TextStyle(
              fontSize: SizeConstaints.FONTSIZE_16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: SizeConstaints.FONTSIZE_16,
            ),
          ),
        ],
      );
    }

    return SafeArea(
        child: Column(
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
            color: AppColours.DEFAULT_TEXT,
            fontSize: SizeConstaints.FONTSIZE_24,
          ),
        ),
        _renderImage(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _renderDetail(
              title: StringConstants.BOTTOM_SHEET_VIEW_WEIGHT,
              subtitle: weight.toString(),
            ),
            _renderDetail(
              title: StringConstants.BOTTOM_SHEET_VIEW_HEIGHT,
              subtitle: height.toString(),
            ),
          ],
        ),
      ],
    ));
  }
}

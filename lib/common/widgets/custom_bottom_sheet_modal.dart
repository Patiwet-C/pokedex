import 'package:flutter/material.dart';
import 'package:pokedex/common/constants/app_colours.dart';
import 'package:pokedex/common/constants/size_constants.dart';

class CustomBottomSheetModal extends StatelessWidget {
  final Widget child;

  CustomBottomSheetModal({
    required this.child,
  });

  Widget _customDragBar() {
    return FractionallySizedBox(
      widthFactor: SizeConstaints.WIDTHFACTOR_4,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: SizeConstaints.MARGIN_16,
        ),
        child: Container(
          height: SizeConstaints.HEIGHT_4,
          decoration: BoxDecoration(
            color: AppColours.DEFAULT_TEXT,
            borderRadius: const BorderRadius.all(
              Radius.circular(SizeConstaints.RADIUS_4),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(SizeConstaints.RADIUS_16),
            topRight: Radius.circular(SizeConstaints.RADIUS_16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _customDragBar(),
            child,
          ],
        ),
      ),
    );
  }
}

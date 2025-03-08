import 'package:flutter/material.dart';
import 'package:graduate_plus_app/utilities/appColors.dart';
import 'package:graduate_plus_app/utilities/textStyles.dart';

Widget commonButton({required BuildContext context, required String label}) {
  return Container(
    height: 48,
    width: MediaQuery.of(context).size.width,
    color: appThemeColor,
    child: Center(child: Text(label, style: textStyleH2(whiteColor))),
  );
}

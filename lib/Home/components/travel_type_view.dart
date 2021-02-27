import 'package:flutter/material.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class TravelTypeView extends StatelessWidget {
  final IconData icons;
  final String type;
  final String content;
  const TravelTypeView({this.icons, this.type, this.content});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double widthScale = SizeConfig.blockSizeHorizontal;
    return Row(
      children: [
        Icon(
          icons,
          size: widthScale * 4,
          color: Colors.black,
        ),
        SizedBox(
          width: widthScale * 1,
        ),
        Text(
          type ?? '',
          style: jm_text_black_style14,
        ),
        SizedBox(
          width: widthScale * 1.5,
        ),
        Text(
          content ?? '',
          style: jm_text_gray_style13,
        ),
      ],
    );
  }
}

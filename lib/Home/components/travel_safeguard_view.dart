import 'package:flutter/material.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class TravelSafeguardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double widthScale = SizeConfig.blockSizeHorizontal;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Text(
              '保障',
              style: jm_text_gray_style15,
            ),
            SizedBox(
              width: widthScale * 3,
            ),
            Icon(
              Icons.security_outlined,
              size: widthScale * 5,
              color: Color(0xffe17d2f),
            ),
            SizedBox(
              width: widthScale * 1,
            ),
            Text(
              '更改则赔付 · 承诺不加价 · 取消则赔付',
              style: jm_text_black_style15,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.arrow_forward_ios_outlined,
            size: widthScale * 3,
            color: jm_text_gray,
          ),
        )
      ],
    );
  }
}

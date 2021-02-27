import 'package:flutter/material.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class TravelConfirmView extends StatelessWidget {
  final double width;
  final double margin;
  const TravelConfirmView({this.width, this.margin});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double widthScale = SizeConfig.blockSizeHorizontal;
    return Container(
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widthScale * 3)),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SizedBox(
                width: margin,
              ),
              Text(
                '二次确认',
                style: jm_text_black_bold_style16,
              ),
              SizedBox(
                width: widthScale * 1.5,
              ),
              Text(
                '拍下后需商家确认 · 确认失败退款',
                style: jm_text_gray_style13,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: width - 20,
            // height: 60,
            child: Image.asset(
              'assets/images/home/travel_confirm_img.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

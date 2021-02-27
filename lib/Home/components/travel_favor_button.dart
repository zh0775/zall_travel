import 'package:flutter/material.dart';
import 'package:zall_travel/components/CustomButton.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

enum TravelFavorButtonType {
  score,
  share,
  comment,
}

class TravelFavorButton extends StatelessWidget {
  final TravelFavorButtonType type;
  final String value;
  final Function(TravelFavorButtonType type) buttonClick;
  const TravelFavorButton({this.type, this.value, this.buttonClick});
  @override
  Widget build(BuildContext context) {
    String str = '';
    IconData iconData = Icons.favorite_border_outlined;
    switch (type) {
      case TravelFavorButtonType.comment:
        iconData = Icons.insert_comment_outlined;
        str = '评论';
        break;
      case TravelFavorButtonType.share:
        iconData = Icons.share_outlined;
        str = '分享';
        break;
      case TravelFavorButtonType.score:
        iconData = Icons.favorite_border_outlined;
        str = '非常好';
        break;
    }

    SizeConfig().init(context);
    double widthScale = SizeConfig.blockSizeHorizontal;
    return CustomButton(
      onPressed: () {
        if (buttonClick != null) {
          buttonClick(type);
        }
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            size: widthScale * 4,
            color: jm_text_gray,
          ),
          SizedBox(
            width: type != TravelFavorButtonType.share ? widthScale * 1 : 0,
          ),
          Text(
            value ?? '',
            style: jm_text_gray_style13,
          ),
          SizedBox(
            width: type != TravelFavorButtonType.comment ? widthScale * 2 : 0,
          ),
          Text(
            str ?? '',
            style: jm_text_gray_style13,
          )
        ],
      ),
    );
  }
}

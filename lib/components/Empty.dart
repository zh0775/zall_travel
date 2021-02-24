import 'package:flutter/material.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class Empty extends StatefulWidget {
  @override
  _EmptyState createState() => _EmptyState();
}

class _EmptyState extends State<Empty> {
  double widthScale;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    widthScale = SizeConfig.blockSizeHorizontal;
    return Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/home/empty.png',
              height: widthScale * 50,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '正在建设...',
              style: jm_text_gray_style18,
            )
          ],
        ));
  }
}

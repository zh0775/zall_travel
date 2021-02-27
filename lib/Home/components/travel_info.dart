import 'package:flutter/material.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class TravelInfo extends StatefulWidget {
  final Map data;
  final int index;
  final Function(int index) toBuy;
  const TravelInfo({this.data, this.toBuy, this.index});
  @override
  _TravelInfoState createState() => _TravelInfoState();
}

class _TravelInfoState extends State<TravelInfo> {
  double widthScale;
  double margin = 10;
  double selfWidth;
  double selfHeight = 100;
  double otherWidth;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    widthScale = SizeConfig.blockSizeHorizontal;
    // margin = widthScale * 6;
    selfWidth = SizeConfig.screenWidth - margin * 2;
    otherWidth = SizeConfig.screenWidth - widthScale * 65 + margin;
    return Container(
      width: widthScale * 65,
      height: selfHeight,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widthScale * 2)),
      child: Row(
        children: [
          SizedBox(
            width: margin,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(widthScale),
            child: SizedBox(
              width: selfHeight - margin * 2,
              height: selfHeight - margin * 2,
              child: Image.asset(
                'assets/images/home/${widget.data['image']}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: margin,
          ),
          Container(
            width: otherWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: margin,
                    ),
                    SizedBox(
                      // height: 60,
                      child: Text(
                        // widget.data['title'] ?? '',
                        widget.data['title'],
                        style: jm_text_black_bold_style15,
                        maxLines: 2,
                        overflow: TextOverflow.clip,
                      ),
                    ),
                  ],
                ),
                // SizedBox(
                //   height: margin,
                // ),
                Column(
                  children: [
                    SizedBox(
                      height: 25,
                      width: otherWidth,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(TextSpan(
                              text: '￥',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 12,
                              ),
                              children: [
                                TextSpan(
                                    text: '1180',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 17))
                              ])),
                          RawMaterialButton(
                            onPressed: () {
                              if (widget.toBuy != null &&
                                  widget.index != null) {
                                widget.toBuy(widget.index);
                              }
                            },
                            splashColor: Colors.transparent,
                            fillColor: Color.fromRGBO(254, 64, 33, 1),
                            elevation: 0.2,
                            highlightElevation: 1.0,
                            constraints:
                                BoxConstraints(minWidth: 70, minHeight: 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(
                              '立即购买',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: margin,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zall_travel/components/CustomButton.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class TravelEvaluateView extends StatefulWidget {
  final Map data;
  final double width;
  final Function(Map data) toEvaluateDetail;
  const TravelEvaluateView({this.data, this.toEvaluateDetail, this.width});
  @override
  _TravelEvaluateViewState createState() => _TravelEvaluateViewState();
}

class _TravelEvaluateViewState extends State<TravelEvaluateView> {
  double widthScale;
  double margin;
  double selfWidth;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    widthScale = SizeConfig.blockSizeHorizontal;
    margin = widthScale * 3;
    selfWidth = SizeConfig.screenWidth - margin * 2;
    return Container(
      width: selfWidth,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widthScale * 3)),
      child: Padding(
        padding: EdgeInsets.only(left: margin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: widget.width - margin * 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '宝贝评价' + '(' + (widget.data['count'] ?? '2') + ')',
                    style: jm_text_black_style18,
                  ),
                  CustomButton(
                    child: Row(
                      children: [
                        Text(
                          '查看全部',
                          style:
                              TextStyle(color: Colors.lightBlue, fontSize: 14),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: widthScale * 3.5,
                          color: Colors.lightBlue,
                        )
                      ],
                    ),
                    onPressed: () {
                      if (widget.toEvaluateDetail != null) {
                        widget.toEvaluateDetail(widget.data);
                      }
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: widget.width - margin * 2,
              decoration: BoxDecoration(
                  color: Color(0xfffffcf2),
                  borderRadius: BorderRadius.circular(widthScale * 3)),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: margin,
                    ),
                    Text(widget.data['score'] ?? '5.0',
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      width: widthScale * 1.5,
                    ),
                    JMline(
                      width: 1,
                      height: 35,
                      color: Color(0xffbcbcb4),
                    ),
                    SizedBox(
                      width: widthScale * 1.5,
                    ),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '超出预期',
                          style: jm_text_black_bold_style15,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            Icon(Icons.grade_rounded,
                                size: widthScale * 4, color: Color(0xfffedb32)),
                            Icon(Icons.grade_rounded,
                                size: widthScale * 4, color: Color(0xfffedb32)),
                            Icon(Icons.grade_rounded,
                                size: widthScale * 4, color: Color(0xfffedb32)),
                            Icon(Icons.grade_rounded,
                                size: widthScale * 4, color: Color(0xfffedb32)),
                            Icon(Icons.grade_rounded,
                                size: widthScale * 4, color: Color(0xfffedb32)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: widthScale * 1.5,
                    ),
                    JMline(
                      width: 1,
                      height: 35,
                      color: Color(0xffbcbcb4),
                    ),
                    SizedBox(
                      width: widthScale * 2.5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            scoreLabel(title: '描述相符', score: '5.0'),
                            SizedBox(
                              width: widthScale * 2,
                            ),
                            scoreLabel(title: '住宿体验', score: '5.0'),
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Row(
                          children: [
                            scoreLabel(title: '游玩体验', score: '5.0'),
                            SizedBox(
                              width: widthScale * 2,
                            ),
                            scoreLabel(title: '性价比', score: '5.0'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            travelCell(
                icon: widget.data['userHead'], name: widget.data['userName']),
            SizedBox(
              height: 10,
            ),
            JMline(width: widget.width - margin * 2, height: 1),
            SizedBox(
              height: 15,
            ),
            Text(
              '暂无问答',
              style: jm_text_black_style16,
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xfffd602a),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                        child: Text(
                          '问大家',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: widthScale * 3,
                    ),
                    Text(
                      '宝贝好不好，问问已买过的人',
                      style: jm_text_gray_style14,
                    )
                  ],
                ),
                Row(
                  children: [
                    CustomButton(
                      width: widthScale * 15,
                      height: 30,
                      border: BorderSide(width: 1, color: Colors.lightBlue),
                      borderRadius: BorderRadius.circular(15),
                      child: Text(
                        '去提问',
                        style: TextStyle(color: Colors.lightBlue),
                      ),
                    ),
                    SizedBox(
                      width: margin,
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  Widget scoreLabel({String title, String score}) {
    return Text.rich(TextSpan(
        text: (title ?? '') + ' ',
        style: TextStyle(color: Color(0xff5d6062), fontSize: 13),
        children: [
          TextSpan(text: score ?? '', style: jm_text_black_bold_style14),
        ]));
  }

  Widget travelCell({String icon, String name, String common}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(widthScale * 3),
                child: SizedBox(
                  width: widthScale * 6,
                  height: widthScale * 6,
                  child: Image.asset('assets/images/home/$icon'),
                )),
            SizedBox(
              width: widthScale * 1.5,
            ),
            Text(
              name ?? '',
              style: jm_text_gray_style15,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          width: widget.width - margin * 2,
          child: Text(
            common ?? '用户仅评分未填写评价内容',
            style: common == null || common.length == 0
                ? jm_text_black_style14
                : jm_text_black_style14,
          ),
        ),
      ],
    );
  }
}

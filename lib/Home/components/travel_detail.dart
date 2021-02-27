import 'package:flutter/material.dart';
import 'package:zall_travel/Home/components/travel_confirm_view.dart';
import 'package:zall_travel/Home/components/travel_evaluate_view.dart';
import 'package:zall_travel/Home/components/travel_favor_button.dart';
import 'package:zall_travel/Home/components/travel_safeguard_view.dart';
import 'package:zall_travel/Home/components/travel_type_view.dart';
import 'package:zall_travel/components/CustomButton.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class TravelDetail extends StatefulWidget {
  final Map data;
  TravelDetail({this.data});
  @override
  _TravelDetailState createState() => _TravelDetailState();
}

class _TravelDetailState extends State<TravelDetail> {
  double widthScale;
  double margin;
  double selfWidth;
  double vSpace = 10;
  int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    widthScale = SizeConfig.blockSizeHorizontal;
    margin = widthScale * 3;
    selfWidth = SizeConfig.screenWidth - margin * 2;
    return Scaffold(
      backgroundColor: jm_bg_gray_color,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              topTab(title: '宝贝', index: 0),
              topTab(title: '评价', index: 1),
              topTab(title: '详情', index: 2),
              topTab(title: '推荐', index: 3),
            ],
          ),
        ),
        backgroundColor: jm_appTheme,
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 40,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        width: SizeConfig.screenWidth,
                        height: 260,
                        child: PageView.builder(
                          itemCount: widget.data['image'] != null ? 1 : 0,
                          itemBuilder: (context, index) {
                            return Image.asset(
                              'assets/images/home/${widget.data['image']}',
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: vSpace,
                      ),
                      Container(
                        width: selfWidth,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(widthScale * 3)),
                        child: Padding(
                          padding: EdgeInsets.only(left: margin),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: vSpace + 5,
                              ),
                              Text.rich(TextSpan(
                                  text: '￥ ',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 15),
                                  children: [
                                    TextSpan(
                                        text: widget.data['price'] ?? '1180',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold))
                                  ])),
                              SizedBox(
                                height: vSpace,
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: jm_appTheme,
                                        borderRadius: BorderRadius.circular(
                                            widthScale * 1.1)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 1),
                                      child: Text(
                                        '智游旅行',
                                        style: jm_text_black_bold_style10,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: widthScale * 3,
                                  ),
                                  Text('旅游就上智游', style: jm_text_gray_style12),
                                ],
                              ),
                              SizedBox(
                                height: vSpace,
                              ),
                              SizedBox(
                                width: selfWidth - margin * 2,
                                child: Text(
                                  widget.data['title'] ?? '',
                                  style: jm_text_black_bold_style18,
                                ),
                              ),
                              SizedBox(
                                height: vSpace,
                              ),
                              Row(
                                children: [
                                  TravelTypeView(
                                    icons: Icons.face,
                                    type: '朋友/同事',
                                    content: '出游人群',
                                  ),
                                  SizedBox(
                                    width: widthScale * 5,
                                  ),
                                  TravelTypeView(
                                    icons: Icons.assistant_photo_outlined,
                                    type: '婺源一地',
                                    content: '路线玩法',
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: vSpace,
                              ),
                              JMline(width: selfWidth - margin * 2, height: 1),
                              SizedBox(
                                height: vSpace,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TravelFavorButton(
                                    type: TravelFavorButtonType.score,
                                    value: '4.8',
                                  ),
                                  TravelFavorButton(
                                    type: TravelFavorButtonType.comment,
                                    value: '6条',
                                  ),
                                  Row(
                                    children: [
                                      TravelFavorButton(
                                        type: TravelFavorButtonType.share,
                                      ),
                                      SizedBox(
                                        width: margin,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: vSpace,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: vSpace,
                      ),
                      Container(
                          width: selfWidth,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(widthScale * 3)),
                          child: Padding(
                              padding: EdgeInsets.only(left: margin),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  TravelSafeguardView(),
                                  SizedBox(
                                    height: 15,
                                  ),
                                ],
                              ))),
                      SizedBox(
                        height: vSpace,
                      ),
                      TravelConfirmView(
                        margin: margin,
                        width: selfWidth,
                      ),
                      SizedBox(
                        height: vSpace,
                      ),
                      TravelEvaluateView(
                        // margin: margin,
                        data: widget.data,
                        width: selfWidth,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          JMline(
                            width: widthScale * 15,
                            height: 1,
                            color: jm_text_gray,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              '商品详情',
                              style: jm_text_black_bold_style17,
                            ),
                          ),
                          JMline(
                            width: widthScale * 15,
                            height: 1,
                            color: jm_text_gray,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: selfWidth,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(widthScale * 3)),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: margin,
                                ),
                                Text(
                                  '图文介绍',
                                  style: jm_text_black_bold_style18,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: margin,
                            ),
                            SizedBox(
                              width: selfWidth,
                              child: Image.asset(
                                'assets/images/home/travel_detail_01.jpg',
                                fit: BoxFit.fill,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: vSpace,
                      ),
                    ],
                  ),
                )),
            Positioned(
                bottom: 0,
                height: 55,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: margin,
                          ),
                          bottomLeftButton(
                            title: '店铺',
                            icons: Icons.storefront,
                            iconColor: Color(0xfffc501d),
                            buttonClick: () {},
                          ),
                          bottomLeftButton(
                            title: '客服',
                            icons: Icons.support_agent,
                            buttonClick: () {},
                          ),
                          bottomLeftButton(
                            title: '收藏',
                            icons: Icons.star_border,
                            buttonClick: () {},
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomButton(
                            child: Container(
                              width: widthScale * 30,
                              height: 40,
                              alignment: Alignment.center,
                              child: Text(
                                '先游后付',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xfffec22d),
                                  borderRadius: BorderRadius.horizontal(
                                      left: Radius.circular(20))),
                            ),
                          ),
                          CustomButton(
                            child: Container(
                              width: widthScale * 30,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Color(0xfffc521f),
                                  borderRadius: BorderRadius.horizontal(
                                      right: Radius.circular(20))),
                              alignment: Alignment.center,
                              child: Text(
                                '立即购买',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: margin,
                          ),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget bottomLeftButton(
      {String title,
      IconData icons,
      Function() buttonClick,
      double width = 0,
      Color iconColor = jm_text_gray}) {
    return CustomButton(
      width: width == 0 ? widthScale * 10 : width,
      onPressed: () {
        if (buttonClick != null) {
          buttonClick();
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icons,
            size: widthScale * 6,
            color: iconColor,
          ),
          Text(
            title,
            style: jm_text_gray_style10,
          )
        ],
      ),
    );
  }

  Widget topTab({String title, int index}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          tabIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title ?? '',
            style: jm_text_black_style14,
          ),
          SizedBox(
            width: widthScale * 11,
            height: 7,
          ),
          Container(
            width: widthScale * 6,
            height: 3,
            color: index == tabIndex ? Colors.black : Colors.transparent,
          )
        ],
      ),
    );
  }
}

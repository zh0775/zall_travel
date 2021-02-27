import 'package:flutter/material.dart';
import 'package:zall_travel/components/CustomButton.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class HomeFirstView extends StatefulWidget {
  @override
  _HomeFirstViewState createState() => _HomeFirstViewState();
}

class _HomeFirstViewState extends State<HomeFirstView> {
  double widthScale;
  double margin;
  double selfWidth;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    widthScale = SizeConfig.blockSizeHorizontal;
    margin = widthScale * 4;
    selfWidth = SizeConfig.screenWidth - margin * 2;
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/images/home/ttz_main.jpeg'),
        )),
        child: Stack(
          children: [
            Positioned(
                top: 50,
                left: 0,
                right: 0,
                height: 50,
                child: Container(
                  width: SizeConfig.screenWidth,
                  height: 50,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: margin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('天堂寨景区',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  width: widthScale * 1,
                                ),
                                Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: widthScale * 6,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            Text('黄冈市 09~14°C 小雨',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(45 / 2),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: widthScale * 3, right: widthScale * 2),
                            child: Row(
                              children: [
                                // SizedBox(
                                //   width: widthScale * 3,
                                // ),
                                Icon(
                                  Icons.search,
                                  size: widthScale * 6,
                                  color: Colors.white,
                                ),
                                Container(
                                  width: widthScale * 43,
                                  alignment: Alignment.centerLeft,
                                  constraints: BoxConstraints(
                                      minHeight: 45, maxHeight: 45),
                                  child: TextField(
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                    textAlignVertical: TextAlignVertical.center,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          color: Colors.white, fontSize: 14),
                                      contentPadding: EdgeInsets.all(6),
                                      hintText: '关键词搜索',
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.zero,
                                          borderSide: BorderSide.none),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            Positioned(
                left: margin,
                right: margin,
                bottom: 125,
                child: Container(
                  width: selfWidth,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          homeFirstButton(
                            title: '景区预定',
                            icon: 'fire.png',
                          ),
                          homeFirstButton(
                            title: '酒店',
                            icon: 'fire.png',
                          ),
                          homeFirstButton(
                            title: '餐厅预订',
                            icon: 'fire.png',
                          ),
                          homeFirstButton(
                            title: '地面交通',
                            icon: 'fire.png',
                          ),
                          homeFirstButton(
                            title: '当地向导',
                            icon: 'fire.png',
                          )
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          homeFirstButton(
                            title: '跟团游',
                            icon: 'fire.png',
                          ),
                          homeFirstButton(
                            title: '带礼回家',
                            icon: 'fire.png',
                          ),
                          homeFirstButton(
                            title: '直播频道',
                            icon: 'fire.png',
                          ),
                          homeFirstButton(
                            title: '先游后付',
                            icon: 'fire.png',
                          ),
                          homeFirstButton(
                            title: '更多服务',
                            icon: 'fire.png',
                          )
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

  Widget homeFirstButton({String icon, String title, Function() buttonClick}) {
    return CustomButton(
        onPressed: buttonClick,
        child: Column(
          children: [
            Image.asset(
              'assets/images/home/$icon',
              width: widthScale * 8,
              height: widthScale * 8,
            ),
            SizedBox(
              height: 5,
            ),
            Text(title ?? '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                ))
          ],
        ));
  }
}

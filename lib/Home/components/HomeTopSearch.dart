import 'package:flutter/material.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class HomeTopSearch extends StatefulWidget {
  final double height;
  const HomeTopSearch({this.height = 100});
  @override
  _HomeTopSearchState createState() => _HomeTopSearchState();
}

class _HomeTopSearchState extends State<HomeTopSearch> {
  double widthScale;
  double margin;
  double selfWidth;
  double searchContentHeight = 45;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    widthScale = SizeConfig.blockSizeHorizontal;
    margin = widthScale * 5;
    selfWidth = SizeConfig.screenWidth - margin * 2;
    return Container(
        width: SizeConfig.screenWidth,
        height: widget.height,
        color: Color(0xfff0f2f5),
        child: Stack(
          children: [
            Positioned(
                top: widget.height - searchContentHeight - 10,
                left: 0,
                right: 0,
                height: searchContentHeight,
                child: Container(
                  // color: Colors.red,
                  width: SizeConfig.screenWidth,
                  height: 50,
                  child: Row(
                    children: [
                      SizedBox(
                        width: margin,
                      ),
                      Container(
                        width: selfWidth - searchContentHeight - widthScale * 2,
                        height: searchContentHeight,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(searchContentHeight / 2)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: widthScale * 3,
                            ),
                            Icon(
                              Icons.search,
                              size: widthScale * 8,
                            ),
                            Container(
                              width: widthScale * (70 - 3 - 8 - 3),
                              alignment: Alignment.center,
                              constraints: BoxConstraints(
                                  minHeight: searchContentHeight,
                                  maxHeight: searchContentHeight),
                              child: TextField(
                                style: jm_text_black_style14,
                                textAlignVertical: TextAlignVertical.center,
                                maxLines: 1,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: '搜索目的地/景点/酒店等',
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.zero,
                                      borderSide: BorderSide.none),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: widthScale * 2,
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        fillColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(searchContentHeight / 2)),
                        constraints: BoxConstraints(
                            minWidth: searchContentHeight,
                            minHeight: searchContentHeight),
                        child: Icon(Icons.notifications_none),
                      )
                    ],
                  ),
                ))
          ],
        ));
  }
}

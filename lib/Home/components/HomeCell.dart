import 'package:flutter/material.dart';
import 'package:zall_travel/components/NoneV.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class HomeCell extends StatefulWidget {
  final double width;
  final double height;
  final String image;
  final String title;
  final String userHead;
  final String userName;
  final bool needUserBg;
  final int likeCount;
  const HomeCell(
      {this.width,
      this.height,
      this.image,
      this.title,
      this.userHead,
      this.userName,
      this.needUserBg = false,
      this.likeCount = 20});
  @override
  _HomeCellState createState() => _HomeCellState();
}

class _HomeCellState extends State<HomeCell> {
  double widthScale;
  double margin;
  double selfWidth;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    widthScale = SizeConfig.blockSizeHorizontal;
    margin = widthScale * 4;
    selfWidth = SizeConfig.screenWidth - margin * 2;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: widget.width,
            height: widget.needUserBg ? widget.height : widget.height - 25,
            // decoration: BoxDecoration(
            //   borderRadius: BorderRadius.circular(10),
            // ),
            child: Stack(
              overflow: Overflow.clip,
              children: [
                Positioned.fill(
                  child: widget.image != null
                      ? Image.asset(
                          'assets/images/home/${widget.image}',
                          fit: BoxFit.cover,
                        )
                      : NoneV(),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: widget.needUserBg
                        ? Container(
                            color: Color(0xff968982),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: widget.width - margin * 2,
                                  child: Row(
                                    children: [
                                      Text(
                                        widget.title ?? '',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: margin,
                                    ),
                                    widget.userHead != null
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                                widthScale * 5 / 2),
                                            child: Image.asset(
                                              'assets/images/home/${widget.userHead}',
                                              height: widthScale * 5,
                                              width: widthScale * 5,
                                            ),
                                          )
                                        : NoneV(),
                                    SizedBox(
                                      width: widthScale * 3,
                                    ),
                                    Text(
                                      widget.userName ?? '',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: EdgeInsets.only(bottom: widthScale * 2),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: widthScale * 2,
                                ),
                                Icon(
                                  Icons.location_on,
                                  size: widthScale * 4,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: widthScale * 2,
                                ),
                                SizedBox(
                                  width: widget.width -
                                      widthScale * (2 + 4 + 2 + 2),
                                  child: Text(
                                    widget.title ?? '',
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ))
              ],
            ),
          ),
        ),
        !widget.needUserBg
            ? SizedBox(
                height: 5,
              )
            : NoneV(),
        !widget.needUserBg
            ? Container(
                width: widget.width,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        widget.userHead != null
                            ? ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(widthScale * 5 / 2),
                                child: Image.asset(
                                  'assets/images/home/${widget.userHead}',
                                  height: widthScale * 5,
                                  width: widthScale * 5,
                                ),
                              )
                            : NoneV(),
                        SizedBox(
                          width: widthScale * 1,
                        ),
                        Text(
                          widget.userName ?? '',
                          style: jm_text_black_style12,
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: widthScale * 4,
                        ),
                        SizedBox(
                          width: widthScale * 0.3,
                        ),
                        Text(
                          widget.likeCount.toString(),
                          style: jm_text_black_style12,
                        )
                      ],
                    )
                  ],
                ),
              )
            : NoneV(),
      ],
    );
  }
}

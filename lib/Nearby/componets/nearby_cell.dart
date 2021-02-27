import 'package:flutter/material.dart';
import 'package:zall_travel/components/CustomButton.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class NearbyCell extends StatefulWidget {
  final Map data;
  const NearbyCell({this.data});
  @override
  _NearbyCellState createState() => _NearbyCellState();
}

class _NearbyCellState extends State<NearbyCell> {
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
            border: Border(bottom: BorderSide(width: 1, color: jm_line_color))),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: widthScale * 2),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(widthScale * 1),
                child: Container(
                  width: widthScale * 30,
                  height: widthScale * 23,
                  child: Image.asset(
                    'assets/images/home/${widget.data['image']}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: widthScale * 3,
              ),
              Container(
                width: widthScale * 45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          widget.data['name'] ?? '',
                          style: jm_text_black_bold_style14,
                        ),
                        SizedBox(
                          width: widthScale * 3,
                        ),
                        Text(
                          '距离你' + widget.data['near'],
                          style: jm_text_gray_style13,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Text(
                      widget.data['location'],
                      style: jm_text_black_style14,
                    )
                  ],
                ),
              ),
              CustomButton(
                child: Column(
                  children: [
                    Container(
                      width: widthScale * 10,
                      height: widthScale * 10,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius:
                              BorderRadius.circular(widthScale * 10 / 2)),
                      child: Icon(
                        Icons.near_me_rounded,
                        size: widthScale * 6,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '去导航',
                      style: jm_text_gray_style13,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}

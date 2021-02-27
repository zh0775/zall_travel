import 'package:flutter/material.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class Wallet extends StatefulWidget {
  @override
  _WalletState createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  double widthScale;
  double margin;
  double selfWidth;
  @override
  Widget build(BuildContext context) {
    widthScale = SizeConfig.blockSizeHorizontal;
    margin = widthScale * 3;
    selfWidth = SizeConfig.screenWidth - margin * 2;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 240,
              child: Container(
                alignment: Alignment.topCenter,
                color: Color(0xff187ef5),
                child: Padding(
                  padding: EdgeInsets.only(top: 50.0),
                  child: Text(
                    '钱包',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )),
          Positioned(
              top: 100,
              left: margin,
              child: Container(
                width: selfWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Text(
                      '可用额度（元）：',
                      style: jm_text_gray_style17,
                    ),
                    // SizedBox(height: ,)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

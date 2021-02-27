import 'package:flutter/material.dart';
import 'package:zall_travel/Wallet/components/wallet_bankcard.dart';
import 'package:zall_travel/components/CustomButton.dart';
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
  List cardList = [
    {'cardName': '平安银行信用卡', 'cardNum': '5472', 'icon': 'pingan_bank.png'},
    {'cardName': '中国邮政储蓄银行储蓄卡', 'cardNum': '7766', 'icon': 'youzheng_bank.png'}
  ];
  @override
  Widget build(BuildContext context) {
    widthScale = SizeConfig.blockSizeHorizontal;
    margin = widthScale * 3;
    selfWidth = SizeConfig.screenWidth - margin * 2;
    return Scaffold(
      backgroundColor: Color(0xfff7f6fb),
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
              right: margin,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: selfWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            '可用额度（元):',
                            style: jm_text_gray_style17,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            '520.00',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomButton(
                                onPressed: () {},
                                child: Container(
                                  width: widthScale * 32,
                                  height: 38,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xffd6dbe1),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    '充值',
                                    style: jm_text_black_style17,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: widthScale * 10,
                              ),
                              CustomButton(
                                onPressed: () {},
                                child: Container(
                                  width: widthScale * 32,
                                  height: 38,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xff187ef5),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    '提现',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 17),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: selfWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '我的卡',
                                  style: jm_text_black_bold_style16,
                                ),
                                CustomButton(
                                  child: Container(
                                    width: widthScale * 15,
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25 / 2),
                                        border: Border.all(
                                            width: 1, color: jm_line_color)),
                                    alignment: Alignment.center,
                                    child: Text(
                                      '全部(${cardList.length ?? 0})',
                                      style: TextStyle(
                                          color: Color(0xff187ef5),
                                          fontSize: 13),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          ...cardsWidget(),
                          SizedBox(
                            height: 20,
                          ),
                          CustomButton(
                            onPressed: () {
                              print('添加银行卡');
                            },
                            child: Container(
                              width: selfWidth - margin * 2,
                              height: 55,
                              decoration: BoxDecoration(
                                  color: Color(0xff187ef5),
                                  borderRadius: BorderRadius.circular(7)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle_rounded,
                                    color: Colors.white,
                                    size: widthScale * 7,
                                  ),
                                  SizedBox(
                                    width: widthScale * 2,
                                  ),
                                  Text(
                                    '添加银行卡',
                                    style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('绑定银行卡常用问题解答'),
                                Icon(
                                  Icons.navigate_next_rounded,
                                  color: jm_text_gray,
                                  size: widthScale * 5,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }

  List<Widget> cardsWidget() {
    List<Widget> list = [];
    if (cardList != null && cardList.length > 0) {
      for (var i = 0; i < cardList.length; i++) {
        Map data = cardList[i];
        list.add(Padding(
          padding: EdgeInsets.only(top: 18.0),
          child: WalletBankcard(
            data: data,
            bgColor: i == 0 ? Color(0xfffa9f2b) : Color(0xff189fa8),
          ),
        ));
      }
    }

    return list;
  }
}

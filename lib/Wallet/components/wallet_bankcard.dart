import 'package:flutter/material.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class WalletBankcard extends StatefulWidget {
  final Map data;
  final Color bgColor;
  const WalletBankcard({this.data, this.bgColor});
  @override
  _WalletBankcardState createState() => _WalletBankcardState();
}

class _WalletBankcardState extends State<WalletBankcard> {
  double widthScale;
  double margin;
  @override
  Widget build(BuildContext context) {
    widthScale = SizeConfig.blockSizeHorizontal;
    margin = widthScale * 3;
    return Container(
      width: SizeConfig.screenWidth - margin * 4,
      height: 130,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                        width: widthScale * 12,
                        height: widthScale * 12,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.circular(widthScale * 6.5)),
                        child: Align(
                          child: Container(
                            width: widthScale * 8,
                            height: widthScale * 8,
                            child: Image.asset(
                              'assets/images/home/${widget.data['icon']}',
                              fit: BoxFit.fill,
                            ),
                          ),
                        )),
                    SizedBox(
                      width: widthScale * 2,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.data['cardName'] ?? '',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '可转账、还款、查询账单',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '**** ' + widget.data['cardNum'] ?? '',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(3)),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 2, vertical: 1),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '备注银行卡',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                            Icon(
                              Icons.drive_file_rename_outline,
                              color: Colors.white,
                              size: widthScale * 3,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

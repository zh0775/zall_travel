import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';
import 'package:zall_travel/Home/components/custom_travel_video.dart';
import 'package:zall_travel/Home/components/travel_detail.dart';
import 'package:zall_travel/Home/components/travel_info.dart';
import 'package:zall_travel/components/CustomButton.dart';
import 'package:zall_travel/components/NoneV.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';
import 'package:path_provider/path_provider.dart';

class TravelVideoView extends StatefulWidget {
  final List dataList;
  final int dataIndex;
  const TravelVideoView({this.dataList = const [], this.dataIndex});
  @override
  _TravelVideoViewState createState() => _TravelVideoViewState();
}

class _TravelVideoViewState extends State<TravelVideoView> {
  // String videoPath = 'snj.mp4';
  PageController _pageController;
  // String videoPath = 'Butterfly-209.mp4';
  var file;
  double widthScale;
  double margin;
  double selfWidth;
  int currentIndex;
  bool openVolume = true;
  Map selfData;
  @override
  void initState() {
    selfData = widget.dataList[widget.dataIndex];
    currentIndex = widget.dataIndex;
    _pageController = PageController(initialPage: currentIndex);
    _saveAssetVideoToFile(selfData['video']).then((value) {
      setState(() {});
    });

    // _controller = VideoPlayerController.asset('assets/videos/snj.mp4')
    //   ..initialize().then((_) {
    //     setState(() {});
    //   });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map data = widget.dataList[currentIndex];
    SizeConfig().init(context);
    widthScale = SizeConfig.blockSizeHorizontal;
    margin = widthScale * 4;
    selfWidth = SizeConfig.screenWidth - margin * 2;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Container(
                  color: Colors.black26,
                  child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentIndex = value;
                        });
                      },
                      controller: _pageController,
                      scrollDirection: Axis.vertical,
                      itemCount:
                          widget.dataList != null ? widget.dataList.length : 0,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            child: Stack(
                          children: [
                            Positioned.fill(
                                child: file != null
                                    ? CustomTravelVideo(
                                        video: file,
                                        videoType: TravelVideoType.file,
                                      )
                                    : NoneV()),
                            Positioned(
                                left: margin,
                                right: margin,
                                bottom: 50,
                                child: Container(
                                  width: selfWidth,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              tagView(
                                                  title: data['title'] ?? ''),
                                              SizedBox(
                                                width: widthScale * 2,
                                              ),
                                              tagView(
                                                  title: '当地向导',
                                                  icons: Icons
                                                      .person_search_rounded),
                                              // SizedBox(
                                              //   width: widthScale * 3,
                                              // ),
                                              // Text(
                                              //   data['userName'] ?? '',
                                              //   style: TextStyle(
                                              //       fontSize: 15,
                                              //       color: Colors.white),
                                              // ),
                                              // SizedBox(
                                              //   width: widthScale * 3,
                                              // ),
                                              // RawMaterialButton(
                                              //   onPressed: () {
                                              //     if (data['follow'] == null) {
                                              //       data['follow'] = false;
                                              //     }

                                              //     setState(() {
                                              //       data['follow'] =
                                              //           !data['follow'];
                                              //     });
                                              //   },
                                              //   fillColor: data['follow'] !=
                                              //               null &&
                                              //           data['follow'] == true
                                              //       ? Colors.black26
                                              //       : Colors.yellow,
                                              //   elevation: 0.1,
                                              //   highlightElevation: 1.0,
                                              //   materialTapTargetSize:
                                              //       MaterialTapTargetSize
                                              //           .shrinkWrap,
                                              //   constraints: BoxConstraints(
                                              //       minHeight: widthScale * 6,
                                              //       minWidth: widthScale * 13),
                                              //   splashColor: Colors.transparent,
                                              //   shape: RoundedRectangleBorder(
                                              //       borderRadius:
                                              //           BorderRadius.circular(
                                              //               widthScale * 4)),
                                              //   child: Row(
                                              //     mainAxisAlignment:
                                              //         MainAxisAlignment.center,
                                              //     children: [
                                              //       data['follow'] != null &&
                                              //               data['follow'] ==
                                              //                   true
                                              //           ? NoneV()
                                              //           : Icon(
                                              //               Icons.add,
                                              //               size:
                                              //                   widthScale * 3,
                                              //               color: Colors.black,
                                              //             ),
                                              //       Text(
                                              //         data['follow'] != null &&
                                              //                 data['follow'] ==
                                              //                     true
                                              //             ? '已关注'
                                              //             : '关注',
                                              //         style: TextStyle(
                                              //             fontSize: 12,
                                              //             color: data['follow'] !=
                                              //                         null &&
                                              //                     data['follow'] ==
                                              //                         true
                                              //                 ? Colors.white
                                              //                 : Colors.black),
                                              //       )
                                              //     ],
                                              //   ),
                                              // )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            width: widthScale * 65,
                                            child: Text(
                                              data['content'] ??
                                                  '这才是住在风景里，不想回去了！',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                              maxLines: 5,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          TravelInfo(
                                            data: data,
                                            index: widget.dataIndex,
                                            toBuy: (index) {
                                              push(
                                                  TravelDetail(
                                                    data: data,
                                                  ),
                                                  context);
                                            },
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          // rightButton(
                                          //   icons: openVolume
                                          //       ? Icons.volume_up
                                          //       : Icons.volume_off,
                                          //   title: '',
                                          //   buttonClick: () {
                                          //     setState(() {
                                          //       openVolume = !openVolume;
                                          //     });
                                          //   },
                                          // ),
                                          SizedBox(
                                            child: Stack(
                                              overflow: Overflow.visible,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          widthScale * 6),
                                                  child: SizedBox(
                                                    width: widthScale * 12,
                                                    height: widthScale * 12,
                                                    child: Image.asset(
                                                        'assets/images/home/${data['userHead']}'),
                                                  ),
                                                ),
                                                Positioned(
                                                    bottom: -widthScale * 2.5,
                                                    left: widthScale * 12 / 2 -
                                                        widthScale * 2.5,
                                                    child: Container(
                                                      width: widthScale * 5,
                                                      height: widthScale * 5,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    widthScale *
                                                                        2.5),
                                                      ),
                                                    )),
                                                Positioned(
                                                    bottom: -widthScale * 3,
                                                    left: widthScale * 12 / 2 -
                                                        widthScale * 3,
                                                    child: Icon(
                                                      Icons.add_circle_rounded,
                                                      size: widthScale * 6,
                                                      color: Colors.red,
                                                    ))
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                          ),
                                          rightButton(
                                              icons: Icons.favorite,
                                              title:
                                                  data['messageCount'] != null
                                                      ? data['messageCount']
                                                          .toString()
                                                      : '12'),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          rightButton(
                                              icons: Icons.textsms,
                                              title:
                                                  data['messageCount'] != null
                                                      ? data['messageCount']
                                                          .toString()
                                                      : '12'),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          rightButton(
                                              icons: Icons.reply, title: '分享'),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          CustomButton(
                                            onPressed: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (context) {
                                                    return Container(
                                                      height: 200,
                                                      color: Colors.white,
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              CustomButton(
                                                                onPressed: () {
                                                                  if (Navigator
                                                                      .canPop(
                                                                          context)) {
                                                                    Navigator.pop(
                                                                        context);
                                                                  }
                                                                },
                                                                width:
                                                                    widthScale *
                                                                        4,
                                                                height:
                                                                    widthScale *
                                                                        4,
                                                                child: Icon(
                                                                  Icons
                                                                      .close_rounded,
                                                                  size:
                                                                      widthScale *
                                                                          5,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 10,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Image.asset(
                                              'assets/images/home/btn_travel_commodity.png',
                                              width: widthScale * 12,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ));
                      }))),
          Positioned(
              left: widthScale * 6,
              top: 50,
              child: GestureDetector(
                  onTap: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: widthScale * 8,
                    color: Colors.white,
                  ))),
        ],
      ),
    );
  }

  Widget rightButton(
      {String title,
      bool favor = false,
      @required IconData icons,
      double fontSize = 14,
      Function() buttonClick}) {
    return RawMaterialButton(
      onPressed: buttonClick,
      splashColor: Colors.transparent,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: BoxConstraints(minHeight: 0, minWidth: 0),
      child: Column(
        children: [
          Icon(
            icons,
            size: widthScale * 9,
            color: favor ? Colors.red : Colors.white,
          ),
          SizedBox(
              // height: 5,
              ),
          title == null || title.length == 0
              ? NoneV()
              : Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: fontSize),
                )
        ],
      ),
    );
  }

  Widget tagView({String title, IconData icons = Icons.location_on_rounded}) {
    return CustomButton(
        child: Container(
      decoration: BoxDecoration(
          color: Colors.black54, borderRadius: BorderRadius.circular(2)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(3, 2, 5, 2),
        child: Row(
          children: [
            Icon(
              icons,
              size: widthScale * 4,
              color: Color(0xff9cccf3),
            ),
            SizedBox(
              width: widthScale * 0.5,
            ),
            Text(
              title ?? '',
              style: TextStyle(color: Color(0xff9cccf3), fontSize: 13),
            )
          ],
        ),
      ),
    ));
  }

  Future _saveAssetVideoToFile(String videoFileName) async {
    var content = await rootBundle.load('assets/videos/$videoFileName');
    final directory = await getApplicationDocumentsDirectory();
    file = File("${directory.path}/$videoFileName");
    file.writeAsBytesSync(content.buffer.asUint8List());
  }
}

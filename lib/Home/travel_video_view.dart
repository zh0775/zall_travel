import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

class TravelVideoView extends StatefulWidget {
  final List dataList;
  final int dataIndex;
  const TravelVideoView({this.dataList = const [], this.dataIndex});
  @override
  _TravelVideoViewState createState() => _TravelVideoViewState();
}

class _TravelVideoViewState extends State<TravelVideoView> {
  VideoPlayerController _controller;
  double widthScale;
  double margin;
  double selfWidth;
  int currentIndex;
  @override
  void initState() {
    _controller = _controller =
        VideoPlayerController.asset('file://assets/videos/snj.mp4')
          ..initialize().then((_) {
            // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
            setState(() {});
          });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    widthScale = SizeConfig.blockSizeHorizontal;
    margin = widthScale * 6;
    selfWidth = SizeConfig.screenWidth - margin * 2;
    return Scaffold(
      body: Stack(
        children: [
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
          Positioned.fill(
              child: Container(
                  child: PageView.builder(
                      onPageChanged: (value) {},
                      scrollDirection: Axis.vertical,
                      itemCount: widget.dataIndex ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        return _controller.value.initialized
                            ? AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              )
                            : Container();
                      }))),
        ],
      ),
    );
  }
}

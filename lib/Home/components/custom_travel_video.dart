import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:zall_travel/components/NoneV.dart';
import 'package:zall_travel/const/Default.dart';
import 'package:zall_travel/utils/sizeConfig.dart';

enum TravelVideoType { file, asset, network }

class CustomTravelVideo extends StatefulWidget {
  final TravelVideoType videoType;
  final dynamic video;
  const CustomTravelVideo({this.videoType, this.video});

  @override
  _CustomTravelVideoState createState() => _CustomTravelVideoState();
}

class _CustomTravelVideoState extends State<CustomTravelVideo> {
  // labelProgress = '00:00';
  // Function startPlayControlTimer;
  Timer timer;
  double progressValue = 0.0; //进度
  String labelProgress = ''; //tip内容
  bool handle = false; //判断是否在滑动的标识

  final GlobalKey _key = GlobalKey();
  VideoPlayerController _controller;
  double widthScale;
  double margin;
  double selfWidth;
  bool _videoInit = false;
  bool _videoError = false;
  bool _playEnd = false;
  @override
  void initState() {
    _urlChange();

    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomTravelVideo oldWidget) {
    if (oldWidget.video != widget.video) {
      _urlChange(); // url变化时重新执行一次url加载
    }
    if (!handle && _videoInit) {
      int position = _controller.value.position.inMilliseconds;
      int duration = _controller.value.duration.inMilliseconds;
      if (position >= duration) {
        position = duration;
      }
      setState(() {
        progressValue = position / duration * 100;
        // labelProgress = DateUtil.formatDateMs(
        //   progressValue.toInt(),
        //   format: 'mm:ss',
        // );
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  void _urlChange() async {
    if (widget.video == null) return;
    if (_controller != null) {
      /// 如果控制器存在，清理掉重新创建
      _controller.removeListener(_videoListener);
      _controller.dispose();
    }
    setState(() {
      /// 重置组件参数
      _videoInit = false;
      _videoError = false;
      _playEnd = false;
    });
    if (widget.videoType == TravelVideoType.file) {
      _controller = VideoPlayerController.file(widget.video);
    } else if (widget.videoType == TravelVideoType.asset) {
      _controller = VideoPlayerController.asset(widget.video);
    } else {
      _controller = VideoPlayerController.network(widget.video);
    }

    /// 加载资源完成时，监听播放进度，并且标记_videoInit=true加载完成
    _controller.addListener(_videoListener);
    await _controller.initialize();
    setState(() {
      _videoInit = true;
      _videoError = false;
      _controller.play();
      startPlayControlTimer();
    });
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
      timer = null;
    }
    if (_controller != null) {
      _controller.removeListener(_videoListener);
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    widthScale = SizeConfig.blockSizeHorizontal;
    margin = widthScale * 6;
    selfWidth = SizeConfig.screenWidth - margin * 2;
    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: () => playOrPause(),
            child: _isVideoInit(),
          ),
        ),
        _playEnd
            ? Align(
                alignment: Alignment.center,
                child: playIcon(),
              )
            : NoneV(),
        // Positioned(bottom: 30, left: 0, right: 0, child: videoSlider())
      ],
    );
  }

  playOrPause() {
    if (_playEnd) {
      int position = _controller.value.position.inMilliseconds;
      int duration = _controller.value.duration.inMilliseconds;
      if (position >= duration) {
        _controller.seekTo(Duration.zero);
      }
      _controller.play();
      if (timer == null) {
        timer = Timer.periodic(Duration(milliseconds: 500), timerRun);
      }
    } else {
      _controller.pause();
      if (timer != null) {
        timer.cancel();
        timer = null;
      }
    }
    setState(() {
      _playEnd = !_playEnd;
    });
  }

  Widget _isVideoInit() {
    if (_videoInit) {
      return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      );
    } else if (_controller != null && _videoError) {
      return Text(
        '加载出错',
        style: TextStyle(color: Colors.white),
      );
    } else {
      return SizedBox(
        width: 30,
        height: 30,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    }
  }

  void _videoListener() async {
    if (_controller.value.hasError) {
      setState(() {
        _videoError = true;
      });
    } else {
      // Duration res = await _controller.position;
      // if (res >= _controller.value.duration) {
      //   await _controller.seekTo(Duration(seconds: 0));
      //   await _controller.pause();
      // }

      int position = _controller.value.position.inMilliseconds;
      int duration = _controller.value.duration.inMilliseconds;
      if (position >= duration) {
        setState(() {
          _playEnd = true;
        });
      }

      if (_controller.value.isPlaying && _key.currentState != null) {
        /// 减少build次数
        // _key.currentState.setPosition(
        //   position: res,
        //   totalDuration: _controller.value.duration,
        // );
      }
    }
  }

  Widget playIcon() {
    return GestureDetector(
      onTap: playOrPause,
      child: Icon(
        Icons.play_circle_outline,
        color: jm_text_gray,
        size: widthScale * 20,
      ),
    );
  }

  Widget videoSlider() {
    return SliderTheme(
      //自定义风格
      data: SliderTheme.of(context).copyWith(
        //进度条滑块左边颜色
        inactiveTrackColor: Colors.white,
        overlayShape: RoundSliderOverlayShape(
          //可继承SliderComponentShape自定义形状
          overlayRadius: 10, //滑块外圈大小
        ),
        thumbShape: RoundSliderThumbShape(
          //可继承SliderComponentShape自定义形状
          disabledThumbRadius: 7, //禁用是滑块大小
          enabledThumbRadius: 7, //滑块大小
        ),
      ),
      child: Slider(
        value: progressValue,
        label: labelProgress,
        divisions: 100,
        onChangeStart: _onChangeStart,
        onChangeEnd: _onChangeEnd,
        onChanged: _onChanged,
        min: 0,
        max: 100,
      ),
    );
  }

  void _onChangeEnd(_) {
    if (!_videoInit) {
      return;
    }
    startPlayControlTimer();
    // 关闭手动操作标识
    handle = false;
    // 跳转到滑动时间
    int duration = _controller.value.duration.inMilliseconds;
    _controller.seekTo(
      Duration(milliseconds: (progressValue / 100 * duration).toInt()),
    );
//    if (!controller.value.isPlaying) {
//      controller.play();
//    }
  }

  void _onChangeStart(_) {
    if (!_videoInit) {
      return;
    }
    if (timer != null) {
      timer.cancel();
    }
    // 开始手动操作标识
    handle = true;
//    if (controller.value.isPlaying) {
//      controller.pause();
//    }
  }

  void _onChanged(double value) {
    print('value ===== $value');
    if (!_videoInit) {
      return;
    }
    if (timer != null) {
      timer.cancel();
    }
    int duration = _controller.value.duration.inMilliseconds;
    setState(() {
      progressValue = value;
      // labelProgress = DateUtil.formatDateMs(
      //   (value / 100 * duration).toInt(),
      //   format: 'mm:ss',
      // );
    });
  }

  void startPlayControlTimer() {
    if (timer == null) {
      timer = Timer.periodic(Duration(milliseconds: 500), timerRun);
    }
  }

  timerRun(Timer value) {
    int position = _controller.value.position.inMilliseconds;
    int duration = _controller.value.duration.inMilliseconds;
    if (position >= duration) {
      position = duration;
    }
    progressValue = position / duration * 100;
    // setState(() {
    //   progressValue = position / duration * 100;
    //   // labelProgress = DateUtil.formatDateMs(
    //   //   progressValue.toInt(),
    //   //   format: 'mm:ss',
    //   // );
    // });
    // _onChanged(progressValue);
    setState(() {
      // progressValue = value;
      // labelProgress = DateUtil.formatDateMs(
      //   (value / 100 * duration).toInt(),
      //   format: 'mm:ss',
      // );
    });
  }
}

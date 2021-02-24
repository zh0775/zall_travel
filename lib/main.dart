import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zall_travel/MainPageWidget.dart';
import 'package:zall_travel/const/Default.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Global.navigatorKey,
      // onGenerateRoute: (setting) {
      //   return Routes.findRoutes(setting);
      // },
      builder: EasyLoading.init(),
      // home: StartAppPage(),
      home: MainPageWidget(),
      theme: ThemeData(
          primaryColor: jm_appTheme,
          splashColor: jm_appTheme,
          // primaryTextTheme: TextTheme(headline4: jm_text_apptheme_style15),
          // dialogTheme: DialogTheme(
          //     contentTextStyle: jm_text_apptheme_style15,
          //     titleTextStyle: jm_text_apptheme_style15),
          colorScheme: ColorScheme.light(primary: jm_appTheme),
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(jm_appTheme_splash)))),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // ChineseCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
      navigatorObservers: [
        GLObserver(),
      ],
    );
  }
}

class GLObserver extends NavigatorObserver {
// 添加导航监听后，跳转的时候需要使用Navigator.push路由
  @override
  void didPush(Route route, Route previousRoute) {
    super.didPush(route, previousRoute);
    // print('route === ${route}');
  }

  @override
  void didPop(Route route, Route previousRoute) {
    super.didPop(route, previousRoute);
  }
}

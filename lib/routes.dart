import 'package:chat_app/pages/chat.dart';
import 'package:chat_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Routes {
  final routes = <String, WidgetBuilder>{
    '/chat': (context) => new Chat(),
  };

  Routes() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: const Color(0xff2ed573),
    ));

    runApp(new MaterialApp(
        title: 'Chat App', routes: routes, home: new Home()));
  }
}

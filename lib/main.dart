import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinpong/app.dart';

import 'app_controller.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/home',
      getPages: [
        GetPage(
            name: '/home',
            page: () => PingPong(),
            binding: BindingsBuilder.put(() => PingPongController())),
      ],
    );
  }
}

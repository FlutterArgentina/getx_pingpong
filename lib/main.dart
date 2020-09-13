import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinpong/app.dart';

import 'app_controller.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialRoute: '/home',
      getPages: [
        GetPage(
            name: '/home',
            page: () => PingPong(),
            binding: BindingsBuilder.put(
              () => PingPongController(),
            )),
      ],
    ),
  );
}

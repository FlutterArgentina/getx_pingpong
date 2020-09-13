import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinpong/paleta.dart';

import 'pelota.dart';

class PingPongController extends GetxController
    with SingleGetTickerProviderMixin {
  var velocity = 4.5;
  var aceleration = .2;
  var direction = 0;
  Paleta jugador1;
  Paleta jugador2;
  Pelota pelota;
  double worldW = 0;
  double worldH = 0;

  Color color = Colors.blue;
  var mitad = 0.0;

  @override
  void onInit() {
    mitad = Get.width / 2;
    super.onInit();
    final rightContraint = Get.width;
    jugador1 = Paleta(rightContraint);
    jugador2 = Paleta(rightContraint);
    pelota = Pelota();

    final ticker = createTicker(
      (_) {
        jugador1.render();
        jugador2.pos.x = jugador1.pos.x;
        jugador2.pos.y = Get.height - 200;
        jugador2.render();
      },
    );
    ticker.start();
  }

  void onTap(TapDownDetails details) {
    if (details.globalPosition.dx > mitad) {
      jugador1.move(1);
    } else {
      jugador1.move(-1);
    }
  }

  void onTapUp() {
    jugador1.cancel();
  }

  void onTapCancel() {
    jugador1.cancel();
  }

  void updateWorld(BoxConstraints constraints) {
    worldW = constraints.maxWidth;
    worldH = constraints.maxHeight;
//    jugador1.worldResize();
//    jugador2.worldResize();
  }
}

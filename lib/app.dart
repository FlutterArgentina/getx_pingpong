import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_controller.dart';
import 'paleta.dart';
import 'pelota.dart';

class PingPong extends GetView<PingPongController> {
  const PingPong({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ping pong demo'),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          controller.updateWorld(constraints);
          return GestureDetector(
            onTapDown: controller.onTap,
            onTapUp: (_) => controller.onTapUp(),
            onTapCancel: () => controller.onTapCancel(),
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        PaletaWidget(
                          paleta: controller.jugador1,
                        ),
                        PaletaWidget(
                          paleta: controller.jugador2,
                        ),
                        PelotaWidget(
                          pelota: controller.pelota,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

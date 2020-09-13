import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinpong/app_controller.dart';

import 'utils.dart';

class Pelota {
  final _vel = Point(y: 0, x: 0);
  final _pos = Point(y: 200, x: 100).obs;
  final controller = Get.find<PingPongController>();

  Point get pos => _pos.value;

  Point get vel => _vel;
  Color color = Colors.blue;
  double velocity = 0;
  double aceleration = 0;

  void render() {
    _pos.value.y += _vel.y;
    _pos.value.x += _vel.x;
  }

  void worldResize() {
    print("pelota World width: ${controller.worldW}");
  }
// if (_pos.value.x >= rightContraint - width) {
//   _pos.value.x = rightContraint - width;
//   color = Colors.red;
// } else if (_pos.value.x <= 0) {
//   _pos.value.x = 0;
//   color = Colors.red;
// } else {
//   color = Colors.blue;
// }}
}

class PelotaWidget extends StatelessWidget {
  final Pelota pelota;

  const PelotaWidget({Key key, this.pelota}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Positioned(
        top: pelota.pos.y,
        bottom: pelota.pos.x,
        child: Container(
          width: 35.0,
          height: 35.0,
          decoration:
              BoxDecoration(color: Colors.green, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinpong/app_controller.dart';

import 'utils.dart';

class Pelota {
  final _vel = Point(y: 0, x: 0);
  final _pos = Point(y: 100, x: 100).obs;

  PingPongController get controller => Get.find<PingPongController>();

  Point get pos => _pos.value;

  Point get vel => _vel;
  Color color = Colors.blue;
  double velocity = 0;
  double aceleration = 0;
  double radius = 20;
  Rectangle bounds = Rectangle<double>(0.0, 0.0, 0.0, 0.0);

  void render() {
    _pos.value.y += _vel.y;
    _pos.value.x += _vel.x;
    constrain();
    _pos.refresh();
  }

  void constrain() {
    if (pos.x < bounds.left) {
      _vel.x *= -1;
      pos.x = bounds.left;
    } else if (pos.x > bounds.right) {
      pos.x = bounds.right;
      _vel.x *= -1;
    }
    if (pos.y < bounds.top) {
      pos.y = bounds.top;
      _vel.y *= -1;
    } else if (pos.y > bounds.bottom) {
      pos.y = bounds.bottom;
      _vel.y *= -1;
    }
  }

  void worldResize() {
    bounds = Rectangle<double>(
        0, 0, controller.worldW - radius * 2, controller.worldH - radius * 2);
  }
}

class PelotaWidget extends StatelessWidget {
  final Pelota pelota;

  const PelotaWidget({Key key, this.pelota}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Positioned(
        top: pelota.pos.y,
        left: pelota.pos.x,
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

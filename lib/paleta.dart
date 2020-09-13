import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_controller.dart';
import 'utils.dart';

class Paleta {
  var velocity = 4.5;
  var aceleration = .2;
  var direction = 0;
  double width = 120.0;
  double height = 20.0;

  final _pos = Point(y: 40, x: 0).obs;
  PingPongController get controller => Get.find<PingPongController>();

  Paleta();

  Point get pos => _pos.value;
  Color color = Colors.blue;

  void render() {
    if (direction != 0) aceleration += .5;
    _pos.value.x += (velocity + aceleration) * direction;
    if (_pos.value.x >= controller.worldW - width) {
      _pos.value.x = controller.worldW - width;
      color = Colors.red;
    } else if (_pos.value.x <= 0) {
      _pos.value.x = 0;
      color = Colors.red;
    } else {
      color = Colors.blue;
    }
    _pos.refresh();
  }

  void cancel() {
    direction = 0;
    aceleration = 0;
  }

  void move(int dir) {
    direction = dir;
    aceleration = 0;
  }

  void worldResize() {}
}

class PaletaWidget extends StatelessWidget {
  final Paleta paleta;
  const PaletaWidget({Key key, this.paleta}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Positioned(
        top: paleta.pos.y,
        left: paleta.pos.x,
        child: Container(
          color: paleta.color,
          height: paleta.height,
          width: paleta.width,
        ),
      ),
    );
  }
}

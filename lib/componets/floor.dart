import 'dart:async';

import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:robot_defender/robot_defender.dart';

class Floor extends PositionComponent {
  bool isOccupied = false;

  Floor({required position}) : super(position: position) {
    debugMode = true;
  }

  @override
  FutureOr<void> onLoad() {
    add(RectangleComponent(position: Vector2(10, 20), size: Vector2.all(10))
      ..setColor(Colors.red));
    return super.onLoad();
  }
}

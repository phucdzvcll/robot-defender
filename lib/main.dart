import 'package:flame/camera.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:robot_defender/robot_defender.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Flame.device.fullScreen();
  await Flame.device.setPortrait();

  runApp(GameWidget(game: RobotDefender()));
}

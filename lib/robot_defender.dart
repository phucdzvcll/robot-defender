import 'dart:async';
import 'dart:ffi';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:robot_defender/componets/floor.dart';

class RobotDefender extends FlameGame
    with HasCollisionDetection, ScaleDetector, ScrollDetector {
  double i = 0;

  @override
  FutureOr<void> onLoad() {
    debugMode = true;
    var floorsComponent = FloorsComponent();
    floorsComponent.anchor = Anchor.center;
    world.add(floorsComponent);
    return super.onLoad();
  }

  late double startZoom;

  @override
  void onScaleStart(ScaleStartInfo info) {
    startZoom = camera.viewfinder.zoom;
    super.onScaleStart(info);
  }

  // @override
  // void onScroll(PointerScrollInfo info) {
  //     camera.viewfinder.zoom += 0.1;
  //   super.onScroll(info);
  // }
  @override
  void onScroll(PointerScrollInfo info) {
    camera.viewfinder.zoom += 1;
    // clampZoom();
  }

  //
  void clampZoom() {
    camera.viewfinder.zoom = camera.viewfinder.zoom;
  }

  @override
  void onScaleUpdate(ScaleUpdateInfo info) {
    final currentScale = info.scale.global;
    if (!currentScale.isIdentity()) {
      camera.viewfinder.zoom = startZoom * currentScale.y;
      // clampZoom();
    } else {
      final delta = info.delta.global;
      camera.viewfinder.position.translate(-delta.x, -delta.y);
    }
  }
}

class FloorsComponent extends PositionComponent {
  final Map<int, Floor> floorMap = {};
  late final TiledComponent bg;

  @override
  FutureOr<void> onLoad() async {
    debugMode = true;
    bg = await TiledComponent.load("map.tmx", Vector2.all(64));
    add(bg);
    ObjectGroup? layer = bg.tileMap.getLayer<ObjectGroup>("floor");

    for (TiledObject ly in (layer?.objects ?? [])) {
      var position2 = Vector2(ly.x, ly.y);
      var floor = Floor(position: position2);
      floorMap[ly.id] = floor;
      add(floorMap[ly.id]!);
    }
    return super.onLoad();
  }
}

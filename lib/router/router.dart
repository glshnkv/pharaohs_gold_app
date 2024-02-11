import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pharaohs_gold_app/models/level_model.dart';
import 'package:pharaohs_gold_app/screens/game/game_screen.dart';
import 'package:pharaohs_gold_app/screens/home/home_screen.dart';
import 'package:pharaohs_gold_app/screens/levels/levels_screen.dart';
import 'package:pharaohs_gold_app/screens/pause/pause_screen.dart';
import 'package:pharaohs_gold_app/screens/settings/settings_screen.dart';
import 'package:pharaohs_gold_app/screens/time_left/time_left_screen.dart';
import 'package:pharaohs_gold_app/screens/win/win_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: LevelsRoute.page),
    AutoRoute(page: SettingsRoute.page),
    AutoRoute(page: GameRoute.page),
    AutoRoute(page: PauseRoute.page),
    AutoRoute(page: WinRoute.page),
    AutoRoute(page: TimeLeftRoute.page),

  ];
}
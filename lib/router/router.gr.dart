// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    GameRoute.name: (routeData) {
      final args = routeData.argsAs<GameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GameScreen(
          key: args.key,
          level: args.level,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LevelsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LevelsScreen(),
      );
    },
    PauseRoute.name: (routeData) {
      final args = routeData.argsAs<PauseRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: PauseScreen(
          key: args.key,
          level: args.level,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [GameScreen]
class GameRoute extends PageRouteInfo<GameRouteArgs> {
  GameRoute({
    Key? key,
    required LevelModel level,
    List<PageRouteInfo>? children,
  }) : super(
          GameRoute.name,
          args: GameRouteArgs(
            key: key,
            level: level,
          ),
          initialChildren: children,
        );

  static const String name = 'GameRoute';

  static const PageInfo<GameRouteArgs> page = PageInfo<GameRouteArgs>(name);
}

class GameRouteArgs {
  const GameRouteArgs({
    this.key,
    required this.level,
  });

  final Key? key;

  final LevelModel level;

  @override
  String toString() {
    return 'GameRouteArgs{key: $key, level: $level}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LevelsScreen]
class LevelsRoute extends PageRouteInfo<void> {
  const LevelsRoute({List<PageRouteInfo>? children})
      : super(
          LevelsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LevelsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PauseScreen]
class PauseRoute extends PageRouteInfo<PauseRouteArgs> {
  PauseRoute({
    Key? key,
    required LevelModel level,
    List<PageRouteInfo>? children,
  }) : super(
          PauseRoute.name,
          args: PauseRouteArgs(
            key: key,
            level: level,
          ),
          initialChildren: children,
        );

  static const String name = 'PauseRoute';

  static const PageInfo<PauseRouteArgs> page = PageInfo<PauseRouteArgs>(name);
}

class PauseRouteArgs {
  const PauseRouteArgs({
    this.key,
    required this.level,
  });

  final Key? key;

  final LevelModel level;

  @override
  String toString() {
    return 'PauseRouteArgs{key: $key, level: $level}';
  }
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

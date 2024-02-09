import 'package:flutter/material.dart';
import 'package:pharaohs_gold_app/router/router.dart';

class PharaohsGoldApp extends StatelessWidget {
  PharaohsGoldApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Roboto'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );  }
}

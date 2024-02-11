import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pharaohs_gold_app/models/level_model.dart';
import 'package:pharaohs_gold_app/repository/levels_repository.dart';
import 'package:pharaohs_gold_app/router/router.dart';
import 'package:pharaohs_gold_app/theme/colors.dart';
import 'package:pharaohs_gold_app/widgets/action_button_widget.dart';

@RoutePage()
class WinScreen extends StatefulWidget {
  final LevelModel level;

  const WinScreen({super.key, required this.level});

  @override
  State<WinScreen> createState() => _WinScreenState();
}

class _WinScreenState extends State<WinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppColors.gradientBackground,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(widget.level.difficultyIcon, width: 200),
                  Text(
                    'Level complete'.toUpperCase(),
                    style: TextStyle(
                        color: AppColors.lightBrown,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Roboto Serif'),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'You’ve passed the ',
                            style: TextStyle(
                              color: AppColors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${widget.level.difficulty}',
                            style: TextStyle(
                              color: AppColors.ivory,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'level difficulty level.',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ActionButtonWidget(
                          onTap: () {
                            context.router.push(HomeRoute());
                          },
                          verticalPadding: 10,
                          horizontalPadding: 12,
                          text: 'Back to menu',
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      SizedBox(width: 10),
                      ActionButtonWidget(
                          onTap: () {
                            switch (widget.level.difficulty) {
                              case 'Easy':
                                context.router.push(
                                    GameRoute(level: levelsRepository[1]));
                              case 'Normal':
                                context.router.push(
                                    GameRoute(level: levelsRepository[2]));
                              case 'Hard':
                                context.router.push(
                                    GameRoute(level: levelsRepository[0]));
                            }
                          },
                          verticalPadding: 10,
                          horizontalPadding: 12,
                          text: widget.level.difficulty == 'Hard'
                              ? 'Start Over'
                              : 'The next lvl difficulty',
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

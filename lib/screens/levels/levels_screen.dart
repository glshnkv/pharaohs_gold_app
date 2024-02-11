import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pharaohs_gold_app/models/level_model.dart';
import 'package:pharaohs_gold_app/repository/levels_repository.dart';
import 'package:pharaohs_gold_app/router/router.dart';
import 'package:pharaohs_gold_app/theme/colors.dart';
import 'package:pharaohs_gold_app/widgets/back_button_widget.dart';

@RoutePage()
class LevelsScreen extends StatefulWidget {
  const LevelsScreen({super.key});

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.gradientBackground,
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BackButtonWidget(onTap: () {
                      context.router.popAndPush(HomeRoute());
                    }),
                    Text(
                      'LEVELS'.toUpperCase(),
                      style: TextStyle(
                          color: AppColors.lightBrown,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto Serif'),
                    ),
                    SizedBox(width: 50),
                  ],
                ),
                Container(
                  height: 200,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: levelsRepository.length,
                    itemBuilder: (BuildContext context, int index) {
                      final LevelModel _level = levelsRepository[index];
                      return GestureDetector(
                        onTap: () {
                          if (_level.isActive) {
                            context.router.push(GameRoute(level: _level));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.darkBrown,
                            border: Border.all(
                                color: AppColors.lightBrown, width: 2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(
                                  _level.difficultyIcon,
                                  width: 200,
                                  opacity: _level.isActive
                                      ? AlwaysStoppedAnimation(1)
                                      : AlwaysStoppedAnimation(.5),
                                ),
                                Text(
                                  _level.difficulty,
                                  style: TextStyle(
                                      color: _level.isActive
                                          ? AppColors.ivory
                                          : AppColors.ivory.withOpacity(.5),
                                      fontWeight: FontWeight.w700,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                      width: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pharaohs_gold_app/models/level_model.dart';
import 'package:pharaohs_gold_app/router/router.dart';
import 'package:pharaohs_gold_app/theme/colors.dart';
import 'package:pharaohs_gold_app/widgets/action_button_widget.dart';

@RoutePage()
class TimeLeftScreen extends StatefulWidget {
  final LevelModel level;
  const TimeLeftScreen({super.key, required this.level});

  @override
  State<TimeLeftScreen> createState() => _TimeLeftScreenState();
}

class _TimeLeftScreenState extends State<TimeLeftScreen> {
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
                Image.asset(widget.level.difficultyIcon,
                    width: 200, opacity: AlwaysStoppedAnimation(.5)),
                Text(
                  'Time left'.toUpperCase(),
                  style: TextStyle(
                      color: AppColors.lightBrown,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto Serif'),
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
                          context.router
                              .push(GameRoute(level: widget.level));
                        },
                        verticalPadding: 10,
                        horizontalPadding: 12,
                        text: 'Try Again',
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

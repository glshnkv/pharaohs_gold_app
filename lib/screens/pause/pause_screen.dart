import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pharaohs_gold_app/models/level_model.dart';
import 'package:pharaohs_gold_app/router/router.dart';
import 'package:pharaohs_gold_app/theme/colors.dart';
import 'package:pharaohs_gold_app/widgets/action_button_widget.dart';
import 'package:pharaohs_gold_app/widgets/back_button_widget.dart';
import 'package:pharaohs_gold_app/widgets/settings_button.dart';

@RoutePage()
class PauseScreen extends StatefulWidget {
  final LevelModel level;
  const PauseScreen({super.key, required this.level});

  @override
  State<PauseScreen> createState() => _PauseScreenState();
}

class _PauseScreenState extends State<PauseScreen> {
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
              children: [
                Text(
                  'Pause'.toUpperCase(),
                  style: TextStyle(
                      color: AppColors.lightBrown,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto Serif'),
                ),
                Spacer(),
                Column(
                  children: [
                    ActionButtonWidget(
                        onTap: () {
                          context.router.push(GameRoute(level: widget.level));
                        },
                        verticalPadding: 12,
                        horizontalPadding: 45,
                        text: 'Continue',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    SizedBox(height: 15),
                    ActionButtonWidget(
                        onTap: () {
                          context.router.push(HomeRoute());
                        },
                        verticalPadding: 12,
                        horizontalPadding: 50,
                        text: 'To main',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    SizedBox(height: 15),
                    ActionButtonWidget(
                        onTap: () {},
                        verticalPadding: 12,
                        horizontalPadding: 65,
                        text: 'Exit',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SettingsButton(),
                    SizedBox(width: 10),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

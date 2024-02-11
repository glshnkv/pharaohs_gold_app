import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pharaohs_gold_app/router/router.dart';
import 'package:pharaohs_gold_app/theme/colors.dart';
import 'package:pharaohs_gold_app/widgets/action_button_widget.dart';
import 'package:pharaohs_gold_app/widgets/back_button_widget.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
                      'Settings'.toUpperCase(),
                      style: TextStyle(
                          color: AppColors.lightBrown,
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto Serif'),
                    ),
                    SizedBox(width: 50),
                  ],
                ),
                Column(
                  children: [
                    ActionButtonWidget(
                        onTap: () {},
                        verticalPadding: 12,
                        horizontalPadding: 45,
                        text: 'Share with friends',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    SizedBox(height: 15),
                    ActionButtonWidget(
                        onTap: () {},
                        verticalPadding: 12,
                        horizontalPadding: 60,
                        text: 'Privacy Policy',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    SizedBox(height: 15),
                    ActionButtonWidget(
                        onTap: () {},
                        verticalPadding: 12,
                        horizontalPadding: 64,
                        text: 'Terms of use',
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ],
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

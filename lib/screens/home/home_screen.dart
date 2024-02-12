import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:pharaohs_gold_app/router/router.dart';
import 'package:pharaohs_gold_app/theme/colors.dart';
import 'package:pharaohs_gold_app/widgets/action_button_widget.dart';
import 'package:pharaohs_gold_app/widgets/settings_button.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/elements/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Pharaoh\'s Gold'.toUpperCase(),
                  style: TextStyle(
                      color: AppColors.lightBrown,
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto Serif'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SettingsButton(),
                    ActionButtonWidget(
                        onTap: () {
                          context.router.push(LevelsRoute());
                        },
                        verticalPadding: 12,
                        horizontalPadding: 18,
                        text: 'Play',
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                    SizedBox(width: 50),
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

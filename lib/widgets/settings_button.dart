import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharaohs_gold_app/router/router.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.push(SettingsRoute());
      },
      child: SvgPicture.asset(
        'assets/images/elements/settings-button.svg', width: 50, height: 50,
      ),
    );
  }
}

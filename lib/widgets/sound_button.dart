import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SoundButton extends StatelessWidget {
  const SoundButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: SvgPicture.asset(
        'assets/images/elements/sound-button.svg', width: 50, height: 50,
      ),
    );
  }
}

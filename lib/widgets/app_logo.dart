import 'package:academy/constants.dart';
import 'package:academy/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.size = 140});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(paddingLarge),
        width: size,
        height: size,
        decoration: const BoxDecoration(
          // color: Colors.black,
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(Assets.svgs.academy));
  }
}

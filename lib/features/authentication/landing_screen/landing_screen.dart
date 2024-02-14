import 'package:academy/features/authentication/social_authentication/social_authentication_screen.dart';
import 'package:academy/widgets/app_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../widgets/loading_button.dart';
import '../../../exporter.dart';

class LandingPage extends StatefulWidget {
  static const String path = "/landing-page";

  const LandingPage({
    super.key,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(paddingXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const Align(
            //   alignment: Alignment.centerLeft,
            //   child: SizedBox(
            //       width: 100,
            //       child: AspectRatio(aspectRatio: 3, child: Placeholder())),
            // ),
            const Spacer(),
            const AppLogo(
              size: 200,
            ).animate().scaleXY(curve: Curves.fastOutSlowIn, begin: .8, end: 1),
            gapLarge,
            Text(
              'Learn anywhere,\nanytime with experts',
              style: context.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Text(
              "Create  an account or login",
              style: context.labelLarge,
              textAlign: TextAlign.center,
            ),
            gapLarge,
            LoadingButton(
              onPressed: () {
                // Navigator.pushNamed(context, PhoneVerification.path);
                Navigator.pushNamed(context, SocialAuthenticationScreen.path);
              },
              text: ('Get Started'),
              buttonLoading: false,
            ),
          ],
        ),
      ),
    ));
  }
}

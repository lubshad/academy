import 'package:academy/exporter.dart';
import 'package:academy/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../widgets/form_header.dart';

class SocialAuthenticationScreen extends StatefulWidget {
  static const String path = "/social-authentication";

  const SocialAuthenticationScreen({Key? key}) : super(key: key);

  @override
  State<SocialAuthenticationScreen> createState() =>
      _SocialAuthenticationScreenState();
}

class _SocialAuthenticationScreenState
    extends State<SocialAuthenticationScreen> {
  bool passwordVisible = false;

  bool buttonLoading = false;
  makeButtonLoading() {
    buttonLoading = true;
    setState(() {});
  }

  makeButtonNotLoading() {
    buttonLoading = false;
    setState(() {});
  }

  IconData? get visibilityIcon => passwordVisible
      ? Icons.visibility_off_outlined
      : Icons.visibility_outlined;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(paddingLarge),
        child: Column(
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    paddingLarge,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: paddingLarge,
                  vertical: paddingXL,
                ),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      Assets.svgs.study,
                      width: 100,
                    ),
                    gapLarge,
                    Text(
                      "Log in",
                      style: context.titleLarge,
                    ),
                    gapLarge,
                    FormHeader(
                      label: "Email",
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          hintText: "Email",
                        ),
                      ),
                    ),
                    gapLarge,
                    FormHeader(
                      label: "Password",
                      child: TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                            ),
                            hintText: "Password",
                            suffixIcon: IconButton(
                                onPressed: touglePasswordVisibility,
                                icon: Icon(visibilityIcon))),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                          onPressed: navigateForgotPassword,
                          child: Text(
                            "Forget Password?",
                            style: context.labelLarge.copyWith(
                              color: Colors.grey,
                            ),
                          )),
                    ),
                    gapLarge,
                    LoadingButton(
                        buttonLoading: buttonLoading,
                        text: "Log In",
                        onPressed: handleLoginClick)
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do not have an account?",
                  style: context.labelLarge.copyWith(
                    color: Colors.black.withOpacity(.5),
                  ),
                ),
                // gapSmall,
                TextButton(
                  style: TextButton.styleFrom(
                    // padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: signupAction,
                  child: Text(
                    "Sign Up",
                    style: context.bodyLarge,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void touglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void navigateForgotPassword() {}

  void handleLoginClick() {}

  void signupAction() {}
}

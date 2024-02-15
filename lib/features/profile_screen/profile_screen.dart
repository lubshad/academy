import 'package:academy/features/authentication/social_authentication/google_oauth_mixin.dart';
import 'package:academy/features/authentication/social_authentication/social_authentication_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../core/app_config.dart';
import '../../exporter.dart';
import '../../main.dart';
import '../../services/shared_preferences_services.dart';
import '../../widgets/loading_button.dart';
import '../web_view/web_view_screen.dart';
import 'profile_details_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<ProfileDetailsModel>? future;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    // future = DataRepository.i.fetchProfileDetails();
    packageInfo = await PackageInfo.fromPlatform();
    setState(() {});
  }

  PackageInfo? packageInfo;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(paddingLarge),
        child: Column(
          children: [
            DrawerHeader(
                child: ListTile(
              leading: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(FirebaseAuth
                        .instance.currentUser?.photoURL ??
                    "https://upload.wikimedia.org/wikipedia/commons/8/89/Portrait_Placeholder.png"),
              ),
              title: Text(FirebaseAuth.instance.currentUser?.email ?? ""),
            )),
            const Spacer(),
            LoadingButton(
                buttonLoading: false,
                text: "LOGOUT",
                onPressed: () => signOut(context)),
            if (packageInfo != null)
              Padding(
                  padding: const EdgeInsets.only(
                    bottom: paddingXL,
                    top: paddingXL,
                  ),
                  child: Text("Version : ${packageInfo!.version}"))
          ],
        ),
      )),
    );
  }
}

void showRefundPolicy() {
  Navigator.pushNamed(
      navigatorKey.currentContext!,
      Uri(path: WebViewScreen.path, queryParameters: {
        "title": "Refund Policy",
        "url": appConfig.baseUrl + appConfig.refundPolicy
      }).toString());
}

void showTermsAndConditions() {
  Navigator.pushNamed(
      navigatorKey.currentContext!,
      Uri(path: WebViewScreen.path, queryParameters: {
        "title": "Terms & Conditions",
        "url": appConfig.baseUrl + appConfig.termsAndConditions
      }).toString());
}

void showPrivacyPolicy() {
  Navigator.pushNamed(
      navigatorKey.currentContext!,
      Uri(path: WebViewScreen.path, queryParameters: {
        "title": "Privacy Policy",
        "url": appConfig.baseUrl + appConfig.privacyPolicy
      }).toString());
}

void signOut(context) {
  SharedPreferencesService.i.setValue(value: "");
  FirebaseAuth.instance.signOut();
  GoogleOauthMixin.signOut();
  Navigator.pushNamedAndRemoveUntil(
      context, SocialAuthenticationScreen.path, (route) => false);
}

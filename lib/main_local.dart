import 'package:flutter/material.dart';

import 'core/app_config.dart';
import 'main.dart';

class AppConfigLocal extends AppConfig {
  @override
  String get domain => "https://fakestoreapi.com";

  @override
  String get slugUrl => "/";

  @override
  // TODO: implement privacyPolicy
  String get privacyPolicy => throw UnimplementedError();

  @override
  // TODO: implement refundPolicy
  String get refundPolicy => throw UnimplementedError();

  @override
  // TODO: implement termsAndConditions
  String get termsAndConditions => throw UnimplementedError();
}

void main() async {
  await mainCommon();
  appConfig = AppConfigLocal();
  runApp(const MyApp());
}

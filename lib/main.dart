import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:utils_widget/utils_widget.dart';
import 'data/env.dart';
import 'utils/apiclient.dart';
import 'utils/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ApiClient.client
      .setEndpoint(Env.endpoint)
      .setProject(Env.projectId)
      .setSelfSigned(status: true);
  await Hive.initFlutter();
  setPathUrlStrategy();
  runApp(
    const ProviderScope(child: OverlayNotification.global(child: MyApp())),
  );
}

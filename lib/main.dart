import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router_mobile/routes/router.dart';
import 'package:go_router_mobile/services/notifications/notifications_service.dart';

NotificationsService notificationsService = NotificationsService();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const GoRouterMobile());
}

class GoRouterMobile extends StatefulWidget {
  const GoRouterMobile({Key? key}) : super(key: key);

  @override
  State<GoRouterMobile> createState() => _GoRouterMobileState();
}

class _GoRouterMobileState extends State<GoRouterMobile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Go Router and Push Notifications',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}

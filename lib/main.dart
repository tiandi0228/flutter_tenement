import 'package:flutter/material.dart';
import 'package:flutter_tenement/config/constants.dart';
import 'package:flutter_tenement/router/router.dart';
import 'package:flutter_tenement/screens/splash/splash_screen.dart';
import 'package:flutter_tenement/utils/notification_util.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> _ensureInitialized() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox('Box');
}

void main() async {
  await _ensureInitialized();
  NotificationService().initilized;
  MyRouter.configureRoutes(MyRouter.router);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '租房管理',
      theme: ThemeData(scaffoldBackgroundColor: backgroundColor),
      navigatorKey: navigatorKey,
      onGenerateRoute: MyRouter.router.generator,
      home: SplashScreen(),
    );
  }
}

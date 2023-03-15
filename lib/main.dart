import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_1/pages/onboarding_page.dart';
import 'package:flutter_1/provider/flags_provider.dart';
import 'package:flutter_1/provider/theme_provider.dart';
import 'package:flutter_1/routes.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(context)),
        ChangeNotifierProvider(create: (_) => FlagsProvider())
      ],
      child: PMSNApp(),
    );
  }
}

class PMSNApp extends StatelessWidget {
  const PMSNApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider theme = Provider.of<ThemeProvider>(context);
    return Sizer(
      builder: (context, orientation, deviceType) {
        Orientation.landscape;
        DeviceType.web;
        return MaterialApp(
            theme: theme.getthemeData(),
            routes: getApplicationRoutes(),
            home: OnboardingPage());
      },
    );
  }
}

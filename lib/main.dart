import 'package:flutter/material.dart';
import 'package:stop_frod/black_white_lists/black_white_list.dart';
import 'package:stop_frod/function.dart';
import 'package:stop_frod/global.dart';
import 'package:stop_frod/information/how_to_start.dart';
import 'package:stop_frod/onboarding/onboarding_list_pages.dart';
import 'package:stop_frod/paywall/paywall_page.dart';
import 'package:stop_frod/settings/settings_page.dart';
import 'package:stop_frod/start_page/start_page.dart';
import 'package:stop_frod/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: ThemeApp.allBackgroundColor,
            elevation: 0,
            titleTextStyle: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 0.36,
            )
        ),
        scaffoldBackgroundColor: ThemeApp.allBackgroundColor,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const StartPage(),
        '/onboarding': (context) => const OnboardingListPage(),
        '/paywall': (context) => const PaywallPage(),
        '/blacklist': (context) => BlackWhiteList(list: blackList,),
        '/whitelist': (context) => BlackWhiteList(list: whiteList,),
        '/information/Start': (context) => const HowToStart(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}
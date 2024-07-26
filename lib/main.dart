import 'package:bhagwat_geeta/provider/provider_page.dart';
import 'package:bhagwat_geeta/view/edit_page.dart';
import 'package:bhagwat_geeta/view/home_page.dart';
import 'package:bhagwat_geeta/view/splash_screen.dart';
import 'package:bhagwat_geeta/view/verses_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GeetaProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashScreen(),
          '/home': (context) => const HomePage(),
          '/verse': (context) => const VersesPage(),
          '/detail': (context) => const DisplayPage(),
        },
      ),
    );
  }
}

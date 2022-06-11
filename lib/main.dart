import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:real_apps/pages/Home.dart';
import 'package:real_apps/pages/Loading_screen.dart';
import 'package:real_apps/pages/Location.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightDynamic ??
                ColorScheme.fromSeed(
                  brightness: Brightness.light,
                  seedColor: Colors.red,
                ),
          ),
          themeMode: ThemeMode.system,
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkDynamic ??
                ColorScheme.fromSeed(
                  brightness: Brightness.dark,
                  seedColor: Colors.black,
                ),
          ),
          routes: {
            '/home': (context) => Home(),
            '/': (context) => LoadingScreen(),
            '/location': (context) => Location()
          },
        );
      },
    );
  }
}

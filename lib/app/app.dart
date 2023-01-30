import 'package:copofficial_app/app/theme.dart';
import 'package:copofficial_app/app/theme_service.dart';
import 'package:copofficial_app/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeService>(
      create: (context) => ThemeService(),
      child: Consumer(builder: (context, ThemeService theme, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CopOfficial',
          theme: theme.darkTheme! ? darkTheme : lightTheme,
          routes: {
            '/': (context) => const HomeScreen(),
          },
        );
      }),
    );
  }
}

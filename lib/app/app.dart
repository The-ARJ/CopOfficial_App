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
  DarkThemeProvider themeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();

    getCurrentTheme();
  }

  void getCurrentTheme() async {
    themeProvider.darkTheme = await themeProvider.myPreferences.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => themeProvider,
        child: Consumer<DarkThemeProvider>(
          builder: (context, value, child) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeStyles.themeStatus(themeProvider.darkTheme, context),
              debugShowCheckedModeBanner: false,
              home: const HomeScreen(),
            );
          },
        ));
  }
}

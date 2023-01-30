import 'package:copofficial_app/app/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.lightbulb_rounded,
              size: MediaQuery.of(context).size.width / 2,
              color: themeProvider.darkTheme
                  ? Theme.of(context).disabledColor
                  : Colors.orangeAccent,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  themeProvider.darkTheme ? "Dark Theme" : "Light Theme",
                  style: TextStyle(
                      color: Theme.of(context).indicatorColor, fontSize: 20),
                ),
                const SizedBox(
                  width: 16,
                ),
                Switch(
                  value: themeProvider.darkTheme,
                  onChanged: (value) => themeProvider.darkTheme = value,
                  activeColor: Theme.of(context).primaryColor,
                )
              ],
            )
          ],
        )));
  }
}

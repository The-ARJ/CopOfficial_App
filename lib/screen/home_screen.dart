import 'package:copofficial_app/app/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton:
          Consumer<ThemeService>(builder: (context, ThemeService theme, _) {
        return FloatingActionButton(
          // onPressed: _incrementCounter,
          onPressed: () {
            theme.toggletheme();
          },
          // tooltip: 'Increment',
          child:  Icon(theme.darkTheme!?Icons.sunny:Icons.dark_mode),
        );
      }),
    );
  }
}

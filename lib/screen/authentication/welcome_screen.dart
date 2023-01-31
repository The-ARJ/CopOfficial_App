import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Image(
              image: AssetImage(
                'assets/images/background1.png',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                SizedBox(
                  height: 60,
                  width: 330,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.mail,
                      size: 24.0,
                    ),
                    label: const Text(
                      'Continue with Email',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

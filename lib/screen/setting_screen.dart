import 'package:copofficial_app/app/theme_service.dart';
import 'package:copofficial_app/screen/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool light0 = true;
  bool light1 = true;
  bool light2 = true;
  final MaterialStateProperty<Icon?> appearance =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.dark_mode);
      }
      return const Icon(Icons.sunny);
    },
  );

  final MaterialStateProperty<Icon?> notification =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.notifications_active);
      }
      return const Icon(Icons.notifications_off);
    },
  );
  final MaterialStateProperty<Icon?> biometric =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.fingerprint);
      }
      return const Icon(Icons.fingerprint);
    },
  );
  _showalert() {
    showSnackbar(context, 'Link copied to clipboard!', Colors.teal);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Settings',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              // fontSize: responsiveHeight(context, 0.022, 0.05),
            ),
          ),
          titleSpacing: 00.0,
          centerTitle: true,
          // toolbarHeight: responsiveHeight(context, 0.072, 0.15),
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(10)),
          ),
          elevation: 0.00,
        ),
        body: Align(
          alignment: Alignment.center,
          child: Container(
            alignment: Alignment.topCenter,
            constraints: const BoxConstraints(
              minWidth: 100,
              maxWidth: 750,
            ),
            child: SingleChildScrollView(
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListTile(
                      leading: const Icon(
                        Icons.color_lens,
                      ),
                      title: Text("Appearance",
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              // fontSize: responsiveHeight(context, 0.02, 0.04),
                              )),
                      trailing: Switch(
                        thumbIcon: appearance,
                        value: themeProvider.darkTheme,
                        onChanged: (value) => themeProvider.darkTheme = value,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListTile(
                      leading: const Icon(
                        Icons.notifications_active,
                      ),
                      title: Text(
                        "Notification",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            // fontSize: responsiveHeight(context, 0.02, 0.04),
                            ),
                      ),
                      trailing: Switch(
                        thumbIcon: notification,
                        value: light1,
                        onChanged: (bool value) {
                          setState(() {
                            light1 = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListTile(
                      leading: const Icon(
                        Icons.fingerprint,
                      ),
                      title: Text(
                        "Biometric",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            // fontSize: responsiveHeight(context, 0.02, 0.04),
                            ),
                      ),
                      trailing: Switch(
                        thumbIcon: biometric,
                        value: light0,
                        onChanged: (bool value) {
                          setState(() {
                            light0 = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListTile(
                      leading: const Icon(
                        Icons.info,
                      ),
                      title: Text(
                        "About",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            // fontSize: responsiveHeight(context, 0.02, 0.04),
                            ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/AboutScreen');
                        // Navigate to about screen
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListTile(
                      leading: const Icon(
                        Icons.question_answer,
                      ),
                      title: Text(
                        "Help and FAQs",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            // fontSize: responsiveHeight(context, 0.02, 0.04),
                            ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                      onTap: () {
                        // Navigate to FAQ screen
                        Navigator.pushNamed(context, '/FAQScreen');
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListTile(
                      leading: const Icon(
                        Icons.share,
                      ),
                      title: Text(
                        "Share",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            // fontSize: responsiveHeight(context, 0.02, 0.04),
                            ),
                      ),
                      trailing: const Icon(Icons.copy),
                      onTap: () {
                        Clipboard.setData(const ClipboardData(
                            text: "https://www.example.com"));
                        _showalert();
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListTile(
                      leading: const Icon(
                        Icons.feedback,
                      ),
                      title: Text(
                        "Feedback",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            // fontSize: responsiveHeight(context, 0.02, 0.04),
                            ),
                      ),
                      onTap: () {
                        // FeedbackDialog.show(context);
                        Navigator.pushNamed(context, '/FeedBack');
                      },
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListTile(
                      leading: const Icon(
                        Icons.info,
                      ),
                      title: Text(
                        "More Info",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            // fontSize: responsiveHeight(context, 0.02, 0.04),
                            ),
                      ),
                      onTap: () {
                        Dialogs.bottomMaterialDialog(
                          msg: 'Version: 1.0.1',
                          title: 'FoodMobie',
                          context: context,
                          actions: [
                            IconsButton(
                              onPressed: () {
// Navigator.of(context).pop();
                              },
                              text: 'Check For Update',
                              iconData: Icons.update,
                              color: Colors.teal,
                            ),
                          ],
                        );
                      },
                      // trailing: const Icon(Icons.update, color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                        // color: Colors.deepOrangeAccent,
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: const Icon(
                        Icons.logout,
                        color: Colors.redAccent,
                      ),
                      title: Text(
                        "Log Out",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.redAccent,
                                  // fontSize: responsiveHeight(context, 0.02, 0.04),
                                ),
                      ),
                      onTap: () {
                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => const LoginScreen()),
                        // )
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

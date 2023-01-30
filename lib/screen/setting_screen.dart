import 'package:copofficial_app/screen/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notificationsEnabled = true;
  bool _biometricsEnabled = true;

  _showalert() {
    showSnackbar(context, 'Link copied to clipboard!', Colors.teal);
  }

  @override
  Widget build(BuildContext context) {
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
                        color: Colors.white,
                      ),
                      title: Text("Appearance",
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: Colors.white,
                                    // fontSize: responsiveHeight(context, 0.02, 0.04),
                                  )),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white),
                      onTap: () {
                        // Navigate to appearance settings screen
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListTile(
                      leading: const Icon(
                        Icons.notifications_active,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Notification",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  // fontSize: responsiveHeight(context, 0.02, 0.04),
                                ),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          setState(() {
                            _notificationsEnabled = !_notificationsEnabled;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 45,
                          height: 20,
                          decoration: BoxDecoration(
                            color: _notificationsEnabled
                                ? Colors.teal
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                left: _notificationsEnabled ? 25 : 0,
                                right: _notificationsEnabled ? 0 : 25,
                                top: 0,
                                bottom: 0,
                                child: Container(
                                  width: 30,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListTile(
                      leading: const Icon(
                        Icons.fingerprint,
                        color: Colors.white,
                      ),
                      title: Text(
                        "Biometric",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  // fontSize: responsiveHeight(context, 0.02, 0.04),
                                ),
                      ),
                      trailing: InkWell(
                        onTap: () {
                          setState(() {
                            _biometricsEnabled = !_biometricsEnabled;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 45,
                          height: 20,
                          decoration: BoxDecoration(
                            color:
                                _biometricsEnabled ? Colors.teal : Colors.grey,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                left: _biometricsEnabled ? 25 : 0,
                                right: _biometricsEnabled ? 0 : 25,
                                top: 0,
                                bottom: 0,
                                child: Container(
                                  width: 30,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListTile(
                      leading: const Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: Text(
                        "About",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  // fontSize: responsiveHeight(context, 0.02, 0.04),
                                ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white),
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
                        color: Colors.white,
                      ),
                      title: Text(
                        "Help and FAQs",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  // fontSize: responsiveHeight(context, 0.02, 0.04),
                                ),
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white),
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
                        color: Colors.white,
                      ),
                      title: Text(
                        "Share",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  // fontSize: responsiveHeight(context, 0.02, 0.04),
                                ),
                      ),
                      trailing: const Icon(Icons.copy, color: Colors.white),
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
                        color: Colors.white,
                      ),
                      title: Text(
                        "Feedback",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  // fontSize: responsiveHeight(context, 0.02, 0.04),
                                ),
                      ),
                      onTap: () {
                        // FeedbackDialog.show(context);
                        Navigator.pushNamed(context, '/FeedBack');
                      },
                      trailing: const Icon(Icons.arrow_forward_ios,
                          color: Colors.white),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: ListTile(
                      leading: const Icon(
                        Icons.info,
                        color: Colors.white,
                      ),
                      title: Text(
                        "More Info",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
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
                              textStyle: const TextStyle(color: Colors.white),
                              iconColor: Colors.white,
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

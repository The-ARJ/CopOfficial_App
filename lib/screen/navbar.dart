import 'package:copofficial_app/app/theme_service.dart';
import 'package:copofficial_app/screen/home_screen.dart';
import 'package:copofficial_app/screen/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:provider/provider.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const SettingsScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        bool willLeave = false;
        // show the confirm dialog

        await Dialogs.materialDialog(
            msg: 'Are you sure ? you want to exit',
            title: "Exit CopOfficial",
            color: Colors.white,
            context: context,
            actions: [
              IconsOutlineButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                text: 'Cancel',
                iconData: Icons.cancel_outlined,
                textStyle: const TextStyle(color: Colors.white),
                iconColor: Colors.white,
              ),
              IconsButton(
                onPressed: () {
                  willLeave = true;
                  Navigator.of(context).pop();
                  SystemNavigator.pop();
                },
                text: 'Confirm',
                iconData: Icons.exit_to_app,
                color: Colors.grey,
                textStyle: const TextStyle(color: Colors.white),
                iconColor: Colors.white,
              ),
            ]);
        return willLeave;
      },
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: themeProvider.darkTheme ? Colors.black : Colors.white,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(15),
            ),
            boxShadow: const [
              BoxShadow(
                blurRadius: 25,
                color: Colors.black45,
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: GNav(
                tabBorderRadius: 15,
                rippleColor: const Color(0xFF4F51A6),
                hoverColor: const Color(0xFF4F51A6),
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 200),
                tabBackgroundColor: const Color(0xFF4F51A6),
                color: themeProvider.darkTheme ? Colors.white : Colors.black87,
                tabs: const [
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.newspaper,
                    text: 'News',
                  ),
                  GButton(
                    icon: LineIcons.book,
                    text: 'Statements',
                  ),
                  GButton(
                    icon: LineIcons.cog,
                    text: 'Settings',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:copofficial_app/app/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: data.length,
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) => OnBoardContent(
                    image: data[index].image,
                    title: data[index].title,
                    description: data[index].descripition,
                  ),
                ),
              ),
              Row(
                children: [
                  ...List.generate(
                    data.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _pageIndex,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (_pageIndex == data.length - 1) {
                            Future.delayed(
                              const Duration(milliseconds: 500),
                              () {
                                Navigator.pushReplacementNamed(context, '/Nav');
                              },
                            );
                          } else {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                          }
                        },
                        child: const Icon(Icons.keyboard_arrow_right)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    return AnimatedContainer(
      height: 4,
      width: isActive ? 12 : 4,
      decoration: BoxDecoration(
        color: themeProvider.darkTheme ? Colors.white : const Color(0xFF4F51A6),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}

class Onboard {
  final String image, title, descripition;
  Onboard({
    required this.image,
    required this.title,
    required this.descripition,
  });
}

final List<Onboard> data = [
  Onboard(
      image: 'assets/images/onboarding1.png',
      title: 'Crime Reporting',
      descripition:
          'Users can report crimes and suspicious activity through the app, including the option to upload photos or videos as evidence.'),
  Onboard(
      image: 'assets/images/onboarding2.png',
      title: 'Community Policing',
      descripition:
          'The app allows users to stay informed about local crime trends and events, and to communicate with their neighbourhood police officers.'),
  Onboard(
      image: 'assets/images/onboarding3.png',
      title: 'Crime Mapping',
      descripition:
          'The app provides a map-based interface for users to view crime incidents in their area, including the ability to filter by crime type, date, and location.'),
  Onboard(
      image: 'assets/images/onboarding4.png',
      title: 'Complaints',
      descripition:
          'Citizens can submit complaints about the incidents which will be forwarded to the appropriate department for investigation.'),
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });
  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);

    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF4F51A6),
                ),
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            description,
            style: TextStyle(
                color: themeProvider.darkTheme
                    ? Colors.white
                    : const Color(0xFF4F51A6)),
          ),
        ),
        const Spacer()
      ],
    );
  }
}

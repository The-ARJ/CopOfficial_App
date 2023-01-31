import 'package:flutter/material.dart';

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
    return AnimatedContainer(
      height: 4,
      width: isActive ? 12 : 4,
      decoration: const BoxDecoration(
        color: Colors.purple,
        borderRadius: BorderRadius.all(
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
      title: 'Find the Item you have been looking for',
      descripition: 'Here you will see rich varities of goods'),
  Onboard(
      image: 'assets/images/onboarding2.png',
      title: 'Find the Item you have been looking for',
      descripition: 'Here you will see rich varities of goods'),
  Onboard(
      image: 'assets/images/onboarding3.png',
      title: 'Find the Item you have been looking for',
      descripition: 'Here you will see rich varities of goods'),
  Onboard(
      image: 'assets/images/onboarding4.png',
      title: 'Find the Item you have been looking for',
      descripition: 'Here you will see rich varities of goods'),
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
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          height: 250,
        ),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer()
      ],
    );
  }
}

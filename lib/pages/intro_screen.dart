import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:peaksique/pages/navigation.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> intropages = [
      PageViewModel(
        image: Transform.translate(
          offset: const Offset(0,60),
          child: SvgPicture.asset(
            'assets/icons/linechart.svg',
            colorFilter: const ColorFilter.mode(
              Colors.pinkAccent,
              BlendMode.srcIn,
            ),
            height: 200,
          ),
        ),
        titleWidget: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: ' Welcome to PEAK',
                style: TextStyle(
                  color: Colors.white
                )
              ),
              TextSpan(
                text: 'SIQUE',
                style: TextStyle(
                  color: Colors.pinkAccent
                )
              ),
            ]
          ),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        body: "Your ultimate fitness companion for tracking and analyzing your workouts.",
        decoration: const PageDecoration(
          titlePadding: EdgeInsets.only(bottom: 20),
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          bodyTextStyle: TextStyle(
            fontSize: 16,
            color: Colors.white70
          ),
          bodyAlignment: Alignment.topCenter,
        )
      ),
      PageViewModel(
        title: "Track Your Progress",
        body: "Easily log your workouts and monitor your progress over time.",
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
          bodyTextStyle: TextStyle(
            fontSize: 16,
            color: Colors.white70
          ),
          titlePadding: EdgeInsets.only(top: 130, bottom: 20),
          bodyAlignment: Alignment.center,
        )
      ),
      PageViewModel(
        title: "Analyze Your Performance",
        body: "Get insights into your workout data to optimize your training.",
        footer: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 500),
                pageBuilder: (context, animation, secondaryAnimation) => MainLayout(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  final tween = Tween(
                    begin: Offset(0, 0.3), // start slightly below
                    end: Offset.zero,
                  ).chain(CurveTween(curve: Curves.easeOut));

                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    ),
                  );
                },
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pinkAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          ),
          child: const Text(
            "Get Started",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        decoration: const PageDecoration(
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyTextStyle: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
          fullScreen: true,
          titlePadding: EdgeInsets.only(top: 90, bottom: 20),
          bodyAlignment: Alignment.center
        ),
      ),
    ];

    return Center(
      child: IntroductionScreen(  
        pages: intropages,
        globalBackgroundColor: Colors.black,
        showNextButton: false,
        showDoneButton: false,
        dotsDecorator: DotsDecorator(
          size: const Size.square(10.0),
          activeSize: const Size(20.0, 10.0),
          activeColor: Colors.pinkAccent,
          color: Colors.pinkAccent,
          spacing: const EdgeInsets.symmetric(horizontal: 3.0),
          activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0)
          ),
        ),
      ),
    );
  }
}
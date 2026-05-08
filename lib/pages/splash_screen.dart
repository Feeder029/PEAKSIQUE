import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peaksique/pages/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Grid background
          CustomPaint(
            size: Size.infinite,
            painter: GridPainter(),
          ),
          splashContent(),
        ],
      ),
    );
  }

  Widget splashContent() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = constraints.maxHeight;
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.30),
              Align(
                alignment: Alignment.centerLeft,
                child: SvgPicture.asset(
                  'assets/icons/linechart.svg',
                  colorFilter: ColorFilter.mode(Colors.pinkAccent, BlendMode.srcIn),
                  height: height * 0.12,
                  width: height * 0.14,
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'PEAK',
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
                  ],
                  style: TextStyle(
                    fontSize: height * 0.06,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              Text(
                'Reach the peak,',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: height * 0.02,
                  
                ),
              ),
              Text(
                'By training the physique.',
                style: TextStyle(
                  color: Colors.white.withOpacity(0.5), 
                  fontSize: height * 0.02
                ),
              ),
              SizedBox(height: height * 0.30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (context, animation, secondaryAnimation) => IntroScreen(),
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
                  foregroundColor: Colors.white,
                  minimumSize: Size(double.infinity, height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'START LIFTING',
                  style: TextStyle(
                    fontSize: height * 0.020,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.1)
      ..strokeWidth = 1;

    const spacing = 50.0;

    // vertical lines
    for (double x = 0; x <= size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // horizontal lines
    for (double y = 0; y <= size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
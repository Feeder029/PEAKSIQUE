import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PEAKSIQUE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
      ),
      home: const IntroScreen(),
    );
  }
}

// ─── Shared Colors ────────────────────────────────────────────────────────────

const kBg = Color(0xFF0A0A0F);
const kPink = Color(0xFFFF2D78);
const kOrange = Color(0xFFFF6B35);
const kPurple = Color(0xFF9B4FFF);
const kMuted = Color(0xFF8A8A9A);
const kDim = Color(0xFF55556A);
const kSurface = Color(0xFF13131A);
const kBorder = Color(0xFF2A2A38);

// ─── Intro Screen ─────────────────────────────────────────────────────────────

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with TickerProviderStateMixin {
  late AnimationController _bgController;
  late AnimationController _logoController;
  late AnimationController _taglineController;
  late AnimationController _buttonController;
  late AnimationController _pulseController;

  late Animation<double> _logoScale;
  late Animation<double> _logoOpacity;
  late Animation<Offset> _taglineSlide;
  late Animation<double> _taglineOpacity;
  late Animation<double> _buttonOpacity;
  late Animation<Offset> _buttonSlide;
  late Animation<double> _pulse;

  @override
  void initState() {
    super.initState();

    _bgController = AnimationController(
        vsync: this, duration: const Duration(seconds: 8))
      ..repeat();

    _logoController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));

    _taglineController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 700));

    _buttonController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    _pulseController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500))
      ..repeat(reverse: true);

    _logoScale = Tween<double>(begin: 0.6, end: 1.0).animate(
        CurvedAnimation(parent: _logoController, curve: Curves.elasticOut));
    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: _logoController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn)));

    _taglineSlide =
        Tween<Offset>(begin: const Offset(0, 0.5), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _taglineController, curve: Curves.easeOutCubic));
    _taglineOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _taglineController, curve: Curves.easeIn));

    _buttonOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _buttonController, curve: Curves.easeIn));
    _buttonSlide =
        Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _buttonController, curve: Curves.easeOutCubic));

    _pulse = Tween<double>(begin: 1.0, end: 1.06).animate(
        CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut));

    Future.delayed(const Duration(milliseconds: 200),
        () => _logoController.forward());
    Future.delayed(const Duration(milliseconds: 800),
        () => _taglineController.forward());
    Future.delayed(const Duration(milliseconds: 1300),
        () => _buttonController.forward());
  }

  @override
  void dispose() {
    _bgController.dispose();
    _logoController.dispose();
    _taglineController.dispose();
    _buttonController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  void _onStartLifting() {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (_, animation, __) => const AuthChoiceScreen(),
      transitionsBuilder: (_, animation, __, child) {
        return FadeTransition(
          opacity: animation,
          child: SlideTransition(
            position: Tween<Offset>(
                    begin: const Offset(0, 0.06), end: Offset.zero)
                .animate(
                    CurvedAnimation(parent: animation, curve: Curves.easeOut)),
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 400),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge([
          _bgController,
          _logoController,
          _taglineController,
          _buttonController,
          _pulseController
        ]),
        builder: (context, _) {
          return Stack(
            children: [
              Container(width: size.width, height: size.height, color: kBg),
              _buildOrb(size,
                  angle: _bgController.value * 2 * math.pi,
                  color: kPink,
                  offsetX: 0.15,
                  offsetY: 0.2,
                  radius: size.width * 0.55,
                  opacity: 0.18),
              _buildOrb(size,
                  angle: -_bgController.value * 2 * math.pi * 0.7,
                  color: kOrange,
                  offsetX: 0.85,
                  offsetY: 0.35,
                  radius: size.width * 0.45,
                  opacity: 0.13),
              _buildOrb(size,
                  angle: _bgController.value * 2 * math.pi * 0.4,
                  color: kPurple,
                  offsetX: 0.5,
                  offsetY: 0.78,
                  radius: size.width * 0.5,
                  opacity: 0.12),
              CustomPaint(size: size, painter: _GridPainter(opacity: 0.06)),
              Positioned(
                top: size.height * 0.08,
                left: -size.width * 0.1,
                child: Transform.rotate(
                  angle: -0.15,
                  child: Container(
                    width: size.width * 1.2,
                    height: 1.5,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.transparent,
                        kPink.withOpacity(0.6),
                        Colors.transparent,
                      ]),
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Spacer(flex: 3),
                      Opacity(
                        opacity: _logoOpacity.value,
                        child: ScaleTransition(
                            scale: _logoScale, child: _buildPeakIcon()),
                      ),
                      const SizedBox(height: 28),
                      Opacity(
                        opacity: _logoOpacity.value,
                        child: ScaleTransition(
                            scale: _logoScale, child: _buildLogoText()),
                      ),
                      const SizedBox(height: 16),
                      FadeTransition(
                        opacity: _taglineOpacity,
                        child: SlideTransition(
                          position: _taglineSlide,
                          child: const Text(
                            'Track every rep.\nReach every peak.',
                            style: TextStyle(
                                fontSize: 16,
                                height: 1.6,
                                color: kMuted,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.4),
                          ),
                        ),
                      ),
                      const Spacer(flex: 3),
                      FadeTransition(
                        opacity: _buttonOpacity,
                        child: SlideTransition(
                          position: _buttonSlide,
                          child: ScaleTransition(
                            scale: _pulse,
                            child: _GradientButton(
                              label: 'START LIFTING',
                              onTap: _onStartLifting,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOrb(Size size,
      {required double angle,
      required Color color,
      required double offsetX,
      required double offsetY,
      required double radius,
      required double opacity}) {
    return Positioned(
      left: size.width * offsetX - radius / 2,
      top: size.height * offsetY - radius / 2,
      child: Transform.rotate(
        angle: angle,
        child: Container(
          width: radius,
          height: radius,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(colors: [
              color.withOpacity(opacity),
              color.withOpacity(0),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildPeakIcon() => SizedBox(
      width: 56, height: 48, child: CustomPaint(painter: _PeakIconPainter()));

  Widget _buildLogoText() => RichText(
        text: const TextSpan(children: [
          TextSpan(
              text: 'PEAK',
              style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  letterSpacing: -1.5,
                  height: 1.0)),
          TextSpan(
              text: 'SIQUE',
              style: TextStyle(
                  fontSize: 52,
                  fontWeight: FontWeight.w900,
                  color: kPink,
                  letterSpacing: -1.5,
                  height: 1.0)),
        ]),
      );
}

// ─── Auth Choice Screen ───────────────────────────────────────────────────────

class AuthChoiceScreen extends StatefulWidget {
  const AuthChoiceScreen({super.key});

  @override
  State<AuthChoiceScreen> createState() => _AuthChoiceScreenState();
}

class _AuthChoiceScreenState extends State<AuthChoiceScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _enterController;
  late Animation<double> _fadeIn;
  late Animation<Offset> _slideIn;

  @override
  void initState() {
    super.initState();
    _enterController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
    _fadeIn = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _enterController, curve: Curves.easeOut));
    _slideIn =
        Tween<Offset>(begin: const Offset(0, 0.12), end: Offset.zero).animate(
            CurvedAnimation(
                parent: _enterController, curve: Curves.easeOutCubic));
    _enterController.forward();
  }

  @override
  void dispose() {
    _enterController.dispose();
    super.dispose();
  }

  void _goTo(Widget screen) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (_, animation, __) => screen,
      transitionsBuilder: (_, animation, __, child) => FadeTransition(
        opacity: animation,
        child: SlideTransition(
          position:
              Tween<Offset>(begin: const Offset(0.06, 0), end: Offset.zero)
                  .animate(CurvedAnimation(
                      parent: animation, curve: Curves.easeOut)),
          child: child,
        ),
      ),
      transitionDuration: const Duration(milliseconds: 350),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kBg,
      body: Stack(
        children: [
          // Subtle bg orb
          Positioned(
            top: -size.width * 0.3,
            right: -size.width * 0.2,
            child: Container(
              width: size.width * 0.8,
              height: size.width * 0.8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [
                  kPink.withOpacity(0.12),
                  kPink.withOpacity(0),
                ]),
              ),
            ),
          ),
          CustomPaint(size: size, painter: _GridPainter(opacity: 0.04)),

          SafeArea(
            child: FadeTransition(
              opacity: _fadeIn,
              child: SlideTransition(
                position: _slideIn,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      // Back button
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: kSurface,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kBorder),
                          ),
                          child: const Icon(Icons.arrow_back_ios_new_rounded,
                              color: Colors.white, size: 16),
                        ),
                      ),

                      const Spacer(flex: 2),

                      // Mini logo
                      Row(children: [
                        SizedBox(
                            width: 28,
                            height: 24,
                            child: CustomPaint(painter: _PeakIconPainter())),
                        const SizedBox(width: 10),
                        RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                                text: 'PEAK',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white,
                                    letterSpacing: -0.8)),
                            TextSpan(
                                text: 'SIQUE',
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w900,
                                    color: kPink,
                                    letterSpacing: -0.8)),
                          ]),
                        ),
                      ]),

                      const SizedBox(height: 36),

                      const Text(
                        'Join the\ngrind.',
                        style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          height: 1.1,
                          letterSpacing: -1.2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Create an account or log in to start\ntracking your lifts.',
                        style: TextStyle(
                            fontSize: 15, color: kMuted, height: 1.55),
                      ),

                      const Spacer(flex: 3),

                      // Sign Up button
                      _GradientButton(
                        label: 'CREATE ACCOUNT',
                        onTap: () => _goTo(const SignUpScreen()),
                      ),

                      const SizedBox(height: 14),

                      // Log In button (outlined)
                      GestureDetector(
                        onTap: () => _goTo(const LoginScreen()),
                        child: Container(
                          width: double.infinity,
                          height: 58,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(color: kBorder, width: 1.5),
                            color: kSurface,
                          ),
                          child: const Center(
                            child: Text(
                              'LOG IN',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 2.5,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      // OR divider
                      Row(children: [
                        Expanded(
                            child: Container(height: 1, color: kBorder)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          child: Text('or continue with',
                              style: TextStyle(
                                  color: kDim, fontSize: 12)),
                        ),
                        Expanded(
                            child: Container(height: 1, color: kBorder)),
                      ]),

                      const SizedBox(height: 20),

                      // Social buttons
                      Row(children: [
                        Expanded(
                            child: _SocialButton(
                                label: 'Google',
                                icon: Icons.g_mobiledata_rounded)),
                        const SizedBox(width: 12),
                        Expanded(
                            child: _SocialButton(
                                label: 'Apple',
                                icon: Icons.apple_rounded)),
                      ]),

                      const SizedBox(height: 32),

                      Center(
                        child: Text(
                          'By continuing you agree to our Terms & Privacy Policy.',
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(color: kDim, fontSize: 12, height: 1.5),
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Sign Up Screen ───────────────────────────────────────────────────────────

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  bool _obscurePass = true;
  bool _obscureConfirm = true;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _fade = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _slide =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
            CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fade,
          child: SlideTransition(
            position: _slide,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: kSurface,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kBorder),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white, size: 16),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text('Create\naccount.',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          height: 1.1,
                          letterSpacing: -1.2)),
                  const SizedBox(height: 8),
                  const Text("Let's get you set up.",
                      style: TextStyle(fontSize: 15, color: kMuted)),
                  const SizedBox(height: 36),

                  _InputField(label: 'Full Name', hint: 'e.g. Alex Rivera'),
                  const SizedBox(height: 16),
                  _InputField(
                      label: 'Email',
                      hint: 'you@example.com',
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 16),
                  _InputField(
                    label: 'Password',
                    hint: 'Min. 8 characters',
                    obscureText: _obscurePass,
                    suffixIcon: GestureDetector(
                      onTap: () =>
                          setState(() => _obscurePass = !_obscurePass),
                      child: Icon(
                          _obscurePass
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: kDim,
                          size: 20),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _InputField(
                    label: 'Confirm Password',
                    hint: 'Repeat password',
                    obscureText: _obscureConfirm,
                    suffixIcon: GestureDetector(
                      onTap: () =>
                          setState(() => _obscureConfirm = !_obscureConfirm),
                      child: Icon(
                          _obscureConfirm
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: kDim,
                          size: 20),
                    ),
                  ),
                  const SizedBox(height: 36),

                  _GradientButton(label: 'CREATE ACCOUNT', onTap: () {}),
                  const SizedBox(height: 24),

                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: RichText(
                        text: const TextSpan(
                          text: 'Already have an account? ',
                          style: TextStyle(color: kDim, fontSize: 14),
                          children: [
                            TextSpan(
                                text: 'Log in',
                                style: TextStyle(
                                    color: kPink,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Login Screen ─────────────────────────────────────────────────────────────

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  bool _obscurePass = true;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _fade = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOut));
    _slide =
        Tween<Offset>(begin: const Offset(0, 0.1), end: Offset.zero).animate(
            CurvedAnimation(parent: _ctrl, curve: Curves.easeOutCubic));
    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBg,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fade,
          child: SlideTransition(
            position: _slide,
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: kSurface,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: kBorder),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white, size: 16),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text('Welcome\nback.',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          height: 1.1,
                          letterSpacing: -1.2)),
                  const SizedBox(height: 8),
                  const Text("Log in to continue your grind.",
                      style: TextStyle(fontSize: 15, color: kMuted)),
                  const SizedBox(height: 36),

                  _InputField(
                      label: 'Email',
                      hint: 'you@example.com',
                      keyboardType: TextInputType.emailAddress),
                  const SizedBox(height: 16),
                  _InputField(
                    label: 'Password',
                    hint: 'Your password',
                    obscureText: _obscurePass,
                    suffixIcon: GestureDetector(
                      onTap: () =>
                          setState(() => _obscurePass = !_obscurePass),
                      child: Icon(
                          _obscurePass
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: kDim,
                          size: 20),
                    ),
                  ),
                  const SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: const Text('Forgot password?',
                          style: TextStyle(
                              color: kPink,
                              fontSize: 13,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),

                  const SizedBox(height: 36),

                  _GradientButton(label: 'LOG IN', onTap: () {}),
                  const SizedBox(height: 28),

                  // OR divider
                  Row(children: [
                    Expanded(child: Container(height: 1, color: kBorder)),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 14),
                      child: Text('or',
                          style: TextStyle(color: kDim, fontSize: 12)),
                    ),
                    Expanded(child: Container(height: 1, color: kBorder)),
                  ]),

                  const SizedBox(height: 20),

                  Row(children: [
                    Expanded(
                        child: _SocialButton(
                            label: 'Google',
                            icon: Icons.g_mobiledata_rounded)),
                    const SizedBox(width: 12),
                    Expanded(
                        child: _SocialButton(
                            label: 'Apple', icon: Icons.apple_rounded)),
                  ]),

                  const SizedBox(height: 32),

                  Center(
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: RichText(
                        text: const TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: kDim, fontSize: 14),
                          children: [
                            TextSpan(
                                text: 'Sign up',
                                style: TextStyle(
                                    color: kPink,
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ─── Reusable Widgets ─────────────────────────────────────────────────────────

class _GradientButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _GradientButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: const LinearGradient(
              colors: [kPink, kOrange],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          boxShadow: [
            BoxShadow(
                color: kPink.withOpacity(0.35),
                blurRadius: 24,
                offset: const Offset(0, 8))
          ],
        ),
        child: Center(
          child: Text(label,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2.5)),
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;

  const _InputField({
    required this.label,
    required this.hint,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: const TextStyle(
                color: kMuted,
                fontSize: 12,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8)),
        const SizedBox(height: 8),
        TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: const TextStyle(color: Colors.white, fontSize: 15),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: kDim, fontSize: 15),
            suffixIcon: suffixIcon != null
                ? Padding(
                    padding: const EdgeInsets.only(right: 14),
                    child: suffixIcon)
                : null,
            suffixIconConstraints:
                const BoxConstraints(minWidth: 0, minHeight: 0),
            filled: true,
            fillColor: kSurface,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: kBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: kBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: kPink, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;

  const _SocialButton({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: kSurface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: kBorder),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white, size: 22),
            const SizedBox(width: 8),
            Text(label,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}

// ─── Custom Painters ─────────────────────────────────────────────────────────

class _PeakIconPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.5
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    paint.shader = LinearGradient(colors: const [kPink, kOrange])
        .createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * 0.28, size.height * 0.45)
      ..lineTo(size.width * 0.45, size.height * 0.65)
      ..lineTo(size.width * 0.62, size.height * 0.1)
      ..lineTo(size.width * 0.78, size.height * 0.55)
      ..lineTo(size.width, size.height);

    canvas.drawPath(path, paint);
    canvas.drawCircle(Offset(size.width * 0.62, size.height * 0.1), 3.5,
        Paint()..color = kPink);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _GridPainter extends CustomPainter {
  final double opacity;
  _GridPainter({required this.opacity});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(opacity)
      ..strokeWidth = 0.5;
    const spacing = 40.0;
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
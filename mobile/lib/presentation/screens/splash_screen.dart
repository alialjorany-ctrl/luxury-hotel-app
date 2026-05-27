import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';
import '../../config/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();

    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightDarkColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo with animation
            ScaleTransition(
              scale: _animation,
              child: FadeTransition(
                opacity: _animation,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppTheme.primaryColor,
                        AppTheme.primaryColor.withOpacity(0.6),
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppTheme.primaryColor.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      '🏨',
                      style: TextStyle(fontSize: 60),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // App name
            Text(
              'Luxury Hotel',
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: AppTheme.textColor,
                    letterSpacing: 2,
                  ),
            )
                .animate()
                .fadeIn(duration: const Duration(milliseconds: 800))
                .slideX(begin: -0.3, end: 0),
            const SizedBox(height: 8),
            // Tagline
            Text(
              'تجربة فاخرة في قلب العراق',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppTheme.textSecondaryColor,
                  ),
            )
                .animate()
                .fadeIn(duration: const Duration(milliseconds: 800), delay: const Duration(milliseconds: 200))
                .slideX(begin: 0.3, end: 0),
            const SizedBox(height: 60),
            // Loading animation
            SizedBox(
              height: 50,
              child: Lottie.asset(
                'assets/animations/loading.json',
                repeat: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

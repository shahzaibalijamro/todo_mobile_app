import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/constants/colors.dart';
import 'package:todo_app/constants/images.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/views/layout_page.dart';
import 'package:todo_app/views/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  Timer? _navigationTimer;

  Future<String?> checkUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? userInMemory = prefs.getString('user');

    if (userInMemory != null) {
      final User user = User.fromJSON(userInMemory);
      return user.email;
    }

    return null;
  }

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.8, curve: Curves.easeOutBack),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.65, curve: Curves.easeIn),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0.0, 0.25), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.2, 0.9, curve: Curves.easeOutCubic),
          ),
        );

    _controller.forward();

    // Navigate to LoginScreen after 2 seconds
    _navigationTimer = Timer(const Duration(seconds: 5), () async {
      final String? userEmail = await checkUser();
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              userEmail != null
              ? LayoutPageScreen(userEmail: userEmail)
              : const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 400),
        ),
      );
    });
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          // Soft ambient background glow matching brand palette
          Positioned(
            top: size.height * 0.22,
            left: size.width * 0.5 - 160,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    AppColors.paleLavender.withValues(alpha: 0.65),
                    AppColors.backgroundColor.withValues(alpha: 0.0),
                  ],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Center(
              child: FadeTransition(
                opacity: _fadeAnimation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 3),

                    // Premium Animated App Logo
                    ScaleTransition(
                      scale: _scaleAnimation,
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(34),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryPurple.withValues(
                                alpha: 0.22,
                              ),
                              blurRadius: 36,
                              offset: const Offset(0, 16),
                              spreadRadius: -4,
                            ),
                            BoxShadow(
                              color: AppColors.darkNavyText.withValues(
                                alpha: 0.04,
                              ),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(34),
                          child: Image.asset(
                            AppImages.appLogo,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Title & Tagline with smooth entrance
                    SlideTransition(
                      position: _slideAnimation,
                      child: Column(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Todo",
                                  style: GoogleFonts.googleSansFlex(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.darkNavyText,
                                    letterSpacing: -0.6,
                                  ),
                                ),
                                TextSpan(
                                  text: ".",
                                  style: GoogleFonts.googleSansFlex(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w800,
                                    color: AppColors.primaryPurple,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Organize your day with ease",
                            style: GoogleFonts.googleSansFlex(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mutedText,
                              letterSpacing: 0.1,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(flex: 3),

                    // Elegant minimal bottom loader & subtitle
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(
                            width: 26,
                            height: 26,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                              strokeCap: StrokeCap.round,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primaryPurple,
                              ),
                              backgroundColor: AppColors.paleLavender,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "DAILY PRODUCTIVITY",
                            style: GoogleFonts.googleSansFlex(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mutedText.withValues(alpha: 0.7),
                              letterSpacing: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

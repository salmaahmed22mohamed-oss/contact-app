import 'package:contactapp/core/theme/app_assets.dart';
import 'package:contactapp/core/theme/app_colors.dart';
import 'package:contactapp/features/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String routeName = 'Splash-Screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Center(
        child: Image.asset(
          AppAssets.routeLogo,
          width: MediaQuery.of(context).size.width * 0.5,
        ),
      ),
    );
  }
}

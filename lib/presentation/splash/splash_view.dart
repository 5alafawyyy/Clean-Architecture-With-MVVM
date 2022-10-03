import 'dart:async';

import 'package:clean_architecture_with_mvvm/presentation/resources/assets_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/color_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/constants_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/routes_manager.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(AppDuration.splashDuration, _goNext);
  }

  _goNext() {
    Navigator.pushReplacementNamed(
      context,
      Routes.onBoardingRoute,
    );
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
          image: AssetImage(
            ImageAssets.splashLogo,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
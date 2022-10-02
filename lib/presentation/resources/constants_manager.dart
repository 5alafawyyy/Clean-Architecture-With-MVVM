class AppConstants {
  static const int splashDelay = 2;
  static const int sliderAnimationTime = 300;
}

class AppDuration {
  static Duration splashDuration = const Duration(
    seconds: AppConstants.splashDelay,
  );
  
  static Duration sliderAnimationDuration = const Duration(
    milliseconds: AppConstants.sliderAnimationTime,
  );
}

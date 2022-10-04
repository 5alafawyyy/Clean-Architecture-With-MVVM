import 'dart:async';
import 'package:clean_architecture_with_mvvm/domain/models/models.dart';
import 'package:clean_architecture_with_mvvm/presentation/base/base_view_model.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/assets_manager.dart';
import 'package:clean_architecture_with_mvvm/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  // Stream Controllers Outputs
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void start() {
    // OnBoarding View Model Start
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
  }

  // OnBoarding ViewModel Inputs
  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
      _currentIndex = nextIndex;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
      _currentIndex = previousIndex;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // OnBoarding ViewModel Outputs
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // OnBoarding Private Functions
  void _postDataToView() {
    inputSliderViewObject.add(
      SliderViewObject(
        sliderObject: _list[_currentIndex],
        numOfSlides: _list.length,
        currentIndex: _currentIndex,
      ),
    );
  }

  List<SliderObject> _getSliderData() {
    return [
      SliderObject(
        title: AppStrings.onBoardingTitle1,
        subTitle: AppStrings.onBoardingSubTitle1,
        image: ImageAssets.onBoardingLogo1,
      ),
      SliderObject(
        title: AppStrings.onBoardingTitle2,
        subTitle: AppStrings.onBoardingSubTitle2,
        image: ImageAssets.onBoardingLogo2,
      ),
      SliderObject(
        title: AppStrings.onBoardingTitle3,
        subTitle: AppStrings.onBoardingSubTitle3,
        image: ImageAssets.onBoardingLogo3,
      ),
      SliderObject(
        title: AppStrings.onBoardingTitle4,
        subTitle: AppStrings.onBoardingSubTitle4,
        image: ImageAssets.onBoardingLogo4,
      ),
    ];
  }
}

// inputs mean that "Orders" that our view model will receive from view
abstract class OnBoardingViewModelInputs {
  int goNext(); // when user clicks on right arrow or swipe left
  int goPrevious(); // when user clicks on left arrow or swipe right
  void onPageChanged(int index);

  // Stream Controllers Inputs
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  // Stream Controllers Outputs
  Stream<SliderViewObject> get outputSliderViewObject;
}

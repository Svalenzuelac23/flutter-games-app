import 'package:flutter/widgets.dart';

class PageInAnimationController {
  final AnimationController pageController;
  final AnimationController controlController;
  final Animation<double> initialOpacityAnimation;
  final Animation<double> endOpacityAnimation;
  final Animation<double> halfOpacityAnimation;

  PageInAnimationController({
    required this.pageController,
    required this.controlController,
  })  : initialOpacityAnimation =
            Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: pageController,
          curve: const Interval(0.1, 0.33, curve: Curves.fastOutSlowIn),
        )),
        halfOpacityAnimation =
            Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: pageController,
          curve: const Interval(0.1, 0.66, curve: Curves.fastOutSlowIn),
        )),
        endOpacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: pageController,
            curve: const Interval(0.1, 1.0, curve: Curves.fastOutSlowIn),
          ),
        );

  void dispose() {
    pageController.dispose();
  }

  Animation<double> controlScaleAnimation({required double scale}) {
    return Tween<double>(begin: scale, end: 0).animate(
      CurvedAnimation(parent: controlController, curve: Curves.decelerate),
    );
  }
}

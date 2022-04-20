import 'package:flutter/widgets.dart';

class ScaleAnimation extends AnimatedWidget {
  final Animation<double> animation;
  final Widget child;

  const ScaleAnimation({
    required this.animation,
    required this.child,
    Key? key,
  }) : super(key: key, listenable: animation);

  Animation<double> get progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      child: child,
      scale: progress.value,
    );
  }
}

import 'package:flutter/cupertino.dart';

class OpacityAnimation extends AnimatedWidget {
  final Animation<double> animation;
  final Widget child;

  const OpacityAnimation({
    Key? key,
    required this.animation,
    required this.child,
  }) : super(key: key, listenable: animation);

  Animation<double> get progress => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: progress.value,
      child: child,
    );
  }
}

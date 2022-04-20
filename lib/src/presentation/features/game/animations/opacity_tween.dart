import 'package:flutter/material.dart';

class OpacityTween extends StatelessWidget {
  const OpacityTween(
      {Key? key,
      this.begin = 0.2,
      required this.child,
      this.duration = const Duration(milliseconds: 1500),
      this.curve = Curves.fastOutSlowIn})
      : super(key: key);

  final double begin;
  final Widget child;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: begin, end: 1.0),
      child: child,
      duration: duration,
      curve: curve,
      builder: (_, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
    );
  }
}

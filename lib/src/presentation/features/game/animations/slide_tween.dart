import 'package:flutter/material.dart';

class SlideTween extends StatelessWidget {
  const SlideTween(
      {Key? key,
      required this.child,
      required this.begin,
      this.duration = const Duration(milliseconds: 700),
      this.curve = Curves.easeInOut})
      : super(key: key);

  final Widget child;
  final Offset begin;
  final Duration duration;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      child: child,
      tween: Tween(begin: begin, end: const Offset(0, 0)),
      duration: duration,
      curve: curve,
      builder: (_, value, child) {
        return Transform.translate(
          offset: value,
          child: child,
        );
      },
    );
  }
}

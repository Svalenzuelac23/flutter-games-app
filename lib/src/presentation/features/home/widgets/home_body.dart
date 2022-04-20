import 'package:flutter/material.dart';
import 'package:flutter_game_app/src/core/data/drawer_control.dart';
import 'package:flutter_game_app/src/core/data/states_drawer._enum.dart';
import 'package:flutter_game_app/src/presentation/features/games/pages/games_page.dart';
import 'package:provider/provider.dart';

class PageBody extends StatelessWidget {
  const PageBody({
    Key? key,
    required this.controller,
    required this.animationScale,
    required this.animationBorder,
    required this.animationOffset,
  }) : super(key: key);

  final AnimationController controller;
  final Animation<double> animationScale;
  final Animation<double> animationBorder;
  final Animation<Offset> animationOffset;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Consumer<DrawerStateNotifier>(
          builder: (context, value, child) {
            final isOpenDrawer = value.isOpen;
            isOpenDrawer && value.drawerStatusApp == DrawerStatusApp.run
                ? controller.forward()
                : value.drawerStatusApp == DrawerStatusApp.run
                    ? controller.reverse()
                    : null;
            return Transform.scale(
              scale: animationScale.value,
              child: Transform.translate(
                offset: animationOffset.value,
                child: ClipRRect(
                  child: const GamesPage(),
                  borderRadius:
                      BorderRadius.circular(30 * animationBorder.value),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

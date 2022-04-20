import 'package:flutter/material.dart';
import 'package:flutter_game_app/src/domain/game.dart';
import 'package:flutter_game_app/src/presentation/features/game/animations/opacity_tween.dart';
import 'package:flutter_game_app/src/presentation/features/game/animations/slide_tween.dart';
import 'package:flutter_game_app/src/presentation/features/game/widgets/widgets.dart';
import 'package:flutter_game_app/src/presentation/features/games/widgets/widgets.dart';

class GameBody extends StatelessWidget {
  const GameBody({
    Key? key,
    required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final h = constraints.maxHeight;
        final w = constraints.maxWidth;
        return SizedBox(
          child: Stack(
            children: [
              Positioned(
                top: 15,
                left: 15,
                right: 15,
                height: h * 0.07,
                child: const SearchBarGames(showIconBack: true),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: h * 0.12,
                child: OpacityTween(
                  child: SlideTween(
                    duration: const Duration(milliseconds: 1200),
                    curve: Curves.decelerate,
                    begin: Offset(w * -1, 0),
                    child: Container(
                      clipBehavior: Clip.none,
                      height: h * 0.40,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/' + game.backgroundImage),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                height: h * 0.65,
                bottom: 0,
                right: 0,
                left: 0,
                child: SlideTween(
                  curve: Curves.decelerate,
                  duration: const Duration(milliseconds: 1200),
                  begin: Offset(0, h * 0.8),
                  child: GameDetailsCard(game: game),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

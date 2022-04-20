import 'package:flutter/material.dart';
import 'package:flutter_game_app/src/domain/game.dart';
import 'package:flutter_game_app/src/presentation/features/game/widgets/widgets.dart';

class GameDetailsCard extends StatelessWidget {
  const GameDetailsCard({
    Key? key,
    required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    const radiusCircular = Radius.circular(25);

    return LayoutBuilder(
      builder: (context, constraints) {
        final h = constraints.maxHeight;
        //final w = constraints.maxWidth;

        return ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: radiusCircular,
            topRight: radiusCircular,
          ),
          child: Container(
            padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
            color: Colors.white,
            child: Column(
              children: [
                TitleAndAction(game: game),
                const SizedBox(height: 8),
                Expanded(
                  child: ImageAndInfomationGame(game: game),
                ),
                const SizedBox(height: 15),
                ClasificationGameLabel(height: h * 0.25)
              ],
            ),
          ),
        );
      },
    );
  }
}

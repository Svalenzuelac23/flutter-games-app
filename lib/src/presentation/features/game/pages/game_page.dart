import 'package:flutter/material.dart';
import 'package:flutter_game_app/src/core/constants/app_colors.dart';
import 'package:flutter_game_app/src/domain/game.dart';
import 'package:flutter_game_app/src/presentation/features/game/widgets/game_body.dart';
import 'package:flutter_game_app/src/presentation/features/games/widgets/widgets.dart';

class GamePage extends StatelessWidget {
  const GamePage({
    Key? key,
    required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: AppColors.segundaryColor,
        child: Scaffold(
          backgroundColor: AppColors.segundaryColor,
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight + 15),
            child: Padding(
              padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
              child: GamesAppBar(),
            ),
          ),
          body: GameBody(
            game: game,
          ),
          bottomNavigationBar: SizedBox(
            height: size.height * 0.08,
            child: const Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: ButtomNavBar(),
            ),
          ),
        ),
      ),
    );
  }
}

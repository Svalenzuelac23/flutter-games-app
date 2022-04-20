import 'package:flutter/material.dart';
import 'package:flutter_game_app/src/domain/game.dart';

class NextRealeseCard extends StatelessWidget {
  const NextRealeseCard({
    Key? key,
    required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        //final h = constraints.maxHeight;
        final w = constraints.maxWidth;
        return ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  color: Colors.black,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                top: 0,
                width: w * 0.70,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/' + game.backgroundImage),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                width: w * 0.35,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.8),
                          spreadRadius: 25,
                          blurRadius: 40)
                    ],
                  ),
                ),
              ),
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                    width: w * 0.48,
                    child: Text(
                      game.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const Positioned(
                bottom: 5,
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Image(
                    width: 100,
                    image: AssetImage('assets/PS5_logo.png'),
                  ),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_game_app/src/core/constants/app_colors.dart';
import 'package:flutter_game_app/src/domain/game.dart';
import 'package:flutter_game_app/src/presentation/features/game/widgets/widgets.dart';

class ImageAndInfomationGame extends StatelessWidget {
  const ImageAndInfomationGame({
    Key? key,
    required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        color: AppColors.textColorDetail, fontWeight: FontWeight.w500);

    return LayoutBuilder(
      builder: ((context, constraints) {
        final h = constraints.maxHeight;
        final w = constraints.maxWidth;
        final boderRadius = BorderRadius.circular(20);

        return Row(
          children: [
            ImageWithButtomShadow(
              elevatedShadow: 25,
              width: w * 0.5,
              boderRadius: boderRadius,
              game: game,
            ),
            Container(
              width: w * 0.5,
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Activision',
                    style: TextStyle(
                      color: AppColors.textColorDetail,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    game.price,
                    style: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.language, color: AppColors.textColorDetail),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: w * 0.35,
                        child: Text(game.type, style: textStyle),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.people, color: AppColors.textColorDetail),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: w * 0.35,
                        child: Text(
                          game.players,
                          style: textStyle,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: h * 0.23,
                    decoration: BoxDecoration(
                      color: AppColors.buttomColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text(
                        'Comprar',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      }),
    );
  }
}

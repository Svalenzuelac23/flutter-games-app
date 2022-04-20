import 'package:flutter/material.dart';
import 'package:flutter_game_app/src/domain/game.dart';

class ImageWithButtomShadow extends StatelessWidget {
  const ImageWithButtomShadow(
      {Key? key,
      required this.boderRadius,
      required this.width,
      required this.game,
      this.elevatedShadow = 50})
      : super(key: key);

  final BorderRadius boderRadius;
  final double width;
  final Game game;
  final double elevatedShadow;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: boderRadius,
      child: Container(
        width: width,
        //height: h,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/' + game.image), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: elevatedShadow,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      spreadRadius: 15,
                      blurRadius: 40,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

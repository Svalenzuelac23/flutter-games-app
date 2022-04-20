import 'package:flutter/material.dart';
import 'package:flutter_game_app/src/domain/game.dart';
import 'package:flutter_game_app/src/presentation/features/game/pages/game_page.dart';

class BestGamesView extends StatefulWidget {
  const BestGamesView({
    Key? key,
    required this.games,
    this.showTitle = true,
    this.showFavoriteIcon = true,
    this.showShadow = true,
    required this.widthCard,
    this.separetdWidth = 20,
  }) : super(key: key);

  final List<Game> games;
  final bool showTitle;
  final bool showFavoriteIcon;
  final double widthCard;
  final double separetdWidth;
  final bool showShadow;

  @override
  State<BestGamesView> createState() => _BestGamesViewState();
}

class _BestGamesViewState extends State<BestGamesView> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final h = constraints.maxHeight;
        //final w = constraints.maxWidth;
        final boderRadius = BorderRadius.circular(20);
        const titlePadding = 12.0;

        return ListView.separated(
          clipBehavior: Clip.none,
          separatorBuilder: (_, __) => SizedBox(width: widget.separetdWidth),
          scrollDirection: Axis.horizontal,
          itemCount: widget.games.length,
          itemBuilder: (context, index) {
            final game = widget.games[index];
            return InkWell(
              onTap: () {
                const transitionDuration = Duration(milliseconds: 400);
                Navigator.of(context).push(
                  PageRouteBuilder(
                    transitionDuration: transitionDuration,
                    reverseTransitionDuration: transitionDuration,
                    pageBuilder: (_, animation, __) {
                      return FadeTransition(
                        opacity: animation,
                        child: GamePage(game: game),
                      );
                    },
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: boderRadius,
                child: Container(
                  width: widget.widthCard,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/' + game.image),
                        fit: BoxFit.cover),
                  ),
                  child: Stack(
                    children: [
                      widget.showFavoriteIcon
                          ? Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 35,
                                ),
                              ),
                            )
                          : const SizedBox(),
                      widget.showShadow
                          ? Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: h * 0.25,
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
                          : const SizedBox(),
                      widget.showTitle
                          ? Positioned(
                              bottom: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(titlePadding),
                                child: SizedBox(
                                  width: widget.widthCard - (titlePadding * 2),
                                  child: Text(
                                    game.name,
                                    maxLines: 2,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox()
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

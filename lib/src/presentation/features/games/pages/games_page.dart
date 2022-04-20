import 'package:flutter/material.dart';
import 'package:flutter_game_app/src/core/constants/app_colors.dart';
import 'package:flutter_game_app/src/core/data/data.dart';
import 'package:flutter_game_app/src/presentation/features/games/animations/opacity_animation.dart';
import 'package:flutter_game_app/src/presentation/features/games/animations/page_animation.dart';
import 'package:flutter_game_app/src/presentation/features/games/widgets/widgets.dart';

class GamesPage extends StatefulWidget {
  const GamesPage({Key? key}) : super(key: key);

  @override
  State<GamesPage> createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> with TickerProviderStateMixin {
  late PageInAnimationController controller;

  @override
  void initState() {
    controller = PageInAnimationController(
      pageController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1500),
      ),
      controlController: AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 1000),
      ),
    );
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      controller.controlController.forward();
      await Future.delayed(const Duration(milliseconds: 400));
      controller.pageController.forward();
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      color: AppColors.segundaryColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15, top: 15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            _scaffold(size),
            Positioned(
              child: _ScaleControl(controller: controller),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold _scaffold(Size size) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: OpacityAnimation(
          animation: controller.endOpacityAnimation,
          child: const GamesAppBar(),
        ),
      ),
      body: GamesBody(
        size: size,
        controller: controller,
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.08,
        child: OpacityAnimation(
          animation: controller.initialOpacityAnimation,
          child: const ButtomNavBar(),
        ),
      ),
    );
  }
}

class _ScaleControl extends StatelessWidget {
  const _ScaleControl({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final PageInAnimationController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.controlController,
      builder: (_, __) {
        final scale = controller.controlScaleAnimation(scale: 90.0).value;

        return Transform.scale(
          scale: scale,
          child: const Image(
            height: 40,
            color: AppColors.primaryColor,
            image: AssetImage('assets/controlps.png'),
          ),
        );
      },
    );
  }
}

class GamesBody extends StatelessWidget {
  const GamesBody({
    Key? key,
    required this.size,
    required this.controller,
  }) : super(key: key);

  final Size size;
  final PageInAnimationController controller;

  @override
  Widget build(BuildContext context) {
    const double separatedWidth = 13;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: separatedWidth),
        SizedBox(
          height: size.height * 0.055,
          child: OpacityAnimation(
            animation: controller.endOpacityAnimation,
            child: const SearchBarGames(),
          ),
        ),
        const SizedBox(height: separatedWidth),
        SizedBox(
          height: size.height * 0.36,
          child: OpacityAnimation(
            animation: controller.endOpacityAnimation,
            child: BestGamesView(
              games: games,
              widthCard: size.width * 0.75,
            ),
          ),
        ),
        const SizedBox(height: separatedWidth),
        SizedBox(
          height: size.height * 0.14,
          child: OpacityAnimation(
            animation: controller.halfOpacityAnimation,
            child: NextRealeseCard(game: nextReleases.first),
          ),
        ),
        const SizedBox(height: separatedWidth),
        OpacityAnimation(
          animation: controller.halfOpacityAnimation,
          child: const Text(
            'Más Juegos',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: separatedWidth),
        SizedBox(
          height: size.width * 0.25,
          child: OpacityAnimation(
            animation: controller.initialOpacityAnimation,
            child: BestGamesView(
              showShadow: false,
              separetdWidth: 15,
              showTitle: false,
              showFavoriteIcon: false,
              widthCard: size.width * 0.25,
              games: games.reversed.toList(),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_game_app/src/core/constants/app_colors.dart';
import 'package:flutter_game_app/src/core/data/drawer_control.dart';
import 'package:flutter_game_app/src/presentation/features/home/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animationScale;
  late Animation<Offset> animationOffset;
  late Animation<double> animationBorder;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animationScale = Tween<double>(begin: 1, end: 0.85).animate(
      CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
    );
    animationBorder = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0, 1, curve: Curves.fastOutSlowIn),
      ),
    );
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
    animationOffset = Tween<Offset>(
      begin: const Offset(0, 0),
      end: Offset(size.width * 0.55, 0),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Stack(
          children: [
            SizedBox(
              width: size.width * 0.55,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: size.height * 0.075,
                    horizontal: size.width * 0.10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('assets/perfilFoto.jpg'),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Hola, Stanley',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    const LateralMenuItem(
                        icon: Icons.home_outlined, text: 'PRINCIPAL'),
                    const SizedBox(height: 25),
                    const LateralMenuItem(
                        icon: Icons.explore_outlined, text: 'EXPLORAR'),
                    const SizedBox(height: 25),
                    InkWell(
                      onTap: () {},
                      child: const SizedBox(
                        height: 32,
                        child: Image(
                          color: Colors.white,
                          image: AssetImage('assets/controlps.png'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const LateralMenuItem(
                        icon: Icons.shop_2_outlined, text: 'JUEGOS'),
                    const SizedBox(height: 25),
                    const LateralMenuItem(
                        icon: Icons.view_agenda_outlined, text: 'BIBLIOTECA'),
                    const Spacer(),
                    const Image(
                      color: Colors.white,
                      width: 65,
                      height: 65,
                      image: AssetImage('assets/logo_play.png'),
                    ),
                  ],
                ),
              ),
            ),
            PageBody(
              controller: controller,
              animationScale: animationScale,
              animationBorder: animationBorder,
              animationOffset: animationOffset,
            )
          ],
        ),
      ),
    );
  }
}

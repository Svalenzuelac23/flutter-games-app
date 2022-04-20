import 'package:flutter/material.dart';
import 'package:flutter_game_app/src/core/constants/app_colors.dart';
import 'package:flutter_game_app/src/core/data/drawer_control.dart';
import 'package:flutter_game_app/src/core/data/states_drawer._enum.dart';
import 'package:provider/provider.dart';

class GamesAppBar extends StatelessWidget {
  const GamesAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Consumer<DrawerStateNotifier>(
          builder: (context, value, child) {
            final isOpen = value.isOpen;
            return IconButton(
              icon: Icon(isOpen ? Icons.close : Icons.menu),
              onPressed: () => value.changeStatus(
                  isOpen ? DrawerStates.close : DrawerStates.open),
              iconSize: 40,
              color: Colors.grey,
            );
          },
        ),
        const Image(
          color: AppColors.primaryColor,
          width: 65,
          height: 65,
          image: AssetImage('assets/logo_play.png'),
        ),
        const CircleAvatar(
          radius: 25.0,
          backgroundImage: AssetImage('assets/perfilFoto.jpg'),
        )
      ],
    );
  }
}

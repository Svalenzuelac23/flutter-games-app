import 'package:flutter/material.dart';
import 'package:flutter_game_app/src/core/constants/app_colors.dart';

class ButtomNavBar extends StatelessWidget {
  const ButtomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double iconSize = 37;
    const Color iconColorSelected = AppColors.primaryColor;
    const Color iconColorUnselected = Colors.grey;
    const TextStyle textStyleLabel =
        TextStyle(color: Colors.grey, fontSize: 7.5);

    return BottomNavigationBar(
      selectedLabelStyle: textStyleLabel,
      unselectedLabelStyle: textStyleLabel,
      currentIndex: 2,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: iconColorUnselected,
      selectedItemColor: iconColorSelected,
      elevation: 0,
      backgroundColor: Colors.transparent,
      items: const [
        BottomNavigationBarItem(
          label: 'PRINCIPAL',
          icon: Icon(
            Icons.home_outlined,
            size: iconSize,
          ),
        ),
        BottomNavigationBarItem(
          label: 'EXPLORAR',
          icon: Icon(
            Icons.explore_outlined,
            size: iconSize,
          ),
        ),
        BottomNavigationBarItem(
          label: '',
          icon: Padding(
            padding: EdgeInsets.only(top: 7),
            child: SizedBox(
              height: iconSize * 1.1,
              child: Image(
                color: AppColors.primaryColor,
                image: AssetImage('assets/controlps.png'),
              ),
            ),
          ),
        ),
        BottomNavigationBarItem(
          label: 'JUEGOS',
          icon: Icon(
            Icons.shop_2_outlined,
            size: iconSize,
          ),
        ),
        BottomNavigationBarItem(
          label: 'BIBLIOTECA',
          icon: Icon(
            Icons.view_agenda_outlined,
            size: iconSize,
          ),
        )
      ],
    );
  }
}

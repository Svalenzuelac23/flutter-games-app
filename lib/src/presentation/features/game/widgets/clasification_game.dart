import 'package:flutter/material.dart';
import 'package:flutter_game_app/src/core/constants/app_colors.dart';

class ClasificationGameLabel extends StatelessWidget {
  const ClasificationGameLabel({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: AppColors.primaryColor,
      ),
      padding: const EdgeInsets.all(20),
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: 60,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/PsMore10.png'),
              ),
            ),
          ),
          const SizedBox(width: 25),
          const Expanded(
            child: Text(
              'Lenguaje, Referencia al alcohol, Travesuras cómicas, Violencia de dibujos animados.',
              maxLines: 3,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w300),
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_game_app/src/core/constants/app_colors.dart';

class SearchBarGames extends StatelessWidget {
  const SearchBarGames({
    Key? key,
    this.showIconBack = false,
  }) : super(key: key);

  final bool showIconBack;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrainsts) {
        final h = constrainsts.maxHeight;
        final w = constrainsts.maxWidth;

        return Row(
          children: [
            showIconBack
                ? InkWell(
                    child: SizedBox(
                      width: w * 0.14,
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 32,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  )
                : const SizedBox(),
            Expanded(
              child: Container(
                height: h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey.withOpacity(0.60),
                      size: 30,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Buscar juego',
                      style: TextStyle(
                          color: Colors.grey.withOpacity(0.60),
                          fontSize: 19,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.16),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

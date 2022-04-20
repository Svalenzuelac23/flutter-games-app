import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_game_app/src/core/data/drawer_control.dart';
import 'package:flutter_game_app/src/presentation/features/home/pages/home.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return ChangeNotifierProvider(
      create: (context) => DrawerStateNotifier(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Game App',
        home: HomePage(),
      ),
    );
  }
}

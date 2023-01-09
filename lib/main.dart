import 'package:flutter/material.dart';
import 'package:poly_dice_golf/game/game_session.dart';
import 'package:poly_dice_golf/screens/game_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final session = GameSession();
  await session.start('balanced');
  runApp(MyApp(session: session));
}

class MyApp extends StatelessWidget {
  final GameSession session;

  const MyApp({super.key, required this.session});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Poly Dice Golf',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameScreen(
        session: session,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:poly_dice_golf/game/die.dart';
import 'package:poly_dice_golf/game/game_session.dart';
import 'package:poly_dice_golf/widgets/die_adder_button.dart';
import 'package:poly_dice_golf/widgets/golf_display.dart';
import 'package:poly_dice_golf/widgets/throw_button.dart';

class GameScreen extends StatefulWidget {
  final GameSession session;

  const GameScreen({super.key, required this.session});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<Die> _dice = [];

  Widget _createDisplay() {
    return AspectRatio(
        aspectRatio: 1.0,
        child: DecoratedBox(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.purple[100]!, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: GolfDisplay(session: widget.session),
        ));
  }

  Widget _createAdderButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: DieType.values
          .map((type) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: DieAdderButton(
                  type: type, onPressed: (die) => _dice.add(die))))
          .toList(),
    );
  }

  Widget _createThrowButton() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ThrowButton(onPressed: () {
        widget.session.strokeBall(_dice, StrokeDirection.right);
        setState(() {
          _dice.clear();
        });
      })
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      _createDisplay(),
      _createAdderButtons(),
      _createThrowButton()
    ]));
  }
}

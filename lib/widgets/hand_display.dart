import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:poly_dice_golf/game/die.dart';

class HandDisplay extends StatelessWidget {
  final List<Die> dice;
  final int slots;
  final void Function(Die) onDieRemoved;

  const HandDisplay(
      {super.key,
      required this.dice,
      required this.onDieRemoved,
      required this.slots});

  Widget _slot(BuildContext context, Die? die) {
    final colour = die == null
        ? Colors.black.withOpacity(0.6)
        : Theme.of(context).primaryColor;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Container(
          width: 50.0,
          height: 50.0,
          decoration: BoxDecoration(
              color: colour, borderRadius: BorderRadius.circular(8.0)),
          child: die == null
              ? null
              : Center(
                  child: Text(
                  die.type.name,
                  style: const TextStyle(color: Colors.white),
                )),
        ));
  }

  List<Widget> _createFilledSlots(BuildContext context) {
    return dice
        .map<Widget>((die) => GestureDetector(
            onTap: () => onDieRemoved(die), child: _slot(context, die)))
        .toList();
  }

  List<Widget> _createEmptySlots(BuildContext context) {
    return List.filled(slots - dice.length, _slot(context, null));
  }

  @override
  Widget build(BuildContext context) {
    final filled = _createFilledSlots(context);
    final empty = _createEmptySlots(context);
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: filled..addAll(empty));
  }
}

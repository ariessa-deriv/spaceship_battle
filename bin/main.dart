import 'package:spaceship_battle/spaceship_battle.dart';
import 'dart:math';

void main() {
  final randomSp1Type = Random().nextBool();
  final randomSp2Type = Random().nextBool();
  Spaceship sp1;
  Spaceship sp2;

  if (randomSp1Type) {
    sp1 = ArmoredSpaceShip(1000, 0, 0.4);
    print('Spaceship 1 is an ArmoredSpaceShip');
  } else {
    sp1 = HighSpeedSpaceShip(1000, 0, true);
    print('Spaceship 1 is a HighSpeedSpaceShip');
  }

  if (randomSp2Type) {
    sp2 = ArmoredSpaceShip(1000, 0, 0.4);
    print('Spaceship 2 is an ArmoredSpaceShip');
  } else {
    sp2 = HighSpeedSpaceShip(1000, 0, true);
    print('Spaceship 2 is a HighSpeedSpaceShip');
  }

  Battlefield().startBattle(sp1, sp2);
}

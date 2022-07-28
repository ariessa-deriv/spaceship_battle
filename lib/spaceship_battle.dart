import 'dart:io';
import 'dart:math';

abstract class Spaceship {
  int health;
  int firePower;

  void hit(int firePower);
  bool isDestroyed() {
    if (health >= 1) {
      return false;
    }

    // SpaceShip is destroyed
    return true;  
  }

  Spaceship(this.health, this.firePower);
}

class ArmoredSpaceShip extends Spaceship {
  // Randomly absorbs hit
  double maxArmorPower; // 0.4

  @override
  void hit(int firePower) {
    double currentArmorPower = Random().nextDouble() * maxArmorPower;
    double remainingHit = 1 - currentArmorPower;
    int totalFirePower = (remainingHit * firePower).toInt();

    if (totalFirePower < 1) {
      health -= 1;
    } else {
      health -= (remainingHit * firePower).toInt();
    }
    stdout.write('absorbed $currentArmorPower of the hit.\nIt got hit by $firePower firePower');
  }

  ArmoredSpaceShip(health, firePower, this.maxArmorPower) : super(health, firePower);
}

class HighSpeedSpaceShip extends Spaceship {
  // Whether dodges hit or not
  bool dodging;

  @override 
  void hit(int firePower) {
    dodging = Random().nextBool();
    
    if (dodging) {
      health -= firePower;
      stdout.write('got hit by $firePower firePower');
    } else {
      stdout.write('dodged the hit');
    }
  }

  HighSpeedSpaceShip(health, firePower, this.dodging) : super(health, firePower);
}

class Battlefield {
  void startBattle(Spaceship sp1, Spaceship sp2) {

    print('\nInitial Spaceship 1\'s health: ${sp1.health}');
    print('Initial Spaceship 2\'s health: ${sp2.health}');

    do {
      // Randomly a space ship is selected to hit first
      final selectedSpaceShip = Random().nextBool();

      // SpaceShips to hit each other
      if (selectedSpaceShip) {
        sp1.firePower = 1 + Random().nextInt(sp2.health);
        stdout.write('\nSpaceship 2 ');
        sp2.hit(sp1.firePower);
      } else {
        sp2.firePower = 1 + Random().nextInt(sp1.health);
        stdout.write('\nSpaceship 1 ');
        sp1.hit(sp2.firePower);
      }

      print('\n\nCurrent Spaceship 1\'s health: ${sp1.health}');
      print('Current Spaceship 2\'s health: ${sp2.health}');

      if (sp1.isDestroyed() == true) {
        stdout.write('\nSpaceship 1 ');
      }

      if (sp2.isDestroyed() == true) {
        stdout.write('\nSpaceship 2 ');
      }

    // Until one of them is destroyed
    } while ((sp1.isDestroyed() == false) && (sp2.isDestroyed() == false));

    stdout.write('is destroyed.');
    stdout.write('\nGame Over!\n');
  }
}

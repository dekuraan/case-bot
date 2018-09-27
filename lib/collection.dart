import 'package:dart_case_bot/csgo/rarity.dart';
import 'package:dart_case_bot/skin.dart';
import 'dart:math' as Math;

abstract class Collection {
  List<dynamic> items;

  Collection(List<dynamic> this.items) {}

  dynamic getRandomItem() {
    double temppercentage = 0.0;
    double random = Math.Random().nextDouble();

    for (var item in items) {
      temppercentage += item.percentage;
      if (temppercentage >= random) {
        return item;
      }
    }

    return items.last;
  }
}

class RarityCollection extends Collection {
  Rarity rarity;
  double percentage;
  RarityCollection(
      {Rarity this.rarity, double this.percentage, List<Skin> skins})
      : super(skins);
  List<Skin> get skins {
    return this.items;
  }

  Skin getRandomSkin() {
    return this.getRandomItem();
  }
}

class CaseCollection extends Collection {
  CaseCollection(List<RarityCollection> rarityCollections)
      : super(rarityCollections);
  RarityCollection getRandomRarityCollection() {
    return this.getRandomItem();
  }

  Skin getRandomSkin() {
    return getRandomRarityCollection().getRandomSkin();
  }
}

class GenericCaseCollection extends CaseCollection {
  RarityCollection mil_spec;
  RarityCollection restricted;
  RarityCollection classified;
  RarityCollection covert;
  RarityCollection knife;

  GenericCaseCollection(
      {this.mil_spec,
      this.restricted,
      this.classified,
      this.covert,
      this.knife})
      : super([]) {
    this.items = [
      this.mil_spec,
      this.restricted,
      this.classified,
      this.covert,
      this.knife
    ];
  }
}

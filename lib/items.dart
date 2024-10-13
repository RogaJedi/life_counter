import 'player_counters_components/c_items.dart';

class Item {
  String colorHex;
  int counter;
  List <C_Item> player_counters;
  int id;

  Item({
    required this.colorHex,
    required this.counter,
    required this.player_counters,
    required this.id,
  });
}
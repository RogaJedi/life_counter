import 'player_components/counters/c_items.dart';

class Item {
  String colorHex;
  int counter;
  List <C_Item> playerCounters;
  Map<String, bool> counterButtonStates = {};
  int id;

  Item({
    required this.colorHex,
    required this.counter,
    required this.playerCounters,
    required this.counterButtonStates,
    required this.id,
  });
}
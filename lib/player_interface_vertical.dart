import 'package:flutter/material.dart';
import 'player_card_components_vertical/interactive_player_card_vertical.dart';
import 'player_components/counters_and_settings_card.dart';
import 'items.dart';

class PlayerInterfaceVertical extends StatefulWidget {
  final Item player;
  final List<Item> playersList;
  final VoidCallback onCountersTap;
  final Function(Item, List<Item>) onColorSelected;

  const PlayerInterfaceVertical({
    Key? key,
    required this.player,
    required this.playersList,
    required this.onCountersTap,
    required this.onColorSelected,
  }) : super(key: key);

  @override
  _PlayerInterfaceVerticalState createState() => _PlayerInterfaceVerticalState();
}

class _PlayerInterfaceVerticalState extends State<PlayerInterfaceVertical> {
  static const int _initialPage = 1;
  late final PageController _pageController;
  int _currentPage = _initialPage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() => _currentPage = page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        onPageChanged: _onPageChanged,
        children: [
          CountersAndSettingsCard(
            player: widget.player,
            playersList: widget.playersList,
            onCountersTap: widget.onCountersTap,
            onColorSelected: widget.onColorSelected,
            turn: 90,
          ),
          InteractivePlayerCardVertical(player: widget.player),
        ],
      ),
    );
  }
}

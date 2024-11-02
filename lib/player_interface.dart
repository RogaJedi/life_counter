import 'package:flutter/material.dart';
import 'player_card_components/interactive_player_card.dart';
import 'player_components/counters_and_settings_card.dart';
import 'items.dart';

class PlayerInterface extends StatefulWidget {
  final Item player;
  final List<Item> playersList;
  final double aspectRatio;
  final VoidCallback onCountersTap;
  final Function(Item, List<Item>) onColorSelected;

  const PlayerInterface({super.key,
    required this.player,
    required this.playersList,
    required this.aspectRatio,
    required this.onCountersTap,
    required this.onColorSelected,
  });


  @override
  _PlayerInterfaceState createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  late PageController _pageController;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          CountersAndSettingsCard(
            player: widget.player,
            playersList: widget.playersList,
            aspectRatio: widget.aspectRatio,
            onCountersTap: widget.onCountersTap,
            onColorSelected: widget.onColorSelected,
          ),
          InteractivePlayerCard(
            player: widget.player,
            aspectRatio: widget.aspectRatio,
          ),
        ],
      ),
    );
  }
}

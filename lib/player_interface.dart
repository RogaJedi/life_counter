import 'package:flutter/material.dart';
import 'player_card_components/interactive_player_card.dart';
import 'player_components/counters_and_settings_card.dart';
import 'player_components/pick_color_card.dart';
import 'items.dart';

class PlayerInterface extends StatefulWidget {
  final Item player;
  final List<Item> playersList;
  final VoidCallback onCountersTap;
  final Function(Item, List<Item>) onColorSelected;

  const PlayerInterface({
    Key? key,
    required this.player,
    required this.playersList,
    required this.onCountersTap,
    required this.onColorSelected,
  }) : super(key: key);

  @override
  _PlayerInterfaceState createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  late PageController _pageController;
  int _currentPage = 1;
  bool _showPickColorCard = false;

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

  void _togglePickColorCard() {
    setState(() {
      _showPickColorCard = !_showPickColorCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: [
              CountersAndSettingsCard(
                player: widget.player,
                playersList: widget.playersList,
                onCountersTap: widget.onCountersTap,
                onColorSelected: widget.onColorSelected,
                turn: 0,
                onPickColorTap: _togglePickColorCard,
              ),
              InteractivePlayerCard(
                player: widget.player,
              ),
            ],
          ),
          if (_showPickColorCard)
            PickColorCard(
              player: widget.player,
              playersList: widget.playersList,
              onCountersTap: widget.onCountersTap,
              onColorSelected: widget.onColorSelected,
              turn: 0,
              onClose: _togglePickColorCard,
            ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'player_options_components/player_settings_card.dart';
import 'player_card_components/interactive_player_card.dart';
import 'player_counters_components/counters_display_card.dart';
import 'items.dart';

class PlayerInterface extends StatefulWidget {
  final Item player;
  final double aspectRatio;
  final VoidCallback onSettingsTap;
  final VoidCallback onCountersTap;

  const PlayerInterface({super.key,
    required this.player,
    required this.aspectRatio,
    required this.onSettingsTap,
    required this.onCountersTap,
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
          CountersDisplayCard(player: widget.player),
          InteractivePlayerCard(
            player: widget.player,
            aspectRatio: widget.aspectRatio,
          ),
          PlayerSettingsCard(
            aspectRatio: widget.aspectRatio,
            onSettingsTap: widget.onSettingsTap,
            onCountersTap: widget.onCountersTap,
          ),
        ],
      ),
    );
  }
}

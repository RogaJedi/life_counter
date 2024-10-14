import 'package:flutter/material.dart';
import 'player_options_components/player_settings_card.dart';
import 'player_card_components/interactive_player_card.dart';
import 'player_counters_components/counters_display_card.dart';
import 'items.dart';

// TODO: fix interface.

class PlayerInterface extends StatefulWidget {
  final Item player;
  final double aspectRatio;
  final VoidCallback onSettingsTap;
  final VoidCallback onCountersTap;
  final String layoutMode;

  const PlayerInterface({super.key,
    required this.player,
    required this.aspectRatio,
    required this.onSettingsTap,
    required this.onCountersTap,
    required this.layoutMode,
  });


  @override
  _PlayerInterfaceState createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  bool _isTopCardVisible = true;
  double _topCardPosition = 0;
  double _bottomCardPosition = 0;
  double _rightCardPosition = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Settings card
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: -_bottomCardPosition,
            right: _bottomCardPosition,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (!_isTopCardVisible) {
                  setState(() {
                    _bottomCardPosition -= details.delta.dx;
                    _bottomCardPosition = _bottomCardPosition.clamp(-100, 0);
                  });
                }
              },
              onHorizontalDragEnd: (details) {
                if (!_isTopCardVisible && _bottomCardPosition < -50) {
                  _showTopCard();
                } else {
                  _resetBottomCard();
                }
              },
              child: PlayerSettingsCard(
                aspectRatio: widget.aspectRatio,
                onSettingsTap: widget.onSettingsTap,
                onCountersTap: widget.onCountersTap,
              ),
            ),
          ),
          //Counters card
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: -_rightCardPosition,
            right: _rightCardPosition,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (_isTopCardVisible) {
                  setState(() {
                    _rightCardPosition += details.delta.dx;
                    _rightCardPosition = _rightCardPosition.clamp(0, 100);
                  });
                }
              },
              onHorizontalDragEnd: (details) {
                if (!_isTopCardVisible && _rightCardPosition < 50) {
                  _showTopCard();
                } else {
                  _resetRightCard();
                }
              },
              child: CountersDisplayCard(player: widget.player), // Replace with your actual right card widget
            ),
          ),
          // Top card
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: -_topCardPosition,
            right: _topCardPosition,
            top: 0,
            bottom: 0,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                if (_isTopCardVisible) {
                  setState(() {
                    if (details.delta.dx < 0) {
                      // Swiping left
                      _topCardPosition -= details.delta.dx;
                      _topCardPosition = _topCardPosition.clamp(0, 100);
                    } else {
                      // Swiping right
                      _rightCardPosition += details.delta.dx;
                      _rightCardPosition = _rightCardPosition.clamp(0, -100);
                    }
                  });
                }
              },
              onHorizontalDragEnd: (details) {
                if (_isTopCardVisible) {
                  if (_topCardPosition > 50) {
                    _hideTopCard(1);
                  } else if (_topCardPosition < 50) {
                    _hideTopCard(2);
                    _showRightCard();
                  } else {
                    _resetTopCard();
                    _resetRightCard();
                  }
                }
              },
              //the top card
              child: InteractivePlayerCard(
                player: widget.player,
                aspectRatio: widget.aspectRatio,
                layoutMode: widget.layoutMode,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showRightCard() {
    setState(() {
      _rightCardPosition = 0;
      _isTopCardVisible = false;
    });
  }


  void _showTopCard() {
    setState(() {
      _topCardPosition = 0;
      _bottomCardPosition = 0;
      _rightCardPosition = 200;
      _isTopCardVisible = true;
    });
  }

  void _hideTopCard(int direction) {
    if (direction == 1){
      setState(() {
        _topCardPosition = 200;
        _isTopCardVisible = false;
      });
    } else {
      setState(() {
        _topCardPosition = -200;
        _bottomCardPosition = -200;
        _isTopCardVisible = false;
      });
    }
  }

  void _resetTopCard() {
    setState(() {
      _topCardPosition = 0;
      _rightCardPosition = 200;
    });
  }

  void _resetRightCard() {
    setState(() {
      _rightCardPosition = 200;
    });
  }

  void _resetBottomCard() {
    setState(() {
      _bottomCardPosition = 0;
    });
  }
}

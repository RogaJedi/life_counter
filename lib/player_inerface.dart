import 'package:flutter/material.dart';
import 'player_card_components/player_card.dart';
import 'player_options_components/player_settings_card.dart';
import 'player_counters_components/player_counters_card.dart';

class PlayerInerface extends StatefulWidget {
  final List<IconData> counters;
  final int playerId;
  final String colorHex;
  final int counter;
  final double aspectRatio;
  final VoidCallback topOnTap;
  final VoidCallback topOnLongTap;
  final VoidCallback bottomOnTap;
  final VoidCallback bottomOnLongTap;
  final VoidCallback onSettingsTap;
  final VoidCallback onCountersTap;

  const PlayerInerface({super.key,
    required this.counters,
    required this.playerId,
    required this.colorHex,
    required this.counter,
    required this.aspectRatio,
    required this.topOnTap,
    required this.topOnLongTap,
    required this.bottomOnTap,
    required this.bottomOnLongTap,
    required this.onSettingsTap,
    required this.onCountersTap,
  });


  @override
  _PlayerInterfaceState createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInerface> {
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
            duration: Duration(milliseconds: 300),
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
                    _bottomCardPosition = _bottomCardPosition.clamp(-100.0, 0);
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
            duration: Duration(milliseconds: 300),
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
                    _rightCardPosition = _rightCardPosition.clamp(0, 100.0);
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
              child: PlayerCountersCard(counters: widget.counters,), // Replace with your actual right card widget
            ),
          ),
          // Top card
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
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
                      _topCardPosition = _topCardPosition.clamp(0, 100.0);
                    } else {
                      // Swiping right
                      _rightCardPosition += details.delta.dx;
                      _rightCardPosition = _rightCardPosition.clamp(0, -100.0);
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
              child: PlayerCard(
                playerId: widget.playerId,
                colorHex: widget.colorHex,
                counter: widget.counter,
                aspectRatio: widget.aspectRatio,
                topOnTap: widget.topOnTap,
                topOnLongTap: widget.topOnLongTap,
                bottomOnTap: widget.bottomOnTap,
                bottomOnLongTap: widget.bottomOnLongTap,
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

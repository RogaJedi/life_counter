import 'package:flutter/material.dart';
import 'player_card.dart';
import 'player_settings_card.dart';

class PlayerInerface extends StatefulWidget {
  final int playerId;
  final String colorHex;
  final int counter;
  final double aspectRatio;
  final VoidCallback topOnTap;
  final VoidCallback topOnLongTap;
  final VoidCallback bottomOnTap;
  final VoidCallback bottomOnLongTap;

  const PlayerInerface({
    required this.playerId,
    required this.colorHex,
    required this.counter,
    required this.aspectRatio,
    required this.topOnTap,
    required this.topOnLongTap,
    required this.bottomOnTap,
    required this.bottomOnLongTap,
  });


  @override
  _PlayerInterfaceState createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInerface> {
  bool _isTopCardVisible = true;
  double _topCardPosition = 0;
  double _bottomCardPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Bottom card
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            top: _bottomCardPosition,
            bottom: 0,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (!_isTopCardVisible) {
                  setState(() {
                    _bottomCardPosition += details.delta.dy;
                    _bottomCardPosition = _bottomCardPosition.clamp(-100.0, 0.0);
                  });
                }
              },
              onVerticalDragEnd: (details) {
                if (!_isTopCardVisible && _bottomCardPosition < -50) {
                  _showTopCard();
                } else {
                  _resetBottomCard();
                }
              }, //PlayerSettingsCard(playerId: widget.playerId),
              child: PlayerSettingsCard(
                playerId: widget.playerId,
                aspectRatio: widget.aspectRatio,
              ),
            ),
          ),
          // Top card
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            left: 0,
            right: 0,
            top: _topCardPosition,
            bottom: 0,
            child: GestureDetector(
              onVerticalDragUpdate: (details) {
                if (_isTopCardVisible) {
                  setState(() {
                    _topCardPosition += details.delta.dy;
                    _topCardPosition = _topCardPosition.clamp(0.0, 100.0);
                  });
                }
              },
              onVerticalDragEnd: (details) {
                if (_isTopCardVisible && _topCardPosition > 50) {
                  _hideTopCard();
                } else {
                  _resetTopCard();
                }
              },
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

  void _showTopCard() {
    setState(() {
      _isTopCardVisible = true;
      _topCardPosition = 0;
      _bottomCardPosition = 0;
    });
  }

  void _hideTopCard() {
    setState(() {
      _isTopCardVisible = false;
      _topCardPosition = MediaQuery.of(context).size.height;
      _bottomCardPosition = 0;
    });
  }

  void _resetTopCard() {
    setState(() {
      _topCardPosition = 0;
    });
  }

  void _resetBottomCard() {
    setState(() {
      _bottomCardPosition = 0;
    });
  }
}

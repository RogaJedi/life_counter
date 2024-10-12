import 'package:flutter/material.dart';

class PlayerCountersCard extends StatelessWidget {
  final List<IconData> counters;

  const PlayerCountersCard({
    Key? key,
    required this.counters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Card(
          color: Colors.white,
          child: SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: ListView.builder(
              itemCount: counters.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.rotate(
                          angle: 90 * 3.14159 / 180,
                          child: Icon(
                            counters[index],
                            size: constraints.maxWidth * 0.3,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

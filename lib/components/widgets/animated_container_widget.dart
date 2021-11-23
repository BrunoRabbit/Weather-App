import 'package:flutter/material.dart';
import 'package:weather_app/models/card_model.dart';
import 'package:weather_app/styles/colors.dart';

class AnimatedContainerWidget extends StatefulWidget {
  int index;
  CardModel card;

  AnimatedContainerWidget({
    Key? key,
    required this.index,
    required this.card,
  }) : super(key: key);

  @override
  _AnimatedContainerWidgetState createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  double width = 190;
  double height = 150;
  Color color = Styles.strongPurple;
  void updatedState() {
    setState(() {
      width = 300;
      height = 190;
      color = Styles.lightPurple;
    });
  }

  void posUpdatedState() {
    setState(() {
      width = 180;
      height = 150;
      color = Styles.strongPurple;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MouseRegion(
              onEnter: (event) => {
                updatedState(),
              },
              onExit: (event) => {
                posUpdatedState(),
              },
              child: AnimatedContainer(
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 400),
                width: width,
                height: height,
                color: color,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        top: 8,
                        left: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.card.weekday,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              '|',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Text(
                            widget.card.date,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Temperatura',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Max. ' + widget.card.max.toString() + '°C',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Min. ' + widget.card.min.toString() + '°C',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Icon(
                      widget.card.icon,
                      color: Colors.white70,
                      size: 20,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.card.description,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

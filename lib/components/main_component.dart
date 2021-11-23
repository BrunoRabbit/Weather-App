import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/bottom_labels.dart';
import 'package:weather_app/controllers/global_controller.dart';
import 'package:weather_app/styles/font_styles.dart';

class MainComponent extends StatelessWidget {
  const MainComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalController _controller = Provider.of<GlobalController>(context);

    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('../assets/images/paisage.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      height: 300,
      child: Padding(
        padding: const EdgeInsets.only(right: 15, top: 10, left: 10),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      _controller.search,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '|',
                        style: FontStyles.defaultStyleLight(
                          fontSize: 35,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        _controller.currentClima == null
                            ? ''
                            : _controller.currentClima!.temp.toString() + '°C',
                        style: FontStyles.defaultStyleLight(fontSize: 35),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '|',
                        style: FontStyles.defaultStyleLight(
                          fontSize: 35,
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5, right: 5),
                      child: Icon(
                        FontAwesomeIcons.tint,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      _controller.currentClima == null
                          ? ''
                          : 'Umidade: ' +
                              _controller.currentClima!.humidity.toString() +
                              '%',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const BottomLabels(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

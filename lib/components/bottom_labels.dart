import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controllers/global_controller.dart';
import 'package:weather_app/styles/font_styles.dart';

class BottomLabels extends StatelessWidget {
  const BottomLabels({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalController _controller = Provider.of<GlobalController>(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.calendar_today_outlined,
              color: Colors.white70,
            ),
          ),
          Text(
            'Hoje',
            style: FontStyles.defaultStyleLight(fontSize: 20),
          ),
          const SizedBox(width: 15),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              _controller.currentClima == null
                  ? FontAwesomeIcons.truckLoading
                  : _controller.iconMap[
                      _controller.currentClima!.temperatures[0].description],
              color: Colors.white70,
            ),
          ),
          Text(
            _controller.currentClima == null
                ? ''
                : _controller.currentClima!.temperatures[0].description,
            style: FontStyles.defaultStyleLight(fontSize: 20),
          ),
          const SizedBox(width: 15),
          const Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              FontAwesomeIcons.thermometerEmpty,
              color: Colors.white70,
            ),
          ),
          Text(
            _controller.currentClima == null
                ? ''
                : 'Temperatura Max. ' +
                    _controller.currentClima!.temperatures[0].max.toString() +
                    '°C',
            style: FontStyles.defaultStyleLight(fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              _controller.currentClima == null
                  ? ''
                  : 'Min. ' +
                      _controller.currentClima!.temperatures[0].min.toString() +
                      '°C',
              style: FontStyles.defaultStyleLight(fontSize: 20),
            ),
          ),
          const SizedBox(width: 15),
          const Icon(
            FontAwesomeIcons.clock,
            color: Colors.white70,
          ),
          const SizedBox(width: 15),
          Text(
            _controller.currentClima == null
                ? ''
                : 'Amanhecer: ' + _controller.currentClima!.sunrise,
            style: FontStyles.defaultStyleLight(fontSize: 20),
          ),
          const SizedBox(width: 15),
          Text(
            _controller.currentClima == null
                ? ''
                : 'Anoitecer: ' + _controller.currentClima!.sunset,
            style: FontStyles.defaultStyleLight(fontSize: 20),
          ),
          const SizedBox(width: 15),
          const Icon(
            FontAwesomeIcons.wind,
            color: Colors.white70,
          ),
          const SizedBox(width: 15),
          Text(
            _controller.currentClima == null
                ? ''
                : 'Vel. do vento: ' +
                    _controller.currentClima!.wingSpeed.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

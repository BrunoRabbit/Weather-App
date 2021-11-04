import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controllers/global_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    Provider.of<GlobalController>(context, listen: false).getValue('São Paulo');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalController _controller = Provider.of<GlobalController>(context);

    return Scaffold(
      body: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15, top: 10),
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(35),
                          ),
                          child: const Icon(
                            Icons.location_on_outlined,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 15),
                        child: Text(_controller.search),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, right: 15),
                    child: Text(
                      _controller.currentClima == null
                          ? _controller.search
                          : 'Temperatura: ' +
                              _controller.currentClima!.temp.toString() +
                              ' C',
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 700,
            height: 300,
            color: Colors.black87,
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  Text(
                    _controller.search,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    _controller.currentClima == null
                        ? ''
                        : _controller.currentClima!.humidity.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 700,
            height: 170,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 100,
                  color: Colors.red,
                  child: Column(
                    children: [
                      Text('Amanhã'),

                      // Text(returnData['results']['city'])
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  color: Colors.blue,
                ),
                Container(
                  width: 100,
                  color: Colors.green,
                ),
                Container(
                  width: 100,
                  color: Colors.yellow,
                ),
                Container(
                  width: 100,
                  color: Colors.orange,
                ),
                Container(
                  width: 100,
                  color: Colors.purpleAccent,
                ),
                Container(
                  width: 100,
                  color: Colors.deepOrange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

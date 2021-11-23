import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/days_component.dart';
import 'package:weather_app/components/main_component.dart';
import 'package:weather_app/components/search_component.dart';
import 'package:weather_app/controllers/global_controller.dart';
import 'package:weather_app/styles/colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) async {
        Provider.of<GlobalController>(context, listen: false)
            .getValue('São Paulo', context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalController _controller = Provider.of<GlobalController>(context);

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Styles.lightPurple,
              Styles.strongPurple,
            ],
          ),
        ),
        child: _controller.isLoading
            ? const CircularProgressIndicator(
                color: Colors.white70,
              )
            : Column(
                children: const [
                  SearchComponent(),
                  MainComponent(),
                  DaysComponent(),
                ],
              ),
      ),
    );
  }
}

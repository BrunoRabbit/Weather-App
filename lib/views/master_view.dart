import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/app_bar_widget.dart';
import 'package:weather_app/controllers/global_controller.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/views/mapa_view.dart';
import 'package:weather_app/views/search_by_name_view.dart';

class MasterView extends StatelessWidget {
  const MasterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<GlobalController>(context);

    const List<Widget> pages = [
      MapaView(),
      HomeView(),
      SearchByNameView(),
    ];
    return Scaffold(
      appBar: AppBarWidget(),
      body: pages[_controller.currentViewIndex],
    );
  }
}

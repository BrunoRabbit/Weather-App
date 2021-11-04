import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controllers/global_controller.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({Key? key}) : super(key: key);

  TabController? _tabController;

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<GlobalController>(context);

    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: AppBar(
        bottom: TabBar(
          controller: _tabController,
          onTap: (value) => _controller.setCurrentViewIndex(value),
          tabs: const [
            Tab(
              text: 'Busque pelo mapa',
            ),
            Tab(
              text: 'Hoje',
            ),
            Tab(
              text: 'Busque por nome',
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 50);
}

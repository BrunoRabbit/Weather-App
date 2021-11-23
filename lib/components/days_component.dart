import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/components/widgets/animated_container_widget.dart';
import 'package:weather_app/controllers/global_controller.dart';

class DaysComponent extends StatelessWidget {
  const DaysComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalController _controller = Provider.of<GlobalController>(context);

    return _controller.getListCard() == null
        ? Container()
        : SizedBox(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (ctx, index) {
                return AnimatedContainerWidget(
                  index: index,
                  card: _controller.getListCard()![index],
                );
              },
            ),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controllers/global_controller.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalController _controller = Provider.of<GlobalController>(context);
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 15,
                bottom: 15,
                right: 10,
              ),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Procure a cidade',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontFamily: 'Zen-Regular',
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 210,
                        height: 35,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                          controller: _controller.searchController,
                          cursorColor: Colors.white12,
                          decoration: const InputDecoration(
                            hintText: 'Ex: Campinas,SP',
                            isCollapsed: true,
                            hintStyle: TextStyle(
                              color: Colors.white54,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 20,
                      top: 20,
                    ),
                    child: IconButton(
                      onPressed: () {
                        _controller.searchController != null
                            ? _controller.getValue(
                                _controller.searchController!.text, context)
                            : '';
                      },
                      icon: const Icon(
                        Icons.search_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

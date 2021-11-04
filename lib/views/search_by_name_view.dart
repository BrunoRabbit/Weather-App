import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/controllers/global_controller.dart';

class SearchByNameView extends StatelessWidget {
  const SearchByNameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Provider.of<GlobalController>(context);
    return Column(
      children: [
        Row(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          'Insira a cidade igual ao exemplo',
                        ),
                      ),
                      Container(
                        width: 210,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: TextField(
                            controller: _controller.searchController,
                            cursorColor: Colors.black87,
                            decoration: const InputDecoration(
                              hintText: 'Ex: Campinas,SP',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 10),
                  child: IconButton(
                    onPressed: () {
                      _controller.searchController != null
                          ? _controller
                              .getValue(_controller.searchController!.text)
                          : '';
                    },
                    icon: const Icon(Icons.search_rounded),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

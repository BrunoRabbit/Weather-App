import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/views/master_view.dart';

import 'controllers/global_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => GlobalController(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: MasterView(),
      ),
    );
  }
}

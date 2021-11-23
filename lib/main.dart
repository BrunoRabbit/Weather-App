import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'controllers/global_controller.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(
    const MyApp(),
  );
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
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Zen-Light'),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const HomeView(),
      ),
    );
  }
}

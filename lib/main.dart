import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SensorApp(),
    );
  }
}

class SensorApp extends StatelessWidget {
  const SensorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 중앙값 좌표를 얻기 위해 MediaQuery 사용
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    return Scaffold(

        /// Stack은 children 끼리 겹칠 수 있게 배치가 가능하다.
        body: Stack(
      children: [
        Positioned(
          left: centerX,
          top: centerY,
          child: Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
        ),
      ],
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services%202.dart';
import 'package:sensors_plus/sensors_plus.dart';

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
    /// 가로모드
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    /// 중앙값 좌표를 얻기 위해 MediaQuery 사용
    final centerX = MediaQuery.of(context).size.width / 2 - 50;
    final centerY = MediaQuery.of(context).size.height / 2 - 50;

    return Scaffold(

        /// Stack은 children 끼리 겹칠 수 있게 배치가 가능하다.
        body: Stack(
      children: [
        StreamBuilder<AccelerometerEvent>(

            /// 가속도계의 이벤트값잉 자동으로 들어온다.
            stream: accelerometerEvents,
            builder: (context, snapshot) {
              /// snapshot 안에 데이터가 있다.
              if (!snapshot.hasData) {
                return const Center(
                  /// 데이터가 없다면 로딩 중 불러온다.
                  child: CircularProgressIndicator(),
                );
              }

              final event = snapshot.data!;
              List<double> accelerometerValues = [event.x, event.y, event.z];

              return Positioned(
                left: centerX + accelerometerValues[1] * 20,
                top: centerY + accelerometerValues[0] * 20,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  width: 100,
                  height: 100,
                ),
              );
            }),
      ],
    ));
  }
}

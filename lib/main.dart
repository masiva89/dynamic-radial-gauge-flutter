import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:stepper_widget/radial_gauge/example/radial_gauge_sample.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic Radial Gauge Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const RadialGaugeSampleView(),
    );
  }
}

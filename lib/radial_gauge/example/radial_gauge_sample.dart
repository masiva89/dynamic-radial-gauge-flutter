import 'package:flutter/material.dart';
import 'package:stepper_widget/radial_gauge/data/radial_gauge_data.dart';
import 'package:stepper_widget/radial_gauge/model/rg_data_model.dart';

import '../model/pointer_range.dart';
import '../widget/custom_radial_gauge.dart';

class RadialGaugeSampleView extends StatefulWidget {
  const RadialGaugeSampleView({super.key});

  @override
  State<RadialGaugeSampleView> createState() => _RadialGaugeSampleViewState();
}

class _RadialGaugeSampleViewState extends State<RadialGaugeSampleView> {
  late List<PointerRange> _pointerRanges = [];

  late int _selectedIndex;

  void _initData() {
    RGDataModel rgDataModel = RGDataModel.fromJson(SAMPLE_RG_DATA);
    _selectedIndex = rgDataModel.selectedIndex!;
    for (var element in rgDataModel.levels!) {
      _pointerRanges.add(
        PointerRange(
          data: element.name!,
          startColor: Color.fromRGBO(
            element.startColor![0],
            element.startColor![1],
            element.startColor![2],
            1,
          ),
          endColor: Color.fromRGBO(
            element.endColor![0],
            element.endColor![1],
            element.endColor![2],
            1,
          ),
          isGradient: true,
        ),
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Radial Gauge Sample'),
        centerTitle: false,
      ),
      body: Center(
        child: SizedBox(
          width: 150,
          height: 200,
          child: Center(
            child: CustomRadialGauge(
              selectedPointerIndex: _selectedIndex,
              pointerRanges: _pointerRanges,
              needleColor: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}

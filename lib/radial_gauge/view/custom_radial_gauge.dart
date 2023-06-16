// ignore_for_file: unnecessary_getters_setters

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../model/pointer_range.dart';

class CustomRadialGauge extends StatefulWidget {
  final List<PointerRange> pointerRanges;
  final int selectedPointerIndex;
  final Color needleColor;
  const CustomRadialGauge({
    super.key,
    required this.pointerRanges,
    required this.selectedPointerIndex,
    required this.needleColor,
  });

  @override
  State<CustomRadialGauge> createState() => _CustomRadialGaugeState();
}

class _CustomRadialGaugeState extends State<CustomRadialGauge> {
  late List<PointerRange> _pointerRanges = [];
  late int _selectedPointerIndex;
  late Color _needleColor;

  late PointerRange _selectedPointerRange;

  int startAngle = 180;
  int endAngle = 360;
  int totalWidth = 63;
  int rangesPadding = 1;

  double needleValue = 25;

  void configRanges() {
    log(
      'totalWidth: $totalWidth\n'
      'rangesPadding: $rangesPadding\n'
      'rangesLength: ${_pointerRanges.length}\n',
    );
    double rangeWidth = (totalWidth - (rangesPadding * _pointerRanges.length)) /
        _pointerRanges.length;
    double startValue = 0;
    double endValue = startValue + rangeWidth;

    double startWidth = 10;
    //double incrementWidth = 5;
    log(
      'rangeWidth: $rangeWidth\n'
      'startValue: $startValue\n'
      'endValue: $endValue\n',
    );
    for (int i = 0; i < _pointerRanges.length; i++) {
      _pointerRanges[i].index = i;

      _pointerRanges[i].startValue = startValue;
      _pointerRanges[i].endValue = endValue;
      _pointerRanges[i].middleValue = (startValue + endValue) / 2;

      _pointerRanges[i].startWidth = startWidth;
      _pointerRanges[i].endWidth = startWidth;

      _pointerRanges[i].setMiddleColor();

      startValue = endValue + rangesPadding;
      endValue = startValue + rangeWidth;
      //startWidth = startWidth + incrementWidth;

      if (_selectedPointerIndex == i) {
        _pointerRanges[i].rangeOffset = 1;
        _selectedPointerRange = _pointerRanges[i];
      }
    }
    setState(() {});
  }

  @override
  void didUpdateWidget(covariant CustomRadialGauge oldWidget) {
    super.didUpdateWidget(oldWidget);
    _pointerRanges = widget.pointerRanges;
    _selectedPointerIndex = widget.selectedPointerIndex;
    _needleColor = widget.needleColor;
    configRanges();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _pointerRanges = widget.pointerRanges;
    _selectedPointerIndex = widget.selectedPointerIndex;
    _needleColor = widget.needleColor;
    configRanges();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return SfRadialGauge(
          backgroundColor: Colors.black12,
          enableLoadingAnimation: true,
          axes: <RadialAxis>[
            RadialAxis(
                showAxisLine: false,
                showLabels: false,
                showTicks: false,
                ticksPosition: ElementsPosition.outside,
                annotations: [
                  GaugeAnnotation(
                    widget: Container(child: title),
                    angle: 90,
                    positionFactor: 0.5,
                  )
                ],
                startAngle: 180,
                endAngle: 360,
                maximum: 63,
                labelOffset: 0,
                useRangeColorForAxis: true,
                canScaleToFit: false,
                pointers: <GaugePointer>[
                  NeedlePointer(
                    value: _selectedPointerRange.middleValue ?? 0,
                    enableAnimation: true,
                    animationDuration: 2000,
                    animationType: AnimationType.easeOutBack,
                    needleEndWidth: constraints.maxWidth * 0.03,
                    needleLength: constraints.maxWidth * 0.3,
                    lengthUnit: GaugeSizeUnit.logicalPixel,
                    needleColor: _needleColor,
                    tailStyle: TailStyle(
                      width: constraints.maxWidth * 0.03,
                      length: constraints.maxWidth * 0.1,
                      lengthUnit: GaugeSizeUnit.logicalPixel,
                      color: _needleColor,
                    ),
                    knobStyle: KnobStyle(
                      knobRadius: constraints.maxWidth * 0.05,
                      sizeUnit: GaugeSizeUnit.logicalPixel,
                      borderColor: _needleColor,
                      borderWidth: 3,
                      color: _selectedPointerRange.middleColor,
                    ),
                  ),
                ],
                ranges: <GaugeRange>[
                  ..._pointerRanges.map((e) {
                    return e.build();
                  }).toList(),
                ]),
          ],
        );
      },
    );
  }

  Widget get title => Text(
        _selectedPointerRange.data,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: _selectedPointerRange.middleColor ?? Colors.white,
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

/// [PointerRange] is a class that holds the data for a range level in the gauge.
/// It is used to build the [GaugeRange] widget.
class PointerRange {
  final Color startColor;
  final Color? endColor;
  final bool isGradient;
  final String? label;
  final String data;
  Color? middleColor;
  double? middleValue;
  int? index;
  double? startValue;
  double? endValue;
  double? startWidth;
  double? endWidth;
  double? rangeOffset;
  double? fontSize;

  PointerRange({
    required this.startColor,
    required this.data,
    this.endColor,
    this.label,
    this.isGradient = false,
  });

  /// This method is used to set the middle color of the range
  /// by using [startColor] and [endColor] variables.
  void setMiddleColor() {
    middleColor =
        isGradient ? Color.lerp(startColor, endColor, 0.5) : startColor;
  }

  /// This method is used to build the [GaugeRange] widget.
  GaugeRange build() {
    return GaugeRange(
        label: label,
        labelStyle: GaugeTextStyle(fontSize: fontSize ?? 10),
        startValue: startValue ?? 0,
        endValue: endValue ?? 0,
        startWidth: startWidth ?? 20,
        endWidth: endWidth ?? 20,
        color: middleColor,
        sizeUnit: GaugeSizeUnit.logicalPixel,
        rangeOffset: rangeOffset ?? 5,
        gradient: isGradient
            ? SweepGradient(
                colors: [
                  startColor,
                  endColor ?? Colors.transparent,
                ],
              )
            : null);
  }
}

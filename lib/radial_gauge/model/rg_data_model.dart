import 'package:stepper_widget/radial_gauge/model/rg_level_data_model.dart';

class RGDataModel {
  int? selectedIndex;
  List<RGLevelDataModel>? levels;

  RGDataModel({
    this.selectedIndex,
    this.levels,
  });

  RGDataModel.fromJson(Map<String, dynamic> json) {
    selectedIndex = json['selectedIndex'];
    if (json['levels'] != null) {
      levels = <RGLevelDataModel>[];
      json['levels'].forEach((dynamic v) {
        levels!.add(RGLevelDataModel.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  @override
  String toString() {
    String levelsString = '';
    for (var element in levels!) {
      levelsString += '$element\n';
    }
    return 'selectedIndex: $selectedIndex\nlevels: $levelsString';
  }
}

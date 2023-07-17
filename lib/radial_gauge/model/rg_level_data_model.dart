class RGLevelDataModel {
  String? name;
  List<int>? startColor;
  List<int>? endColor;
  int? value;

  RGLevelDataModel({
    this.name,
    this.startColor,
    this.endColor,
    this.value,
  });

  RGLevelDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    startColor = json['startColor'];
    endColor = json['endColor'];
    value = json['value'];
  }

  @override
  String toString() {
    return 'name: $name, startColor: $startColor, endColor: $endColor, value: $value';
  }
}

class RGLevelDataModel {
  String? name;
  List<int>? startColor;
  List<int>? endColor;

  RGLevelDataModel({
    this.name,
    this.startColor,
    this.endColor,
  });

  RGLevelDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    startColor = json['startColor'];
    endColor = json['endColor'];
  }

  @override
  String toString() {
    return 'name: $name, startColor: $startColor, endColor: $endColor';
  }
}

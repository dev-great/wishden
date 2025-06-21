import 'dart:ui';

class AppIntroductionScreenModel {
  String? imageAsset;
  String? title;
  String? description;

  AppIntroductionScreenModel({
    this.imageAsset,
    this.title,
    this.description,
  });

  AppIntroductionScreenModel.fromJson(Map<String, dynamic> json) {
    imageAsset = json['imageAsset'];
    title = json["title"];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imageAsset'] = imageAsset;
    data['title'] = title;
    data['description'] = description;
    return data;
  }
}

class AppScrollModel {
  String? imageAsset;
  String? title;
  Color? color;
  String? description;

  AppScrollModel({
    this.imageAsset,
    this.title,
    this.color,
    this.description,
  });

  AppScrollModel.fromJson(Map<String, dynamic> json) {
    imageAsset = json['imageAsset'];
    title = json["title"];
    color = json["color"];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['imageAsset'] = imageAsset;
    data['title'] = title;
    data["color"] = color;
    data['description'] = description;
    return data;
  }
}

class AppCategorylModel {
  String? title;
  Color? color;

  AppCategorylModel({
    this.title,
    this.color,
  });

  AppCategorylModel.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    color = json["color"];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['title'] = title;
    data["color"] = color;
    return data;
  }
}

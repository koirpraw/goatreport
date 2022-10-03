
import 'health_category.dart';

class HealthTag{
  int? tagId;
  String? tagName;
  int? tagIcon;
  int? tagStatus;
  String? healthCategory;
  String? userId;
  int? healthHeader;
  List<HealthCategory>? categories;

  HealthTag({this.tagId, this.tagName, this.tagIcon, this.tagStatus, this.healthCategory, this.userId, this.healthHeader});

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['tag_name'] = tagName;
    map['tag_id'] = tagId;
    map['tag_icon'] = tagIcon;
    map['tag_status'] = tagStatus;
    return map;
  }

  HealthTag.fromMap(Map<dynamic, dynamic> map) {
    tagId = map['tag_id'];
    tagName = map['tag_name'];
    tagIcon = map['tag_icon'];
    tagStatus = map['tag_status'];
  }

  HealthTag.fromJson(Map<String, dynamic> json) {
    tagId = json['tag_id'];
    tagName = json['tag_name'];
    tagStatus = json['tag_status'];
    if (json['categories'] != null) {
      categories = <HealthCategory>[];
      json['categories'].forEach((v) {
        categories!.add(HealthCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toMapForSync(){
    var map = new Map<String, dynamic>();
    map['tag_name'] = tagName;
    map['tag_icon'] = tagIcon;
    map['health_category'] = healthCategory;
    map['user_id'] = userId;
    return map;
  }

}
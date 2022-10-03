

class HealthCategory{

  int? catId;
  int? tagId;
  String? catName;
  String? catType;
  int? catStatus;

  HealthCategory({this.catId, this.catName, this.catType, this.tagId, this.catStatus});

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{};
    map['category_id'] = catId;
    map['tag_id'] = tagId;
    map['category_name'] = catName;
    map['category_type'] = catType;
    map['category_status'] = catStatus;
    return map;
  }

  HealthCategory.fromMap(Map<dynamic, dynamic> map) {
    catId = map['category_id'];
    tagId = map['tag_id'];
    catName = map['category_name'];
    catType = map['category_type'];
    catStatus = map['category_status'];
  }

  HealthCategory.fromJson(Map<String, dynamic> json) {
    catId = json['category_id'];
    tagId = json['tag_id'];
    catName = json['category_name'];
    catType = json['category_type'];
    catStatus = json['category_status'];
  }
}

enum HealthCategoryType{
  time,
  unit,
  rating

}
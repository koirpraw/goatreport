// To parse this JSON data, do
//
//     final healthTracker = healthTrackerFromJson(jsonString);

import 'dart:convert';

List<HealthTracker> healthTrackerFromJson(String str) => List<HealthTracker>.from(json.decode(str).map((x) => HealthTracker.fromJson(x)));

String healthTrackerToJson(List<HealthTracker> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

//--------------------------------------------- optional map methods  --------------------------------------------------------------------------------//

List<HealthTracker> healthTrackerFromMap(String str) => List<HealthTracker>.from(json.decode(str).map((x) => HealthTracker.fromMap(x)));

String healthTrackerToMap(List<HealthTracker> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

//---------------------------------------------optional map methods-----------------------------------------------------------------------------------//

// List<HealthTracker> healthTrackerFromMap(String name){
//   return List<HealthTracker>.from(json.decode(name).map((e){
//     return HealthTracker.fromMap(e);
//   }));
// }

// String healthTrackerToMap(List<HealthTracker> healthData){
//   return json.encode(List<dynamic>.from(healthData.map((e){
//     return e.toMap();
//   })));
// }



class HealthTracker {
  HealthTracker({
    this.id,
    this.createdAt,
    this.healthType,
    this.rating,
  });

  int? id;
  int? createdAt;
  String? healthType;
  int? rating;

  factory HealthTracker.fromJson(Map<String, dynamic> json) => HealthTracker(
    id: json["id"],
    createdAt: json["created_at"],
    healthType: json["health_type"],
    rating: json["rating"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "created_at": createdAt,
    "health_type": healthType,
    "rating": rating,
  };
  //------------------------------------------ Optional Map methods ------------------------------------------
  factory HealthTracker.fromMap(Map<String, dynamic> json) => HealthTracker(
    id: json["id"],
    createdAt: json["created_at"],
    healthType: json["health_type"],
    rating: json["rating"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "created_at": createdAt,
    "health_type": healthType,
    "rating": rating,
  };

//  ------------------------------------------ Optional Map methods ------------------------------------------
}

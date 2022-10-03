


class HealthModel {
   int? id;
   String? healthType;
   String? userId;
   String? healthName;
   String? healthValue;
   String? healthUnit;
   String? date;
   bool? isSynced = false;

   HealthModel({this.id,this.healthName, this.healthType, this.healthUnit, this.healthValue, this.date,this.isSynced,this.userId});

   Map<String, dynamic> toMap(){
     var map = new Map<String, dynamic>();
       map['health_name'] = healthName;
       map['user_id'] = userId;
       map['health_type'] = healthType;
       map['health_value'] = healthValue;
       map['health_unit'] = healthUnit;
       map['date'] = date;
       map['is_sync'] = isSynced;
     return map;
   }

  HealthModel.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    healthType = map['health_type'];
    healthName = map['health_name'];
    healthUnit = map['health_unit'];
    healthValue = map['health_value'];
    // date = map['date'];
    userId = map['user_id'];
    date = map['date'].toString();
  }

 HealthModel.fromAPIMap(Map<dynamic, dynamic> map){
   id = map['id'];
   healthType = map['health_type'];
   healthName = map['health_name'];
   healthUnit = map['health_unit'];
   healthValue = map['health_value'];
   date = DateTime.fromMillisecondsSinceEpoch(map['date']).toString();
 }

}


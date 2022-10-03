


import 'health_tag.dart';

class HealthHeader {
  int? headerId;
  String? headerName;
  List<HealthTag>? tagList;

  HealthHeader(
      {this.headerId,  this.headerName,  this.tagList});

   HealthHeader.fromJson(Map<String, dynamic> json) {
     headerName = json['header_name'];
     headerId = json['header_id'];
     if (json['health_tag'] != null) {
       tagList = <HealthTag>[];
       json['health_tag'].forEach((v) {
         tagList!.add(HealthTag.fromJson(v));
       });
     }
  }
}

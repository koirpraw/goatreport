

class UserDetails{

  String? name;
  String? email;
  String? password;
  String? id;
  String? accessToken;


  UserDetails({this.name, this.email, this.password, this.id, this.accessToken});


  Map<String, dynamic> toRegisterMap(){
    var map = new Map<String, dynamic>();
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

  Map<String, dynamic> toSignInMap() {
    var map = new Map<String, dynamic>();
    map['email'] = email;
    map['password'] = password;
    return map;
  }

  UserDetails.fromMap(Map<dynamic, dynamic> map) {
    accessToken = map['authToken'];
    id = map['userId'].toString();
  }

  Map<String, dynamic> socialLogin() {
    var map = new Map<String, dynamic>();
    map['token'] = accessToken;
    map['id'] = id;
    return map;
  }

  Map<String, dynamic> appleLogin() {
    var map = new Map<String, dynamic>();
    map['email'] = email;
    map['id'] = id;
    return map;
  }

  Map<String, dynamic> googleSign() {
    var map = new Map<String, dynamic>();
    map['email'] = email;
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}
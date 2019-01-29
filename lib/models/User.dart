class User {
  String _userName;
  String _password;
  int _id;
  String get userName => _userName;
  String get password => _password;
  int get id => _id;
  User(this._userName, this._password, [this._id]);
  User.map(dynamic obj) {
    this._userName = obj['userName'];
    this._password = obj['password'];
    this._id = obj['id'];
  }
  User.fromMap(Map<String, dynamic> map) {
    this._userName = map["userName"];
    this._password = map["password"];
    if (map["id"] != null) {
      this._id = map["id"];
    }else{
      print("in fromMap, Id is null");
    }
  }

  Map<String, dynamic> toMap() {
    Map map = Map<String, dynamic>();
    map["userName"] = this._userName;
    map["password"] = this._password;
    if (_id != null) {
      map["id"] = _id;
    } else {
      print("in toMap, id is null");
    }
    return map;
  }

  @override
  String toString() {
    return "ID is ${this._id} , Username is ${this._userName} and Password is ${this._password}";
  }
}

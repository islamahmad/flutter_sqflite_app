class User {
  String _userName;
  String _password;
  int _id;
  User(this._userName, this._password);
  User.map(dynamic obj) {
    this._userName = obj["userName"];
    this._password = obj["password"];
    this._id = obj["id"];
  }
  User.fromMap(Map<String, dynamic> map) {
    this._userName = map["userName"];
    this._password = map["password"];
    if (map["id"] != null) {
      this._id = map["id"];
    }
  }
  String get name => _userName;
  int get id => _id;
  String get pass => _password;
  set name(String value) {
    _userName = value;
  }

  set password(String value) {
    _password = value;
  }

  set id(int value) {
    _id = value;
  }

  Map<String, dynamic> toMap() {
    Map map = Map<String, dynamic>();
    map["userName"] = this._userName;
    map["password"] = this._password;
    if (id != null) {
      map["id"] = this._id;
    }
    return map;
  }
}

class User {
  String _name;
  String _pass;
  int _id;
  User(this._name, this._pass);
  User.map(dynamic obj) {
    this._name = obj["name"];
    this._pass = obj["pass"];
    this._id = obj["id"];
  }
  User.fromMap(Map<String, dynamic> map) {
    this._name = map["name"];
    this._pass = map["pass"];
    if (map["id"] != null) {
      this._id = map["id"];
    }
  }
  String get name => _name;
  int get id => _id;
  String get pass => _pass;
  set name(String value) {
    _name = value;
  }

  set pass(String value) {
    _pass = value;
  }

  set id(int value) {
    _id = value;
  }

  Map<String, dynamic> toMap() {
    Map map = Map<String, dynamic>();
    map["name"] = _name;
    map["pass"] = _pass;
    if (id != null) {
      map["id"] = _id;
    }
    return map;
  }
}

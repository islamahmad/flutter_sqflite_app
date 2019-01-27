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
}

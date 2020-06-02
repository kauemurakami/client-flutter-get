class Client {
  int _id;
  String _name;
  String _email;
  String _password;

  Client({
    id,
    name,
    email,
    password,
  });

  get id => this._id;
  set id(value) => this._id;

  get name => this._name;
  set name(value) => this._name;

  get email => this._email;
  set email(value) => this._email;

  get password => this._password;
  set password(value) => this._password;

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;

    return data;
  }
}

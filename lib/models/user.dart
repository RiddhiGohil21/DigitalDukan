

class User {
  final String firstName, mobile, email, lang, font;
  User(this.firstName, this.mobile, this.email, this.lang, this.font);

  /*
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
   data['id'] = this.firstName;
    data['name'] = this.lastName;
    data['avatar'] = this.website;
  }*/
  Map<String, dynamic> toJson() => {
        "first_name": this.firstName,
        "mobile": this.mobile,
        "email": this.email,
        "lang": this.lang,
        "font": this.font,
      };

  static fromJson(user) {}
}

/*
class UserList {
  final List<User> users;
  UserList(this.users);
 
  UserList.fromJson(List<dynamic> usersJson) :
      users = usersJson.map((user) => User.fromJson(user)).toList();
}*/


/*
class User {
  String firstName;
  int mobile;
  String email;
  String lang;
  String font;
  List<List> list;

  User(
      {this.firstName,
      this.mobile,
      this.email,
      this.lang,
      this.font,
      this.list});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    mobile = json['mobile'];
    email = json['email'];
    lang = json['lang'];
    font = json['font'];
    if (json['list'] != null) {
      list = new List<List>();
      json['list'].forEach((v) {
        list.add(new List.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = this.firstName;
    data['mobile'] = this.mobile;
    data['email'] = this.email;
    data['lang'] = this.lang;
    data['font'] = this.font;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class List {
  String names;
  int quantity;

  List({this.names, this.quantity});

  List.fromJson(Map<String, dynamic> json) {
    names = json['names'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['names'] = this.names;
    data['quantity'] = this.quantity;
    return data;
  }
}
*/

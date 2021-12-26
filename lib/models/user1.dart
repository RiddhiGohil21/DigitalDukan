class User1 {
  final String firstName, lastName;
   User1(this.firstName,this.lastName);

  /*
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
   data['id'] = this.firstName;
    data['name'] = this.lastName;
    data['avatar'] = this.website;
  }*/
  Map<String, dynamic> toJson() => {
    "item_name": this.firstName,
    "quantity": this.lastName,
    
  };


  static fromJson(user1) {}
}
class ProductDataModel {
  String id;
  String name;
  String mobile;

  ProductDataModel({
    this.id,
    this.name,
    this.mobile,
  });

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mobile = json['mobile'];
  }
}

class BaseModel {
  BaseModel(
      {this.id, this.createAt, this.updateAt, this.deleted, this.protected});

  String? id;
  bool? deleted;
  bool? protected;
  String? createAt;
  String? updateAt;
}

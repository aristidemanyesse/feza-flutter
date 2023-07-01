class BaseModel {
  BaseModel(
      {this.id, this.createdAt, this.updateAt, this.deleted, this.protected});

  String? id;
  bool? deleted;
  bool? protected;
  String? createdAt;
  String? updateAt;
}

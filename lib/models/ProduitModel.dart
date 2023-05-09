class ProduitModel {
  ProduitModel({
    this.id,
    this.name,
    this.description,
    this.codebarre,
    this.onlyOrdonnance,
    this.image,
    this.type,
    this.deleted,
    this.protected,
    this.createAt,
    this.updateAt,
  });

  int? id;
  String? name;
  String? description;
  String? codebarre;
  String? onlyOrdonnance;
  String? image;
  int? type;
  bool? deleted;
  bool? protected;
  String? createAt;
  String? updateAt;

  factory ProduitModel.fromJson(Map<String, dynamic> json) => ProduitModel(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      codebarre: json["codebarre"],
      onlyOrdonnance: json["onlyOrdonnance"],
      image: json["image"],
      type: json["type"],
      deleted: json["deleted"],
      protected: json["protected"],
      createAt: json["createAt"],
      updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "codebarre": codebarre,
        "onlyOrdonnance": onlyOrdonnance,
        "image": image,
        "type": type,
        "deleted": deleted,
        "protected": protected,
        "createAt": createAt,
        "updateAt": updateAt
      };
}

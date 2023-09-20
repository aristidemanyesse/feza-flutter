import 'package:ipi/models/UtilisateurModel.dart';

class DemandeModel {
  DemandeModel({
    this.id,
    this.ordonnance,
    this.commentaire,
    this.isFinished,
    this.isSatisfied,
    this.utilisateur,
    this.lon,
    this.lat,
    this.propagating,
    this.base64,
    this.deleted,
    this.protected,
    this.createdAt,
    this.updateAt,
  });

  String? id;
  UtilisateurModel? utilisateur;
  bool? propagating;
  bool? isFinished;
  bool? isSatisfied;
  double? lon;
  double? lat;
  String? commentaire;
  String? ordonnance;
  String? base64;
  bool? deleted;
  bool? protected;
  String? createdAt;
  String? updateAt;

  factory DemandeModel.fromJson(Map<String, dynamic> json) => DemandeModel(
      id: json["id"],
      commentaire: json["commentaire"],
      ordonnance: json["ordonnance"],
      lon: json["lon"],
      lat: json["lat"],
      propagating: json["propagating"],
      isFinished: json["isFinished"],
      isSatisfied: json["isSatisfied"],
      utilisateur: UtilisateurModel.fromJson(json["utilisateur"]),
      deleted: json["deleted"],
      protected: json["protected"],
      createdAt: json["createdAt"],
      updateAt: json["updateAt"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "commentaire": commentaire,
        "ordonnance": ordonnance,
        "base64": base64,
        "lat": lat,
        "lon": lon,
        "propagating": propagating,
        "isFinished": isFinished,
        "isSatisfied": isSatisfied,
        "utilisateur": utilisateur?.toJson(),
        "deleted": deleted,
        "protected": protected,
        "createdAt": createdAt,
        "updateAt": updateAt
      };
}

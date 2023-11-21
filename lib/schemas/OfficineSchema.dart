import 'package:ipi/models/officineApp/Circonscription.dart';
import 'package:ipi/models/officineApp/Officine.dart';
import 'package:ipi/models/officineApp/TypeOfficine.dart';

class OfficineSchema {
  static const String ALL = r"""
    query ($id: UUID, $circonscription: UUID, $type: String, $name: String, $ic_name: String) {
      searchOfficine(
        deleted: false
        id: $id
        circonscription_Id: $circonscription
        name_Iexact: $name
        name_Icontains: $ic_name
        type_Etiquette: $type
      ) {
        results {
          ...OfficineFragment
        }
      }
    }
  """ +
      Officine.OfficineFragment +
      TypeOfficine.TypeOfficineFragment +
      Circonscription.CirconscriptionFragment;

  static const String OFFICINE_DISTANCE = r"""
    query ($id: String, $longitude: Float, $latitude: Float) {
      searchOfficineDistance(id: $id, longitude: $longitude, latitude: $latitude) {
        distance
        officine
        route
      }
    }
  """;

  static const String OFFICINES_AVIALABLE = r"""
    query ($longitude: Float, $latitude: Float, $distance: Int,  $circonscription: String,) {
      searchOfficineAvialable(longitude: $longitude, latitude: $latitude, distance: $distance, circonscription: $circonscription) {
        distance
        officine
        route
      }
    }
  """;

  static const String OFFICINES_GARDE_AVIALABLE = r"""
    query ($longitude: Float, $latitude: Float, $distance: Int,  $circonscription: String,) {
      searchOfficineGardeAvialable(longitude: $longitude, latitude: $latitude, distance: $distance, circonscription: $circonscription) {
        distance
        officine
        route
      }
    }
  """;
}

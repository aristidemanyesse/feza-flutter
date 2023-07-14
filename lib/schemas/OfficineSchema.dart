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
          id
          name
          contact
          contact2
          localisation
          geometryJson
          lat
          lon
          type {
            id
            name
            etiquette
          }
          image
          image2
          image3
          circonscription {
            id
            name
          }
        }
      }
    }
  """;

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

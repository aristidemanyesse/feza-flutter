class OfficineDeGardeSchema {
  static const String ALL = r"""
    query ($garde: UUID, $circonscription: UUID) {
      searchOfficineDeGarde(
        garde_Id: $garde
        officine_Circonscription_Id: $circonscription
      ) {
        results {
          id
          createdAt
          officine {
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
    }
  """;
}

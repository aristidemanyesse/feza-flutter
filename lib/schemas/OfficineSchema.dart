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

  static const String GET_ONE = """
    query{
      countries(filter:{currency:{eq:"EGP"}}){
        name
      }
    }
  """;
}

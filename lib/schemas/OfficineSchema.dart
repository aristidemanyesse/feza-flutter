class OfficineSchema {
  static const String ALL = r"""
    query ($id: UUID, $circonscription: UUID, $type: UUID, $name: String, $ic_name: String) {
      searchOfficine(
        deleted: false
        id: $id
        circonscription_Id: $circonscription
        type_Id: $type
        name_Iexact: $name
        name_Icontains: $ic_name
      ) {
        results {
          id
          name
          contact
          contact2
          localisation
          geometryJson
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

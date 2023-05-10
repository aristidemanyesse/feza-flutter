class CirconscriptionSchema {
  static const String ALL = r"""
    query ($id: UUID, $name: String) {
      searchCirconscription(
        deleted: false
        id: $id
        name: $name
      ) {
        results {
          id
          name
          geometryJson
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

class ProduitSchema {
  static const String ALL = r"""
    query ($id: UUID, $code: String, $name: String, $type: UUID) {
  searchProduit(
    deleted: false
    id: $id
    codebarre: $code
    name_Icontains: $name
    type_Id: $type
  ) {
    results {
      id
      name
      description
      codebarre
      onlyOrdonnance
      image
      type {
        id
        name
        etiquette
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
class ProduitSchema {
  static const String ALL = r"""
    query ($id: UUID, $codebarre: String, $name: String, $type: UUID) {
  searchProduit(
    deleted: false
    id: $id
    codebarre: $codebarre
    name_Icontains: $name
    type_Id: $type
  ) {
    results {
      id
      name
      description
      codebarre
      onlyOrdonnance
      cis
      forme
      voies
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

  static const String SPECIFIC_ALL = r"""
query ($produits: [String]!) {
  searchProduits(produits: $produits) {
     id
      name
      description
      codebarre
      onlyOrdonnance
      cis
      forme
      voies
      image
      type {
        id
        name
        etiquette
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

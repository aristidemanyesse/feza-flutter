class ProduitInOfficineSchema {
  static const String ALL = r"""
  

  """;

  static const String SEARCH_PRODUITS_AVIALABLE_IN_OFFICINE = r"""
    query ($circonscription: String!, $produits: [String]!) {
      searchProduitsAvialableInOfficine(
        produits: $produits
        circonscription: $circonscription
      ) {
        officine
        produits
        ratio
        distance
        route
      }
}
  """;
}

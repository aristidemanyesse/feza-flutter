class ProduitInOfficineSchema {
  static const String ALL = r"""
  

  """;

  static const String SEARCH_PRODUITS_AVIALABLE_IN_OFFICINE = r"""
    query ($circonscription: String, $produits: [String]!, $longitude:Float, $latitude:Float) {
      searchProduitsAvialableInOfficine(
        produits: $produits
        circonscription: $circonscription
        longitude: $longitude
        latitude: $latitude
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

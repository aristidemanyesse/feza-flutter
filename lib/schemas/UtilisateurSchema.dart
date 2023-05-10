class UtilisateurSchema {
  static const String ALL = r"""
    query ($otp: String, $circonscription: UUID, $contact: String, $imei:String) {
  searchUtilisateur(
    deleted: false
    otp: $otp
    circonscription_Id: $circonscription
    contact: $contact,
    imei:$imei
  ) {
    results {
      id
      fullname
      contact
      imei
      createdAt
      image
      isValide
      otp
      geometryJson
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

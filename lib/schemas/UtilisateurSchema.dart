class UtilisateurSchema {
  static const String ALL = r"""
    query($otp:String , $circonscription:UUID){
      searchUtilisateur(deleted: false, otp: $otp, circonscription_Id:$circonscription){
        results{
          id
          fullname
          contact
          createdAt
          image
          isValide
          otp
          geometryJson
          circonscription{
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

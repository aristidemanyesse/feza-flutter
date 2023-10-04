class UtilisateurSchema {
  static const String ALL = r"""
    query ($otp: String, $id:UUID, $circonscription: UUID, $contact: String, $imei:String) {
  searchUtilisateur(
    deleted: false
    id: $id
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

  static const String CREATE = r"""
    mutation ($fullname: String!, $contact: String!, $imei: String!, $circonscription: ID) {
  createUtilisateur(
    newUtilisateur: {contact: $contact, fullname:$fullname, imei: $imei, circonscription: $circonscription}
  ) {
    ok
    errors {
      field
      messages
    }
    utilisateur {
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

  static const String UPDATE = r"""
    mutation ($id:UUID!, $contact: String!, $fullname: String!, $imei: String!, $circonscription: ID!, $isValide: Boolean) {
      updateUtilisateur(
        newUtilisateur: {id:$id, fullname:$fullname, contact: $contact, imei: $imei, circonscription: $circonscription, isValide : $isValide}
      ) {
        ok
        errors {
          field
          messages
        }
        utilisateur {
          id
          contact
          imei
          isValide
          otp
          circonscription {
            id
            name
          }
        }
      }
    }
  """;
}

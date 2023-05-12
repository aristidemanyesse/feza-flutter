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

  static const String CREATE = r"""
    mutation ($contact: String!, $imei: String!, $circonscription: ID!) {
  createUtilisateur(
    newUtilisateur: {contact: $contact, imei: $imei, circonscription: $circonscription}
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
mutation ($id:UUID!, $contact: String!, $imei: String!, $circonscription: ID!) {
  updateUtilisateur(
    newUtilisateur: {id:$id, contact: $contact, imei: $imei, circonscription: $circonscription}
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
      circonscription {
        id
        name
      }
    }
  }
}
  """;
}

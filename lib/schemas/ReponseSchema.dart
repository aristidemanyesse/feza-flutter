class ReponseSchema {
  static const String ALL = r"""
    query ($demande: UUID, $officine:UUID) {
      searchReponse(deleted: false, demande_Officine_Id:$officine, demande_Demande_Id: $demande) {
        results {
          id
          commentaire
          read
          price
          demande {
            id
            demande {
              id
              status
              ordonnance
              commentaire
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
            officine {
              id
              name
              contact
              contact2
              localisation
              geometryJson
              lat
              lon
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
      }
    }
  """;

  static const String UPDATE_REPONSE = r"""
    mutation($id:UUID, $demande:ID!, $read:Boolean) {
      updateReponse(newReponse: {id: $id, demande:$demande, read: $read}) {
        ok
        errors {
          field
          messages
        }
        reponse {
          id
          commentaire
          read
          demande {
            demande {
              id
              status
              ordonnance
              commentaire
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
            officine {
              id
              name
              contact
              contact2
              localisation
              geometryJson
              lat
              lon
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
      }
    }
  """;

  static const String LIGNE_REPONSE = r"""
      query ($reponse: UUID) {
        searchLigneReponse(deleted: false, reponse_Id: $reponse) {
          results {
            id
            status
            price
            quantite
            reponse {
              id
              commentaire
              read
              demande {
                demande {
                  id
                  status
                  ordonnance
                  commentaire
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
                officine {
                  id
                  name
                  contact
                  contact2
                  localisation
                  geometryJson
                  lat
                  lon
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
            produit {
              id
              name
              description
              price
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
      }
  """;

  static const String SUBS_LIGNE_REPONSE = r"""
      query ($ligne_id: UUID) {
        searchSubsLigneReponse(deleted: false, ligne_Id: $ligne_id) {
          results {
            id
            price
            quantite
            ligne {
               id
            status
            price
            quantite
            reponse {
              id
              commentaire
              read
              demande {
                demande {
                  id
                  status
                  ordonnance
                  commentaire
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
                officine {
                  id
                  name
                  contact
                  contact2
                  localisation
                  geometryJson
                  lat
                  lon
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
            produit {
              id
              name
              description
              price
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
            produit {
              id
              name
              description
              price
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
      }
  """;

  static const String RDV_LIGNE_REPONSE = r"""
      query ($user_id: UUID) {
        searchRdvLigneReponse(deleted: false, ligne_Reponse_Demande_Demande_Utilisateur_Id: $user_id) {
          results {
            id
            valide
            days
            read
            validedDate
            ligne {
               id
            status
            price
            quantite
            reponse {
              id
              commentaire
              read
              demande {
                demande {
                  id
                  status
                  ordonnance
                  commentaire
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
                officine {
                  id
                  name
                  contact
                  contact2
                  localisation
                  geometryJson
                  lat
                  lon
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
            produit {
              id
              name
              description
              price
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
        }
      }
  """;
}

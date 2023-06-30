class ReponseSchema {
  static const String ALL = r"""
      query($demande:UUID){
        searchReponse(deleted: false, demande_Id:$demande){
          results{
            id
            commentaire
            demande{
              id
            status
            ordonnance
            commentaire
            utilisateur{
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
            officine{
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
      query($reponse:UUID){
        searchLigneReponse(deleted: false, reponse_Id:$reponse){
          results{
            id
            status
            produit{
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
      }
  """;
}

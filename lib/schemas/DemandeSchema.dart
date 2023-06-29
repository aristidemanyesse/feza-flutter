class DemandeSchema {
  static const String ALL = r"""
      query($user:UUID, $status:Boolean){
        searchDemande(deleted: false, status:$status, utilisateur_Id:$user){
          results{
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
  """;

  static const String LIGNE_DEMANDE = r"""
      query($user:UUID){
        searchLigneDemande(deleted: false, demande_Id:$user){
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

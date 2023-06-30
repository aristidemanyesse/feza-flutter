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

  static const String CREATE_DEMANDE = r"""
      mutation(
        $officine:ID!,
        $utilisateur:ID!,
        $commentaire:String,
        $base64:String){
        createDemande(
          newDemande:{
            officine: $officine,
            commentaire:$commentaire,
            base64: $base64,
            utilisateur: $utilisateur
          }
        ){
          ok
          errors{
            field
            messages
          }
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
  """;

  static const String LIGNE_DEMANDE = r"""
      query($demande:UUID){
        searchLigneDemande(deleted: false, demande_Id:$demande){
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

  static const String CREATE_LIGNE_DEMANDE = r"""
      mutation(
        $demande:ID!,
        $produit:ID!){
        createLigneDemande(
          newLignedemande:{
            demande: $demande,
            produit:$produit
          }
        ){
          ok
          errors{
            field
            messages
          }
          lignedemande{
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

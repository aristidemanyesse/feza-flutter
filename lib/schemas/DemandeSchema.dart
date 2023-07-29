class DemandeSchema {
  static const String ALL = r"""
      query($user:UUID, $status:Boolean){
        searchDemande(deleted: false, status:$status, utilisateur_Id:$user){
          results{
            id
            status
            ordonnance
            base64
            commentaire
            createdAt
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
          }
        }
      }
  """;

  static const String CREATE_DEMANDE = r"""
      mutation(
        $utilisateur:ID!,
        $commentaire:String,
        $base64:String){
        createDemande(
          newDemande:{
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
            base64
            ordonnance
            commentaire
            createdAt
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
          }
        }
      }
  """;

  static const String UPDATE_DEMANDE = r"""
      mutation ($id: UUID, $utilisateur:ID, $status: Boolean, $deleted: Boolean) {
        updateDemande(newDemande: {id: $id, utilisateur:$utilisateur, status: $status, deleted: $deleted}) {
          ok
          errors {
            field
            messages
          }
          demande {
            id
            status
            base64
            ordonnance
            commentaire
            createdAt
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
      }
  """;

  static const String LIGNE_DEMANDE = r"""
      query($demande:UUID){
        searchLigneDemande(deleted: false, demande_Id:$demande){
          results{
            id
            status
            quantite
            demande{
              id
              status
              base64
              ordonnance
              commentaire
              createdAt
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
            }
            produit{
              id
              name
              price
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
        $produit:ID!,
        $quantite:Int
        ){
        createLigneDemande(
          newLignedemande:{
            demande: $demande,
            produit:$produit,
            quantite:$quantite,
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
            quantite
            demande{
              id
              status
              base64
              ordonnance
              commentaire
              createdAt
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
            }
            produit{
              id
              name
              price
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

  static const String OFFICINE_DEMANDE = r"""
      query ($demande: UUID, $officine: UUID) {
        searchOfficineDemande(
          deleted: false
          demande_Id: $demande
          officine_Id: $officine
        ) {
          results {
            id
            status
            demande {
              id
              status
              base64
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
  """;

  static const String CREATE_OFFICINE_DEMANDE = r"""
      mutation ($demande: ID!, $officine: ID!) {
        createOfficineDemande(
          newOfficinedemande: { demande: $demande, officine: $officine }
        ) {
          ok
          errors {
            field
            messages
          }
          officinedemande {
            id
            status
            demande {
              id
              status
              base64
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

  """;
}

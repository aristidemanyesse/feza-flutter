class DemandeSchema {
  static const String ALL = r"""
      query($user:UUID, $isFinished:Boolean){
        searchDemande(deleted: false, isFinished:$isFinished, utilisateur_Id:$user){
          results{
            id
            propagating
            isFinished
            ordonnance
            base64
            lon
            lat
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
        $lon:Float,
        $lat:Float,
        $base64:String){
        createDemande(
          newDemande:{
            commentaire:$commentaire,
            base64: $base64,
            lon: $lon,
            lat: $lat,
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
            propagating
            isFinished
            base64
            lon
            lat
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
      mutation ($id: UUID, $utilisateur:ID, $isFinished: Boolean, $deleted: Boolean) {
        updateDemande(newDemande: {id: $id, utilisateur:$utilisateur, isFinished: $isFinished, deleted: $deleted}) {
          ok
          errors {
            field
            messages
          }
          demande {
            id
            propagating
            isFinished
            base64
            lon
            lat
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
              propagating
              isFinished
              base64
              lon
              lat
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
              propagating
              isFinished
              ordonnance
              commentaire
              lon
              lat
              createdAt
              base64
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
            isValided
            propagated
            demande {
              id
              propagating
              isFinished
              ordonnance
              base64
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
            isValided
            propagated
            demande {
              id
              propagating
              isFinished
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

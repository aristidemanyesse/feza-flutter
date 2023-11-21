import 'package:ipi/models/demandeApp/LigneReponse.dart';
import 'package:ipi/models/demandeApp/RdvLigneReponse.dart';
import 'package:ipi/models/demandeApp/Reponse.dart';
import 'package:ipi/models/demandeApp/SubsLigneReponse.dart';
import 'package:ipi/models/produitApp/Produit.dart';
import 'package:ipi/models/produitApp/TypeProduit.dart';

class ReponseSchema {
  static const String ALL = r"""
    query ($demande: UUID, $officine:UUID, $created:CustomDateTime) {
      searchReponse(deleted: false, demande_Officine_Id:$officine, demande_Demande_Id: $demande, createdAt_Gte: $created) {
        results {
          ...ReponseFragment
        }
      }
    }
  """ +
      Reponse.ReponseFragment +
      SubsLigneReponse.SubsLigneReponseFragment +
      RdvLigneReponse.RdvLigneReponseFragment +
      Produit.ProduitFragment +
      TypeProduit.TypeProduitFragment +
      LigneReponse.LigneReponseFragment;

  static const String UPDATE_REPONSE = r"""
    mutation($id:UUID, $read:Boolean) {
      updateReponse(newReponse: {id: $id, read: $read}) {
        ok
        errors {
          field
          messages
        }
        reponse {
          ...ReponseFragment
        }
      }
    }
  """ +
      Reponse.ReponseFragment;

  static const String LIGNE_REPONSE = r"""
      query ($reponse: UUID) {
        searchLigneReponse(deleted: false, reponse_Id: $reponse) {
          results {
            ...LigneReponseFragment
          }
        }
      }
  """ +
      SubsLigneReponse.SubsLigneReponseFragment +
      LigneReponse.LigneReponseFragment;

  static const String SUBS_LIGNE_REPONSE = r"""
      query ($ligne_id: UUID) {
        searchSubsLigneReponse(deleted: false, ligne_Id: $ligne_id) {
          results {
            ...SubsLigneReponseFragment
          }
        }
      }
  """ +
      SubsLigneReponse.SubsLigneReponseFragment +
      Reponse.ReponseFragment;

  static const String RDV_LIGNE_REPONSE = r"""
      query ($user_id: UUID) {
        searchRdvLigneReponse(deleted: false, ligne_Reponse_Demande_Demande_Utilisateur_Id: $user_id) {
          results {
            ...RdvLigneReponseFragment
          }
        }
      }
  """ +
      RdvLigneReponse.RdvLigneReponseFragment;
}

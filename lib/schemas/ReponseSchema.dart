import 'package:ipi/models/demandeApp/Demande.dart';
import 'package:ipi/models/demandeApp/LigneReponse.dart';
import 'package:ipi/models/demandeApp/OfficineDemande.dart';
import 'package:ipi/models/demandeApp/RdvLigneReponse.dart';
import 'package:ipi/models/demandeApp/Reponse.dart';
import 'package:ipi/models/demandeApp/SubsLigneReponse.dart';
import 'package:ipi/models/officineApp/Circonscription.dart';
import 'package:ipi/models/officineApp/Officine.dart';
import 'package:ipi/models/officineApp/TypeOfficine.dart';
import 'package:ipi/models/produitApp/Produit.dart';
import 'package:ipi/models/produitApp/TypeProduit.dart';
import 'package:ipi/models/userApp/Utilisateur.dart';

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
      Demande.DemandeFragment +
      Utilisateur.UtilisateurFragment +
      Circonscription.CirconscriptionFragment +
      Officine.OfficineFragment +
      OfficineDemande.OfficineDemandeFragment +
      TypeOfficine.TypeOfficineFragment;

  static const String UPDATE_REPONSE = r"""
    mutation($id:UUID, $demande:ID!, $read:Boolean) {
      updateReponse(newReponse: {id: $id, demande:$demande, read: $read}) {
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
      Reponse.ReponseFragment +
      OfficineDemande.OfficineDemandeFragment +
      Demande.DemandeFragment +
      Utilisateur.UtilisateurFragment +
      Circonscription.CirconscriptionFragment +
      Officine.OfficineFragment +
      TypeOfficine.TypeOfficineFragment;

  static const String LIGNE_REPONSE = r"""
      query ($reponse: UUID) {
        searchLigneReponse(deleted: false, reponse_Id: $reponse) {
          results {
            ...LigneReponseFragment
          }
        }
      }
  """ +
      LigneReponse.LigneReponseFragment +
      Reponse.ReponseFragment +
      OfficineDemande.OfficineDemandeFragment +
      Demande.DemandeFragment +
      Utilisateur.UtilisateurFragment +
      Circonscription.CirconscriptionFragment +
      Officine.OfficineFragment +
      TypeOfficine.TypeOfficineFragment;

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
      Reponse.ReponseFragment +
      Demande.DemandeFragment +
      Utilisateur.UtilisateurFragment +
      Circonscription.CirconscriptionFragment +
      Officine.OfficineFragment +
      OfficineDemande.OfficineDemandeFragment +
      TypeOfficine.TypeOfficineFragment;

  static const String RDV_LIGNE_REPONSE = r"""
      query ($user_id: UUID) {
        searchRdvLigneReponse(deleted: false, ligne_Reponse_Demande_Demande_Utilisateur_Id: $user_id) {
          results {
            ...RdvLigneReponseFragment
          }
        }
      }
  """ +
      RdvLigneReponse.RdvLigneReponseFragment +
      Reponse.ReponseFragment +
      Officine.OfficineFragment +
      TypeOfficine.TypeOfficineFragment +
      OfficineDemande.OfficineDemandeFragment +
      Demande.DemandeFragment +
      Utilisateur.UtilisateurFragment +
      Circonscription.CirconscriptionFragment +
      Produit.ProduitFragment +
      TypeProduit.TypeProduitFragment +
      LigneReponse.LigneReponseFragment;
}

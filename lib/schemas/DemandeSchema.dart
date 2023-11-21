import 'package:ipi/models/demandeApp/Demande.dart';
import 'package:ipi/models/demandeApp/LigneDemande.dart';
import 'package:ipi/models/demandeApp/OfficineDemande.dart';
import 'package:ipi/models/officineApp/Circonscription.dart';
import 'package:ipi/models/officineApp/Officine.dart';
import 'package:ipi/models/officineApp/TypeOfficine.dart';
import 'package:ipi/models/produitApp/Produit.dart';
import 'package:ipi/models/produitApp/TypeProduit.dart';
import 'package:ipi/models/userApp/Utilisateur.dart';

class DemandeSchema {
  static const String ALL = r"""
    query ($user:UUID, $isFinished:Boolean) {
      searchDemande(deleted: false, isFinished:$isFinished, utilisateur_Id:$user) {
        results {
          ...DemandeFragment
        }
      }
    }
  """ +
      Demande.DemandeFragment +
      Utilisateur.UtilisateurFragment +
      Circonscription.CirconscriptionFragment;

  static const String CREATE_DEMANDE = r"""
      mutation( $utilisateur:ID!, $commentaire:String, $lon:Float, $lat:Float, $base64:String){
        createDemande(
          newDemande:{ commentaire:$commentaire, base64: $base64, lon: $lon, lat: $lat, utilisateur: $utilisateur }
        ){
          ok
          errors{
            field
            messages
          }
          demande{
            ...DemandeFragment
          }
        }
      }
  """ +
      Demande.DemandeFragment +
      Utilisateur.UtilisateurFragment +
      Circonscription.CirconscriptionFragment;

  static const String UPDATE_DEMANDE = r"""
      mutation ($id: UUID, $utilisateur:ID, $isFinished: Boolean, $deleted: Boolean) {
        updateDemande(newDemande: {id: $id, utilisateur:$utilisateur, isFinished: $isFinished, deleted: $deleted}) {
          ok
          errors {
            field
            messages
          }
          demande {
            ...DemandeFragment
          }
        }
      }
  """ +
      Demande.DemandeFragment +
      Utilisateur.UtilisateurFragment +
      Circonscription.CirconscriptionFragment;

  static const String LIGNE_DEMANDE = r"""
      query($demande:UUID){
        searchLigneDemande(deleted: false, demande_Id:$demande){
          results{
            ...LigneDemandeFragment
          }
        }
      }
  """ +
      Demande.DemandeFragment +
      LigneDemande.LigneDemandeFragment +
      Produit.ProduitFragment +
      TypeProduit.TypeProduitFragment +
      Utilisateur.UtilisateurFragment +
      Circonscription.CirconscriptionFragment;

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
            ...LigneDemandeFragment
          }
        }
      }
  """ +
      Demande.DemandeFragment +
      LigneDemande.LigneDemandeFragment +
      Utilisateur.UtilisateurFragment +
      Circonscription.CirconscriptionFragment;

  static const String OFFICINE_DEMANDE = r"""
      query ($demande: UUID, $officine: UUID) {
        searchOfficineDemande(
          deleted: false
          demande_Id: $demande
          officine_Id: $officine
        ) {
          results {
            ...OfficineDemandeFragment
          }
        }
      }
  """ +
      OfficineDemande.OfficineDemandeFragment +
      Demande.DemandeFragment +
      Officine.OfficineFragment +
      TypeOfficine.TypeOfficineFragment +
      Utilisateur.UtilisateurFragment +
      Circonscription.CirconscriptionFragment;

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
            ...OfficineDemandeFragment
          }
        }
      }
  """ +
      OfficineDemande.OfficineDemandeFragment +
      Demande.DemandeFragment +
      Officine.OfficineFragment +
      TypeOfficine.TypeOfficineFragment +
      Utilisateur.UtilisateurFragment +
      Circonscription.CirconscriptionFragment;
}

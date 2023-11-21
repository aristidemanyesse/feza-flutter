import 'package:ipi/models/produitApp/Produit.dart';
import 'package:ipi/models/produitApp/TypeProduit.dart';

class ProduitSchema {
  static const String ALL = r"""
    query ($id: UUID, $codebarre: String, $name: String, $type: UUID) {
      searchProduit(
        deleted: false
        id: $id
        codebarre: $codebarre
        name_Icontains: $name
        type_Id: $type
      ) {
        results {
          ...ProduitFragment
        }
      }
    }
  """ +
      Produit.ProduitFragment +
      TypeProduit.TypeProduitFragment;

  static const String SPECIFIC_ALL = r"""
    query ($produits: [String]!) {
      searchProduits(produits: $produits) {
        id
          name
          description
          codebarre
          price
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
      """;
}

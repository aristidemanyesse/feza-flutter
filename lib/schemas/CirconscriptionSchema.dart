import 'package:ipi/models/officineApp/Circonscription.dart';

class CirconscriptionSchema {
  static const String ALL = r"""
    query ($id: UUID, $name: String) {
      searchCirconscription(
        deleted: false
        id: $id
        name: $name
      ) {
        results {
          ...CirconscriptionFragment
        }
      }
    }
  """ +
      Circonscription.CirconscriptionFragment;
}

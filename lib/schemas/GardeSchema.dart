import 'package:ipi/models/officineApp/Garde.dart';

class GardeSchema {
  static const String ALL = r"""
    query ($fin: CustomDate) {
      searchGarde(fin_Gte: $fin) {
        results {
          ...GardeFragment
        }
      }
    }
  """ +
      Garde.GardeFragment;
}

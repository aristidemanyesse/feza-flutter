class OfficineDeGardeSchema {
  static const String ALL = r"""
    query ($garde: UUID, $circonscription: UUID) {
      searchOfficineDeGarde(
        garde_Id: $garde
        officine_Circonscription_Id: $circonscription
      ) {
        results {
          ...OfficineDeGardeFragment
        }
      }
    }
  """;
}

class GardeSchema {
  static const String ALL = r"""
    query ($fin: CustomDate) {
      searchGarde(fin_Gte: $fin) {
        results {
          id
          debut
          fin
        }
      }
    }
  """;
}

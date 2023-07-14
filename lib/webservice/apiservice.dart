import 'package:graphql/client.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class ApiService {
  // static const BASE_URL = "http://192.168.0.100:8005/";
  // static const BASE_URL = "http://192.168.177.55:8005/";
  // static const BASE_URL = "http://192.168.170.55:8005/";
  static const BASE_URL = "http://192.168.1.45:8005/";
  // static const BASE_URL = "http://aristidemanyesse.pythonanywhere.com/";
  static const GRAPH_URL = BASE_URL + "graphql/";

  static Future<Map<String, dynamic>?> request(
      String query, Map<String, dynamic> variables) async {
    final HttpLink httpLink = HttpLink(GRAPH_URL);

    final GraphQLClient client = GraphQLClient(
      cache: GraphQLCache(),
      link: httpLink,
    );

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: variables,
    );

    final QueryResult result = await client.query(options);

    if (result.hasException) {
      print("Erreur Apiservice::::: ${result.exception.toString()}");
      return null;
    }
    return result.data;
  }
}

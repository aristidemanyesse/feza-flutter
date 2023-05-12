import 'package:graphql/client.dart';
import 'package:yebhofon/schemas/UtilisateurSchema.dart';
// ...
import 'package:graphql_flutter/graphql_flutter.dart';

const int nRepositories = 50;

final QueryOptions options = QueryOptions(
  document: gql(UtilisateurSchema.ALL),
  variables: <String, dynamic>{
    'nRepositories': nRepositories,
  },
);

// class ApiService {
//   static dynamic request(String request, Map<String, dynamic> variables) async {
//     try {
//       final _httpLink = HttpLink("http://192.168.1.14:8005/graphql/");
//       final GraphQLClient client = GraphQLClient(
//         cache: GraphQLCache(),
//         link: _httpLink,
//       );

//       final QueryOptions options = QueryOptions(
//         document: gql(UtilisateurSchema.ALL),
//         variables: variables,
//       );
//       final QueryResult result = await client.query(options);

//       if (result.hasException) {
//         print(result.exception.toString());
//       }
//       print(result.data);
//       // final List<dynamic> datas =
//       //     result.data?['viewer']['repositories']['nodes'] as List<dynamic>;
//     } catch (e) {
//       print("jhjh $e");
//     }
//   }
// }

class ApiService {
  // static const BASE_URL = "http://192.168.43.117:8005/";
  static const BASE_URL = "http://192.168.1.39:8005/";
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
      print(result.exception.toString());
      return null;
    }
    return result.data;
  }
}

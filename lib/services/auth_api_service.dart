import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthApiService {
  // authentification
  Future getAuth(Map loginType) async {
    // url de l'API
    Uri url = Uri.parse('https://api.escuelajs.co/api/v1/auth/login');

    // requête/réponse HTTP
    http.Response response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(loginType),
    );

    // tester le statut 200
    if (response.statusCode == 200) {
      // décoder les données en JSON
      Map<String, String> data = jsonDecode(response.body);

      return data;
    }

    // renvoyer une erreur
    throw Error();
  }
}

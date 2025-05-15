import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store/models/category.dart';

class CategoryApiService {
  // récupérer toutes les catégories
  // Future : équivalent des promesses JS
  Future<List<Category>> getCategories() async {
    // url de l'API
    Uri url = Uri.parse('https://api.escuelajs.co/api/v1/categories');

    // requête/réponse HTTP
    http.Response response = await http.get(url);

    // tester le statut 200
    if (response.statusCode == 200) {
      // décoder les données en JSON
      List data = jsonDecode(response.body);

      // renvoyer les données formatées avec les modèles
      return data.map((category) {
        return Category(
          id: category['id'],
          name: category['name'],
          slug: category['slug'],
          image: category['image'],
        );
      }).toList();
    }

    // renvoyer une erreur
    throw Error();
  }
}

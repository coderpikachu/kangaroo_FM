import 'meals.dart';
import 'package:http/http.dart' as http;

Future<List<Meals>> fetchMeals() async {
  String url = "http://10.0.2.2/products/products.php";
  final response = await http.post(url, body: {'action': "GET_ALL"});
  return mealsFromJson(response.body);
}

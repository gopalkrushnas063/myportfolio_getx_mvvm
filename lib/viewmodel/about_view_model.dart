// viewmodel/about_view_model.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:myportfolio_getx_mvvm/model/about_model.dart';
import 'dart:convert';


class AboutViewModel extends GetxController {
  var isLoading = true.obs;
  var aboutModel = AboutModel(
    position: '',
    name: '',
    about: '',
    dob: '',
    webUrl: '',
    degree: '',
    address: '',
    age: '',
    email: '',
    phone: '',
    github: '',
    percentageTechStack: [],
    education: [],
    experience: [],
  ).obs;

  @override
  void onInit() {
    fetchAboutData();
    super.onInit();
  }

  void fetchAboutData() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse("https://gopalkrushnas063.github.io/portfolio_json/about.json"));
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        print(jsonResponse);
        aboutModel(AboutModel.fromJson(jsonResponse[0]));
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print('Exception occurred: $e');
    } finally {
      isLoading(false);
    }
  }
}

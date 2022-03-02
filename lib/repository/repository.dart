import 'dart:convert';
import 'package:http/http.dart';
import 'package:cats_demo_project/models/cat_model.dart';

class Repositories {
  static Future<List<CatModel>> getCats() async {
    try {
      print("HHH=> reqused started");
      Uri uri = Uri.parse("https://api.thecatapi.com/v1/images/search?limit=80&mime_types=&order=Random&size=small&page=3&sub_id=demo-ce06ee");

      Response response = await get(uri);

      List<CatModel> catModelList = [];

      if (response.statusCode == 200) {
        print("HHH => got data");
        var jsonResponse = jsonDecode(response.body);

        for (var u in jsonResponse) {
          List<Category> categories = [];

          if (u['categories'] != null) {
            print("hhh ==> Categories are not null");
            var cat = u['categories'];
            for (var categoryFromList in cat) {
              Category category = Category(
                  id: categoryFromList['id'],
                  name: categoryFromList['name'],
              );
              categories.add(category);
            }

            //print("HHH ==> Name: ${cat['name']}");
            // categories = Categories(
            //   id: cat['id'],
            //   name: cat['name'],
            // );
          }

          CatModel catModel = CatModel(
            url: u['url'],
            categories: categories,
          );
          //print("HHH=> Each from List: url: ${catModel.url}, ${catModel.categories[0].name}");
          catModelList.add(catModel);

        }
        print("HHH=> List Length: ${catModelList.length}");
        return catModelList;

      } else {
        print("HHH=> Empty List!");
        return [];
      }
    } catch(e) {
      print("Exception: $e");
      return [];
    }

  }
}
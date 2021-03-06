import 'dart:convert';

import 'package:news_app/models/articleModel.dart';
import 'package:http/http.dart' as http;

class News{

  List <ArticleModel> news =[];
  Future<void> getNews() async{
    String url="http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=bfb12d8bd8434abab2cf8e471b45770c";

    var response =await http.get(url);
    var jsonData =jsonDecode(response.body);

    if (jsonData["status"]=="ok"){


      jsonData["articles"].forEach((element){

        if (element["urlToImage"] != null && element["description"] != null){
          print(jsonData["urlToImage"]);
          ArticleModel articleModel =ArticleModel(
            title: element["title"],
            author:element["author"],
            description: element["description"],
            urlToImage: element["urlToImage"],
            url: element["url"]

          );
          news.add(articleModel);
        }

      });
    }


  }

}
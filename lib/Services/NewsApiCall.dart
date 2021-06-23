import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kaplas_intern_project/Constants/Strings/Strings.dart';
import 'package:kaplas_intern_project/Modals/NewsInfoModal.dart';

class apiCall {

  Future<NewsModel> getNews() async{

    var url = Uri.parse(Strings().newsApi);

    var client = http.Client();

    try {
      var response = await client.get(url);

      //print(response.body);

      if(response.statusCode == 200)
      {
        var jsonString = response.body;

        print(response.body);

        //print(jsonString);

        print(json.decode(jsonString));

        //final NewsModel newsModel = newsModelFromJson(jsonString);
        final NewsModel newsModel = NewsModel.fromJson(json.decode(jsonString));

        //var jsonMap = json.decode(jsonString);

        //print("JsonMap is \n ${jsonMap}");

        //newsModel = newsModelFromJson(jsonMap);

        return newsModel;
      }
      else
        {

          print('Failed to call');

          return NewsModel(
              status: '',
              statusCode: 200,
              version: '',
              lastModified: '',
              access: '',
              total: 0,
              limit: 0,
              offset: 0,
              data: []
          );
        }
      //print(newsModal);

    }
    catch(e)
    {
      print('The error was ' + e.toString());

      return NewsModel(
          status: '',
          statusCode: 200,
          version: '',
          lastModified: '',
          access: '',
          total: 0,
          limit: 0,
          offset: 0,
          data: []
      );
    }

    //print(newsModal);

    //return newsModal;

  }


}
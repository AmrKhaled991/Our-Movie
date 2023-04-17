
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/data/modelotp/GenrResponse.dart';
import 'package:movies/data/modelotp/Recomedresponce.dart';
import 'package:movies/data/modelotp/SearchRESPONSE.dart';
import 'package:movies/data/modelotp/SimilarResponse.dart';


import '../modelotp/FilmResponce.dart';
import '../modelotp/ListGenerdResponce.dart';
import '../modelotp/NewResponse.dart';
import '../modelotp/PopulerRespondse.dart';


class Apimanger{

  static String baseurl='api.themoviedb.org';
   Future<Recomedresponce> getrecommendedfilms()async{
     var uri=Uri.https(baseurl,'/3/movie/top_rated',{
    'api_key':'77f2704769cfceadbda8f57811c751e7'
     }
     );
     var response=await http.get(uri);
     var body =response.body;
      var res=jsonDecode(body);
        var recommendres=Recomedresponce.fromJson(res);
        return recommendres;
   }
   Future<NewResponse> getreNewfilms()async{
     var uri=Uri.https(baseurl,'/3/movie/latest',{
    'api_key':'77f2704769cfceadbda8f57811c751e7'
     }
     );
     var response=await http.get(uri);
     var body =response.body;
      var res=jsonDecode(body);
        var recommendres=NewResponse.fromJson(res);
        return recommendres;
   }
   Future<PopulerRespondse> getrepopularfilms()async{
     var uri=Uri.https(baseurl,'3/movie/popular',{
    'api_key':'77f2704769cfceadbda8f57811c751e7'
     }
     );
     var response=await http.get(uri);
     var body =response.body;
      var res=jsonDecode(body);
        var recommendres=PopulerRespondse.fromJson(res);
        return recommendres;
   }
   Future<GenrResponse> getGenrResponse()async{
     var uri=Uri.https(baseurl,'/3/genre/movie/list',{
    'api_key':'77f2704769cfceadbda8f57811c751e7'
     }
     );
     var response=await http.get(uri);
     var body =response.body;
      var res=jsonDecode(body);
        var geners=GenrResponse.fromJson(res);
        return geners;
   }
   Future<FilmResponce> getfilm(num id)async{
  var uri=Uri.https(baseurl,'3/movie/$id',{
    'api_key':'77f2704769cfceadbda8f57811c751e7'
  }
  );
  var response=await http.get(uri);
  var body =response.body;
  var res=jsonDecode(body);
  var film=FilmResponce.fromJson(res);
  return film;
}
Future<SimilarResponse> getsimilarfilm(num id)async{
  var uri=Uri.https(baseurl,'3/movie/$id/similar',{
    'api_key':'77f2704769cfceadbda8f57811c751e7'
  }
  );
  var response=await http.get(uri);
  var body =response.body;
  var res=jsonDecode(body);
  var similar=SimilarResponse.fromJson(res);
  return similar;
}Future<ListGenerdResponce> getgenersfilm(num id)async{
  var uri=Uri.https(baseurl,'3/discover/movie',{
    'api_key':'77f2704769cfceadbda8f57811c751e7',
    'with_genres': '${id}',
    }
  );
  var response=await http.get(uri);
  var body =response.body;
  var res=jsonDecode(body);
  var similar=ListGenerdResponce.fromJson(res);
  return similar;
}
Future<SearchResponse> getsearch(String key)async{
  var uri=Uri.https(baseurl,'3/search/movie',{
    'api_key':'77f2704769cfceadbda8f57811c751e7',
    'query': key
    }
  );
  var response=await http.get(uri);
  var body =response.body;
  var res=jsonDecode(body);
  var search=SearchResponse.fromJson(res);
  return search;
}
}
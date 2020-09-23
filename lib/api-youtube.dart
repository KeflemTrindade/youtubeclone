import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:youtube_app_clone/model/video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyBYk86SDDatiWFvYisk6KRIvRQWckrcxT0";
const ID_CANAL = "UC7aeWsF9o1OSaqGaiOWAkCw";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  pesquisar(String pesquisa) async {
    http.Response response = await http.get(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa");

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>(
        (map) {
        return Video.fromJson(map);
        //return Video.converterJson(map);
      });

      print("Resultado: " + dadosJson["items"][0]["id"]["videoId"].toString());
    }
  }
}

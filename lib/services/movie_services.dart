import 'dart:convert';

import 'package:movlix/models/cast_response.dart';
import 'package:movlix/models/detail_response.dart';
import 'package:movlix/models/fetch_response.dart';
import 'package:movlix/shared/constants.dart';
import 'package:http/http.dart' as http;

class MovieServices {
  Future<FetchResponse?> getTopRated() async {
    try {
      var url = baseUrl + 'movie/top_rated';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> getPopular() async {
    try {
      var url = baseUrl + 'movie/popular';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> getComingSoon() async {
    try {
      var url = baseUrl + 'movie/upcoming';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> getNowPlaying() async {
    try {
      var url = baseUrl + 'movie/now_playing';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> searchMovie({
    String search = ""
  }) async {
    try {
      var url = baseUrl + 'search/movie?query='+ (search == "" ? "a" : search);
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<DetailResponse?> getMovieDetail({
    required String id,
  }) async {
    try {
      var url = baseUrl + 'movie/$id';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return DetailResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<FetchResponse?> getMovieRecommendations({
    required String id,
  }) async {
    try {
      var url = baseUrl + 'movie/$id/recommendations';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return FetchResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }

  Future<CastResponse?> getMovieCasts({
    required String id,
  }) async {
    try {
      var url = baseUrl + 'movie/$id/credits';
      var response = await http.get(Uri.parse(url), headers: {
        "Authorization": token,
      });

      if (response.body.isEmpty) return null;
      if (response.statusCode != 200) return null;
      var decoded = jsonDecode(response.body);

      return CastResponse.fromJson(decoded);
    } catch (e) {
      return null;
    }
  }
}
import 'dart:convert';

import 'package:ex_showtime/model/genres_model.dart';
import 'package:http/http.dart';

class MovieRepository {
  final client = Client();

  static const String baseUrl = 'api.themoviedb.org';

  static const String apiKey = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYTg1OTFjN2U0YzVjYWVjYjRlMDhhNzI3ODA2YWYxOSIsInN1YiI6IjY1OGQyYThmNTVjMWY0NjFkNDM5YTM3ZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.t7K3U8egkt_gYmvaCGC9Hdc9OjDRzLtl0l4XA3i1_o4';

  Future<List<GenresModel>> getGenresList() async {
    final headers = {'Authorization': 'Bearer $apiKey'};

    final apiUrl = Uri.https(
      baseUrl, '/3/genre/movie/list', {'language': 'ko-KR', 'region': 'KR',}
    );

    final Response response = await client.get(apiUrl, headers: headers);

    final responseBody = jsonDecode(response.body) as Map<String, dynamic>;

    final List<GenresModel> genresList = [];

    for (var genresJson in responseBody['genres']) {
      genresList.add(GenresModel.fromJson(genresJson as Map<String, dynamic>));
    }

    return genresList;
  }
}
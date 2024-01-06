import 'package:ex_showtime/model/genres_model.dart';
import 'package:ex_showtime/repository/movie_repository.dart';
import 'package:flutter/cupertino.dart';

class MainTabProvider extends ChangeNotifier {
  final MovieRepository movieRepository;

  MainTabProvider({required this.movieRepository});

  List<GenresModel> genreList = [];

  Future<void> updataGenrnList() async {
    genreList = await movieRepository.getGenresList();
    print(genreList.length);
    notifyListeners();
  }
}
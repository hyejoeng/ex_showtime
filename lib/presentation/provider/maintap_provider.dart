import 'package:ex_showtime/model/genres_model.dart';
import 'package:ex_showtime/repository/movie_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainTabProvider extends ChangeNotifier {
  final MovieRepository movieRepository;

  late PageController mainTabController;

  MainTabProvider({required this.movieRepository, required this.mainTabController});

  List<GenresModel> genreList = [];

  Future<void> updataGenrnList() async {
    genreList = await movieRepository.getGenresList();
    notifyListeners();
  }

  Future<void> updataTopRateMovieList() async {

  }

  void changeTabPosition(int index) {
    mainTabController.jumpToPage(index);
    notifyListeners();
  }
}
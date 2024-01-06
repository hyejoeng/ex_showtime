import 'package:ex_showtime/presentation/provider/maintap_provider.dart';
import 'package:ex_showtime/presentation/screens/maintabscreen.dart';
import 'package:ex_showtime/repository/movie_repository.dart';
import 'package:flutter/material.dart';

void main() {
  final mainTabProvider = MainTabProvider(movieRepository: MovieRepository());

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home: MainTabScreen(
    mainTabProvider: mainTabProvider,
  )));
}

import 'package:flutter/material.dart';
import 'package:movies_consumer/models/model_movie.dart';
import 'package:movies_consumer/widgets/swiper.dart';

class CardSwaper extends StatelessWidget {
  late List<Movie> lstMovieSwaper = List.empty();
  CardSwaper(
    List<Movie> listMovie, {
    Key? key,
  }) : super(key: key) {
    lstMovieSwaper = listMovie;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: double.infinity,
        height: size.height * 0.5,
        color: Colors.yellow,
        child: Column(children: [SwiperWidget(lstMovieSwaper)]));
  }
}

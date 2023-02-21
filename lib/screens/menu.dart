import 'package:flutter/material.dart';
import 'package:movies_consumer/providers/movie_provider.dart';
import 'package:movies_consumer/widgets/card_swaper.dart';
import 'package:movies_consumer/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listMoviePlaying = Provider.of<MoviesProvider>(context);

    print("Now Movies ${listMoviePlaying.onListMovie}");
    print("Population ${listMoviePlaying.onListMoviePopulation}");

    return Scaffold(
        appBar: AppBar(
          title: const Text("Movie Consumer"),
          elevation: 2,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CardSwaper(listMoviePlaying.onListMovie),
              MovieSlider(listMoviePlaying.onListMoviePopulation)
            ],
          ),
        ));
  }
}

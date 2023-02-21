import 'package:flutter/material.dart';
import 'package:movies_consumer/providers/movie_provider.dart';
import 'package:movies_consumer/widgets/card_swaper.dart';
import 'package:movies_consumer/widgets/movie_slider.dart';
import 'package:provider/provider.dart';

class MenuPage extends StatelessWidget {
  MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieProvider= Provider.of<MoviesProvider>(context);

    print("Now Movies ${movieProvider.onListMovie}");
    print("Population ${movieProvider.onListMoviePopulation}");

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
              CardSwaper(movieProvider.onListMovie),
              MovieSlider(movieProvider.onListMoviePopulation, () =>{
                print("ON CALLBACK"),
                movieProvider.getPopulationMovies()
              },title: "POPULARES",)
            ],
          ),
        ));
  }
}

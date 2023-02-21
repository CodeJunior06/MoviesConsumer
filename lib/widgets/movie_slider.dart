import 'package:flutter/material.dart';
import 'package:movies_consumer/models/model_movie.dart';
import 'package:movies_consumer/routes/app_route.dart';

class MovieSlider extends StatelessWidget {
  late List<Movie> lstMoviesPopulation = List.empty();
  MovieSlider(this.lstMoviesPopulation, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.41,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
            padding: EdgeInsets.all(10),
            child: Text("POPULARES",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: lstMoviesPopulation.length,
            itemBuilder: (context, index) {
              return _MoviePoster(lstMoviesPopulation[index]);
            },
          ),
        )
      ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Movie movie;
  const _MoviePoster(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: 150,
      height: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(children: [
        GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.INFORMATION),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    image: NetworkImage(movie.completeURImage),
                    width: double.infinity,
                    height: size.height * 0.25,
                    fit: BoxFit.fill))),
        const SizedBox(height: 5),
        Text(
          movie.title,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: size.width * 0.03),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_consumer/models/model_movie.dart';
import 'package:movies_consumer/routes/app_route.dart';

class MovieSlider extends StatefulWidget {
  late List<Movie> lstMoviesPopulation = List.empty();
  late Function onNextPage;
  final String title;
  MovieSlider(this.lstMoviesPopulation,Function onNext, {Key? key, required this.title}) : super(key: key){
    onNextPage = onNext;
  }

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {



final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      
      print(scrollController.position.pixels);
      print(scrollController.position.maxScrollExtent);

      if( scrollController.position.pixels >= scrollController.position.maxScrollExtent-500){
          widget.onNextPage();
      }

    });

  }

  @override
  void dispose() {
    


    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.41,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
         Padding(
            padding: EdgeInsets.all(10),
            child: Text(widget.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold))),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: widget.lstMoviesPopulation.length,
            itemBuilder: (context, index) {
              return _MoviePoster(widget.lstMoviesPopulation[index]);
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
            onTap: () => Navigator.pushNamed(context, Routes.INFORMATION,arguments: movie),
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

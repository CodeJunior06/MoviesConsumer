import 'package:flutter/material.dart';
import 'package:movies_consumer/models/model_movie.dart';
import 'package:movies_consumer/widgets/casting_cards.dart';

// ignore: must_be_immutable
class InformationPage extends StatelessWidget {
  InformationPage({Key? key}) : super(key: key);
  late Movie movie;
  @override
  Widget build(BuildContext context) {
    movie = ModalRoute.of(context)?.settings.arguments as Movie;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(movie),
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(movie),
          _Overiew(movie),
          _Overiew(movie),
          _Overiew(movie),
           CastingCards(movie.id)
        ]))
      ],
    ));
  }
}

// ignore: must_be_immutable
class _CustomAppBar extends StatelessWidget {
  Movie movie;
  _CustomAppBar(this.movie, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      backgroundColor: Colors.blueGrey,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            child: Text(
              movie.title,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            )),
        background: FadeInImage(
          placeholder: const AssetImage("assets/loading.gif"),
          image: NetworkImage(movie.completeURImageBackground),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  Movie movie;
  _PosterAndTitle(this.movie);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(20),
            child: FadeInImage(
              image: NetworkImage(movie.completeURImage),
              placeholder: const AssetImage("assets/no-image.jpg"),
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(movie.originalTitle,
                    style: Theme.of(context).textTheme.subtitle1,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2),
                Row(
                  children: [
                    const Icon(
                      Icons.star_outline,
                      size: 15,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      movie.voteAverage.toString(),
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overiew extends StatelessWidget {
  Movie movie;
  _Overiew(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Text(
          movie.overview,
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.justify,
        ));
  }
}

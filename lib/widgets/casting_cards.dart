import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_consumer/models/model_person.dart';
import 'package:movies_consumer/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  int movieId;
  CastingCards(this.movieId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final movieProvider = Provider.of<MoviesProvider>(context, listen: false);

    return FutureBuilder(
        future: movieProvider.getOndisplayAuthor(movieId),
        builder: (_, AsyncSnapshot<List<Person>> AsyncSnapshot) {
          if (!AsyncSnapshot.hasData) {
            return Container(
              constraints: BoxConstraints(maxWidth: 350),
              height: 180,
              child: CupertinoActivityIndicator(),
            );
          }

          final List<Person> lstAuthor = AsyncSnapshot.data!;

          return Container(
              margin: const EdgeInsets.only(bottom: 30),
              width: double.infinity,
              height: 180,
              color: Colors.red,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const _CastCard();
                  }));
        });
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: 110,
      height: 100,
      color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              image: NetworkImage("https://via.placeholder.com/300x400"),
              placeholder: AssetImage("assets/splash.png"),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "actor.name djshdisdhsidhsi",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

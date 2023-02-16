import 'package:flutter/material.dart';
import 'package:movies_consumer/widgets/casting_cards.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* final String movie =
        ModalRoute.of(context)?.settings.toString() ?? 'XXXXXXX';*/

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          _PosterAndTitle(),
          const _Overiew(),
          const _Overiew(),
          const CastingCards()
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      backgroundColor: Colors.blueGrey,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            child: const Text(
              'Movie_Title',
              style: TextStyle(fontSize: 16),
            )),
        background: const FadeInImage(
          placeholder: AssetImage("assets/loading.gif"),
          image: NetworkImage("https://via.placeholder.com/300x400"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(20),
            child: const FadeInImage(
              image: NetworkImage("https://via.placeholder.com/300x400"),
              placeholder: AssetImage("assets/splash.png"),
              height: 150,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "movie-title",
                style: Theme.of(context).textTheme.headline5,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text("movie-originalText",
                  style: Theme.of(context).textTheme.subtitle1,
                  overflow: TextOverflow.ellipsis),
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
                    'movie-voteAverage',
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overiew extends StatelessWidget {
  const _Overiew({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Text(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas condimentum sit amet enim et eleifend. Etiam dignissim ac massa non auctor. Vestibulum placerat iaculis sollicitudin. Praesent varius luctus mauris id venenatis. Morbi mauris lectus, vehicula vitae enim id, ornare euismod odio. Morbi non urna sollicitudin, condimentum tellus ut, volutpat risus. Suspendisse ut diam ac leo porta elementum at nec mauris. Aenean eleifend lorem massa, et tincidunt metus scelerisque vel. Ut ac tempus purus, ornare bibendum magna. Mauris ultricies consectetur libero at sollicitudin. Phasellus elementum mauris quis nisi pharetra vestibulum. Etiam magna nisl, porta id pharetra sit amet",
          style: Theme.of(context).textTheme.subtitle1,
          textAlign: TextAlign.justify,
        ));
  }
}

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:movies_consumer/models/model_movie.dart';
import 'package:movies_consumer/routes/app_route.dart';

class SwiperWidget extends StatelessWidget {
  List<Movie> listNewMovie;
  SwiperWidget(this.listNewMovie, {super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
      child: Swiper(
        itemCount: listNewMovie.length,
        layout: SwiperLayout.STACK,
        itemHeight: size.height * 0.4,
        itemWidth: size.width * 0.5,
        itemBuilder: (_, int index) {
          //print("URL: ${listNewMovie[index].completeURImage}");

          return GestureDetector(
              onTap: () => Navigator.pushNamed(context, Routes.INFORMATION),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage(
                      placeholder: const AssetImage("assets/not_image.png"),
                      image: NetworkImage(listNewMovie[index].completeURImage),
                      fit: BoxFit.cover)));
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../routes/app_route.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

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
            itemCount: 20,
            itemBuilder: (context, index) {
              return _MoviePoster();
            },
          ),
        )
      ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  const _MoviePoster({Key? key}) : super(key: key);

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
                    placeholder: AssetImage('assets/splash.png'),
                    image: NetworkImage('https://via.placeholder.com/300x400'),
                    width: double.infinity,
                    height: size.height * 0.25,
                    fit: BoxFit.fill))),
        const SizedBox(height: 5),
      
          Text(
            "WPOSS - El Sueño Eterno Y Maldito con caja",
            style: TextStyle(fontWeight: FontWeight.w400,fontSize: size.width * 0.03),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
      ]),
    );
  }
}

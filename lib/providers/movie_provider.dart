import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;
import 'package:movies_consumer/models/model_movie.dart';
import 'package:movies_consumer/models/model_now_playing.dart';
import 'package:movies_consumer/models/model_population.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKkey = "017d6514d84465bf0f3a4ddf76bf25e2";
  final String _language = "es-ES";

  final String _baseURL = "api.themoviedb.org";
  final String _endPointNewMovies = "3/movie/now_playing";
  final String _endPointPopulation = "3/movie/popular";

  List<Movie> onListMovie = <Movie>[];
  List<Movie> onListMoviePopulation = <Movie>[];

  MoviesProvider() {
    print("Movies Provider inicializando");

    getOnDisplayNewMovie()
        .then(
            (value) => onListMovie = NowPlayingModel.fromRawJson(value).results)
        .whenComplete(() => {notifyListeners()});

    getOnDisplayPopulationMovies()
        .then((value) => onListMoviePopulation =
            PopularResponse.popularResponseFromJson(value).results)
        .whenComplete(() => notifyListeners());

    print("FINISH METHOD");
  }

  Future<String> getOnDisplayNewMovie() async {
    print("Get On Display New Movies");

    var url = Uri.https(_baseURL, _endPointNewMovies,
        {"api_key": _apiKkey, "language": _language, "page": "1"});
    var response = await http.get(url);
    return response.body;
  }

  Future<String> getOnDisplayPopulationMovies() async {
    print("Get On Display Population Movies");

    var url = Uri.https(_baseURL, _endPointPopulation,
        {"api_key": _apiKkey, "language": _language, "page": "1"});
    var response = await http.get(url);
    return response.body;
  }
}

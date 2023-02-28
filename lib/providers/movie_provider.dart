import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;
import 'package:movies_consumer/models/model_actor.dart';
import 'package:movies_consumer/models/model_movie.dart';
import 'package:movies_consumer/models/model_now_playing.dart';
import 'package:movies_consumer/models/model_person.dart';
import 'package:movies_consumer/models/model_population.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKkey = "017d6514d84465bf0f3a4ddf76bf25e2";
  final String _language = "es-ES";

  final String _baseURL = "api.themoviedb.org";
  final String _endPointNewMovies = "3/movie/now_playing";
  final String _endPointPopulation = "3/movie/popular";

  List<Movie> onListMovie = <Movie>[];
  List<Movie> onListMoviePopulation = <Movie>[];

  Map<int,List<Person>> movieAuthor = {};

  int _incrementMovie = 0;

  MoviesProvider() {
    print("Movies Provider inicializando");

    getOnDisplayNewMovie()
        .then(
            (value) => onListMovie = NowPlayingModel.fromRawJson(value).results)
        .whenComplete(() => {notifyListeners()});

      getPopulationMovies();
  }

  Future<String> getOnDisplayNewMovie() async {
    var response = await http.get(_preparePetition(_endPointNewMovies));
    return response.body;
  }

  Future<String> getOnDisplayPopulationMovies() async {
    _incrementMovie++;
    var response = await http
        .get(_preparePetition(_endPointPopulation, page: _incrementMovie));
    return response.body;
  }

  Uri _preparePetition(String endPoint, {int page = 1}) {
    return Uri.https(_baseURL, endPoint,
        {"api_key": _apiKkey, "language": _language, "page": page.toString()});
  }

  void getPopulationMovies(){
     getOnDisplayPopulationMovies()
        .then((value) => onListMoviePopulation = [
              ...onListMoviePopulation,
              ...PopularResponse.popularResponseFromJson(value).results
            ])
        .whenComplete(() => notifyListeners());
  }

  Future<List<Person>> getOndisplayAuthor(movieId) async {
    var response = await http.get( _preparePetition("3/movie/{$movieId}/credits",page: 1));
    final responseAuthor = ActorResponse.actorResponseFromJson( response.body);

    movieAuthor[movieId] = responseAuthor.cast;
    return responseAuthor.cast;
  }
}

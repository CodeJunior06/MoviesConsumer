
import 'dart:convert';

import 'package:movies_consumer/models/model_person.dart';

class ActorResponse {


    ActorResponse({
        required this.id,
        required this.cast,
        required this.crew,
    });

    int id;
    List<Person> cast;
    List<Person> crew;
    
    factory ActorResponse.fromJson(Map<String, dynamic> json) => ActorResponse(
        id: json["id"],
        cast: List<Person>.from(json["cast"].map((x) => Person.fromJson(x))),
        crew: List<Person>.from(json["crew"].map((x) => Person.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "cast": List<dynamic>.from(cast.map((x) => x.toJson())),
        "crew": List<dynamic>.from(crew.map((x) => x.toJson())),
    };
    
    ActorResponse actorResponseFromJson(String str) => ActorResponse.fromJson(json.decode(str));

String actorResponseToJson(ActorResponse data) => json.encode(data.toJson());
}



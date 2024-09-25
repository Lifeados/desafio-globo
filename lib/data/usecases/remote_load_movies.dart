import 'package:desafio_globo/domain/entity/episode.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RemoteLoadMovies {
  Future<EpisodeResult?> load() async {
    final url = Uri.parse(
      'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=1&sort_by=popularity.desc',
    );

    final response = await http.get(
      url,
      headers: {
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI3MTUwNGI0YjY0OGMwMGUwNGZlMDUzYWY2YmYxZTI5OCIsIm5iZiI6MTcyNTI4OTIyNS40MTY4NzYsInN1YiI6IjY2YzUxMjZlNDZkYzkyN2M3ZGQxMGY1YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JeBfyUi8bnusSrEJn0epO3d5KNyumR7A1nYq6qJuYoI'
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return EpisodeResult.fromMap(jsonResponse, EpisodeType.movie);
    } else {
      return throw Exception('Houve um problema');
    }
  }
}

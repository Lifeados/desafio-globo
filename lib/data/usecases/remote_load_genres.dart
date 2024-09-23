import 'package:desafio_globo/domain/entity/genres.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class RemoteLoadGenres {
  Future<GenresResult?> load() async {
    final url =
        Uri.parse('https://api.themoviedb.org/3/genre/movie/list?language=en');

    final response = await http.get(url, headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYzZiNDY2ZjY0MDcxMmM5ZTlmNWUwYTA0NWFkOTIxMiIsIm5iZiI6MTcyMzc1ODc4Mi43MTkwNjMsInN1YiI6IjY2YmU3NmU5NzQ2MzA2YTkwYzk3OWI2MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CbfEDQm5NJobGsz4uJKJ-Csxgv1dlq_ptVZYW_FWS80'
    });
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map;
      return GenresResult.fromMap(jsonResponse);
    } else {
      return null;
    }
  }
}

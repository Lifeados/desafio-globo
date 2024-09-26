import 'dart:convert' as convert;

import 'package:desafio_globo/domain/entity/episode.dart';
import 'package:http/http.dart' as http;

class RemoteLoadTVShow {
  Future<EpisodeResult?> load() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=en-US&page=1&sort_by=popularity.desc');

    final response = await http.get(url, headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkYzZiNDY2ZjY0MDcxMmM5ZTlmNWUwYTA0NWFkOTIxMiIsIm5iZiI6MTcyMzc1ODc4Mi43MTkwNjMsInN1YiI6IjY2YmU3NmU5NzQ2MzA2YTkwYzk3OWI2MyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CbfEDQm5NJobGsz4uJKJ-Csxgv1dlq_ptVZYW_FWS80'
    });
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return EpisodeResult.fromMap(jsonResponse, EpisodeType.tvShow);
    } else {
      return null;
    }
  }
}

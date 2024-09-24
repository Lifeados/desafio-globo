class EpisodeResult {
  final int? page;
  final int? totalPages;
  final int? totalResults;
  final List<Episode>? results;

  EpisodeResult({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.results,
  });

  factory EpisodeResult.fromMap(
      Map<String, dynamic> json, EpisodeType episodeType) {
    return EpisodeResult(
      page: json['page'],
      results: (json['results'] as List<dynamic>)
          .map(
            (episode) =>
                Episode.fromMap(episode as Map<String, dynamic>, episodeType),
          )
          .toList(),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}

class Episode {
  final String? title;
  final String? name;
  final String? originalTitle;
  final String? originalName;
  final String? overview;
  final String? firstAirDate;
  final String? releaseDate;
  final String? posterPath;
  final EpisodeType episodeType;

  Episode({
    required this.title,
    required this.name,
    required this.originalTitle,
    required this.originalName,
    required this.overview,
    required this.firstAirDate,
    required this.releaseDate,
    required this.posterPath,
    required this.episodeType,
  });

  factory Episode.fromMap(Map<String, dynamic> json, EpisodeType episodeType) {
    return Episode(
      title: json['title'],
      name: json['name'],
      originalTitle: json['original_title'],
      originalName: json['original_name'],
      overview: json['overview'],
      firstAirDate: json['first_air_date'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
      episodeType: episodeType,
    );
  }

  String get fullImageUrl {
    return 'https://image.tmdb.org/t/p/w400${posterPath ?? ''}';
  }
}

enum EpisodeType {
  movie,
  tvShow,
}

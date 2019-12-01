// To parse this JSON data, do
//
//     final TMDBMovieModel = TMDBMovieModelFromJson(jsonString);

import 'dart:convert';

class TMDBModel {
    int page;
    List<TMDBMovieModel> results;
    int totalPages;
    int totalResults;

    TMDBModel({
        this.page,
        this.results,
        this.totalPages,
        this.totalResults,
    });

    factory TMDBModel.fromJson(String str) => TMDBModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TMDBModel.fromMap(Map<String, dynamic> json) => TMDBModel(
        page: json["page"] == null ? null : json["page"],
        results: json["results"] == null ? null : List<dynamic>.from(json["results"].map((x) => x)),
        totalPages: json["total_pages"] == null ? null : json["total_pages"],
        totalResults: json["total_results"] == null ? null : json["total_results"],
    );

    Map<String, dynamic> toMap() => {
        "page": page == null ? null : page,
        "results": results == null ? null : List<dynamic>.from(results.map((x) => x)),
        "total_pages": totalPages == null ? null : totalPages,
        "total_results": totalResults == null ? null : totalResults,
    };
}






class TMDBMovieModel {
    bool adult;
    String backdropPath;
    dynamic belongsToCollection;
    int budget;
    List<Genre> genres;
    String homepage;
    int id;
    String imdbId;
    String originalLanguage;
    String originalTitle;
    String overview;
    double popularity;
    dynamic posterPath;
    List<ProductionCompany> productionCompanies;
    List<ProductionCountry> productionCountries;
    DateTime releaseDate;
    int revenue;
    int runtime;
    List<SpokenLanguage> spokenLanguages;
    String status;
    String tagline;
    String title;
    bool video;
    double voteAverage;
    int voteCount;

    TMDBMovieModel({
        this.adult,
        this.backdropPath,
        this.belongsToCollection,
        this.budget,
        this.genres,
        this.homepage,
        this.id,
        this.imdbId,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.productionCountries,
        this.releaseDate,
        this.revenue,
        this.runtime,
        this.spokenLanguages,
        this.status,
        this.tagline,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount,
    });

    factory TMDBMovieModel.fromJson(String str) => TMDBMovieModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TMDBMovieModel.fromMap(Map<String, dynamic> json) => TMDBMovieModel(
        adult: json["adult"] == null ? null : json["adult"],
        backdropPath: json["backdrop_path"] == null ? null : json["backdrop_path"],
        belongsToCollection: json["belongs_to_collection"],
        budget: json["budget"] == null ? null : json["budget"],
        genres: json["genres"] == null ? null : List<Genre>.from(json["genres"].map((x) => Genre.fromMap(x))),
        homepage: json["homepage"] == null ? null : json["homepage"],
        id: json["id"] == null ? null : json["id"],
        imdbId: json["imdb_id"] == null ? null : json["imdb_id"],
        originalLanguage: json["original_language"] == null ? null : json["original_language"],
        originalTitle: json["original_title"] == null ? null : json["original_title"],
        overview: json["overview"] == null ? null : json["overview"],
        popularity: json["popularity"] == null ? null : json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: json["production_companies"] == null ? null : List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromMap(x))),
        productionCountries: json["production_countries"] == null ? null : List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromMap(x))),
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        revenue: json["revenue"] == null ? null : json["revenue"],
        runtime: json["runtime"] == null ? null : json["runtime"],
        spokenLanguages: json["spoken_languages"] == null ? null : List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromMap(x))),
        status: json["status"] == null ? null : json["status"],
        tagline: json["tagline"] == null ? null : json["tagline"],
        title: json["title"] == null ? null : json["title"],
        video: json["video"] == null ? null : json["video"],
        voteAverage: json["vote_average"] == null ? null : json["vote_average"].toDouble(),
        voteCount: json["vote_count"] == null ? null : json["vote_count"],
    );

    Map<String, dynamic> toMap() => {
        "adult": adult == null ? null : adult,
        "backdrop_path": backdropPath == null ? null : backdropPath,
        "belongs_to_collection": belongsToCollection,
        "budget": budget == null ? null : budget,
        "genres": genres == null ? null : List<dynamic>.from(genres.map((x) => x.toMap())),
        "homepage": homepage == null ? null : homepage,
        "id": id == null ? null : id,
        "imdb_id": imdbId == null ? null : imdbId,
        "original_language": originalLanguage == null ? null : originalLanguage,
        "original_title": originalTitle == null ? null : originalTitle,
        "overview": overview == null ? null : overview,
        "popularity": popularity == null ? null : popularity,
        "poster_path": posterPath,
        "production_companies": productionCompanies == null ? null : List<dynamic>.from(productionCompanies.map((x) => x.toMap())),
        "production_countries": productionCountries == null ? null : List<dynamic>.from(productionCountries.map((x) => x.toMap())),
        "release_date": releaseDate == null ? null : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "revenue": revenue == null ? null : revenue,
        "runtime": runtime == null ? null : runtime,
        "spoken_languages": spokenLanguages == null ? null : List<dynamic>.from(spokenLanguages.map((x) => x.toMap())),
        "status": status == null ? null : status,
        "tagline": tagline == null ? null : tagline,
        "title": title == null ? null : title,
        "video": video == null ? null : video,
        "vote_average": voteAverage == null ? null : voteAverage,
        "vote_count": voteCount == null ? null : voteCount,
    };
}

class Genre {
    int id;
    String name;

    Genre({
        this.id,
        this.name,
    });

    factory Genre.fromJson(String str) => Genre.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Genre.fromMap(Map<String, dynamic> json) => Genre(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
    };
}

class ProductionCompany {
    int id;
    String logoPath;
    String name;
    String originCountry;

    ProductionCompany({
        this.id,
        this.logoPath,
        this.name,
        this.originCountry,
    });

    factory ProductionCompany.fromJson(String str) => ProductionCompany.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductionCompany.fromMap(Map<String, dynamic> json) => ProductionCompany(
        id: json["id"] == null ? null : json["id"],
        logoPath: json["logo_path"] == null ? null : json["logo_path"],
        name: json["name"] == null ? null : json["name"],
        originCountry: json["origin_country"] == null ? null : json["origin_country"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "logo_path": logoPath == null ? null : logoPath,
        "name": name == null ? null : name,
        "origin_country": originCountry == null ? null : originCountry,
    };
}

class ProductionCountry {
    String iso31661;
    String name;

    ProductionCountry({
        this.iso31661,
        this.name,
    });

    factory ProductionCountry.fromJson(String str) => ProductionCountry.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProductionCountry.fromMap(Map<String, dynamic> json) => ProductionCountry(
        iso31661: json["iso_3166_1"] == null ? null : json["iso_3166_1"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toMap() => {
        "iso_3166_1": iso31661 == null ? null : iso31661,
        "name": name == null ? null : name,
    };
}

class SpokenLanguage {
    String iso6391;
    String name;

    SpokenLanguage({
        this.iso6391,
        this.name,
    });

    factory SpokenLanguage.fromJson(String str) => SpokenLanguage.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory SpokenLanguage.fromMap(Map<String, dynamic> json) => SpokenLanguage(
        iso6391: json["iso_639_1"] == null ? null : json["iso_639_1"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toMap() => {
        "iso_639_1": iso6391 == null ? null : iso6391,
        "name": name == null ? null : name,
    };
}

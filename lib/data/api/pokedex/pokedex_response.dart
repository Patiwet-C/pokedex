import 'package:pokedex/data/api/common/named_api_resource.dart';

class PokedexResponse {
  int count;
  String next;
  String? previous;
  List<NamedAPIResource> results;
  PokedexResponse({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });

  static PokedexResponse fromJson(Map<String, dynamic> json) {
    return PokedexResponse(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List<dynamic>)
          .map((e) => NamedAPIResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

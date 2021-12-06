import 'package:pokedex/data/api/common/generation_game_versions.dart';
import 'package:pokedex/data/api/common/named_api_resource.dart';
import 'package:pokedex/data/api/common/sprite.dart';
import 'package:pokedex/data/api/common/version_game_index.dart';

class PokemonAbility {
  bool isHidden;
  int slot;
  NamedAPIResource ability;

  PokemonAbility({
    required this.isHidden,
    required this.slot,
    required this.ability,
  });

  static PokemonAbility fromJson(Map<String, dynamic> json) {
    return PokemonAbility(
      isHidden: json['is_hidden'],
      slot: json['slot'],
      ability: NamedAPIResource.fromJson(json['ability']),
    );
  }
}

class PokemonHeldItemVersion {
  NamedAPIResource version;
  int rarity;

  PokemonHeldItemVersion({
    required this.version,
    required this.rarity,
  });

  static PokemonHeldItemVersion fromJson(Map<String, dynamic> json) {
    return PokemonHeldItemVersion(
        version: NamedAPIResource.fromJson(json['version']),
        rarity: json['rarity']);
  }
}

class PokemonHeldItem {
  NamedAPIResource item;
  List<PokemonHeldItemVersion> versionDetails;

  PokemonHeldItem({
    required this.item,
    required this.versionDetails,
  });

  static PokemonHeldItem fromJson(Map<String, dynamic> json) {
    return PokemonHeldItem(
      item: NamedAPIResource.fromJson(json['item']),
      versionDetails: (json['version_details'] as List<dynamic>)
          .map(
              (e) => PokemonHeldItemVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class PokemonMoveVersion {
  NamedAPIResource moveLearnMethod;
  NamedAPIResource versionGroup;
  int levelLearnedAt;

  PokemonMoveVersion({
    required this.moveLearnMethod,
    required this.versionGroup,
    required this.levelLearnedAt,
  });

  static PokemonMoveVersion fromJson(Map<String, dynamic> json) {
    return PokemonMoveVersion(
      moveLearnMethod: NamedAPIResource.fromJson(json['move_learn_method']),
      versionGroup: NamedAPIResource.fromJson(json['version_group']),
      levelLearnedAt: json['level_learned_at'],
    );
  }
}

class PokemonMove {
  NamedAPIResource move;
  List<PokemonMoveVersion> versionGroupDetails;

  PokemonMove({
    required this.move,
    required this.versionGroupDetails,
  });

  static PokemonMove fromJson(Map<String, dynamic> json) {
    return PokemonMove(
      move: NamedAPIResource.fromJson(json['move']),
      versionGroupDetails: (json['version_group_details'] as List<dynamic>)
          .map((e) => PokemonMoveVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Home {
  String? frontDefault;
  String? frontShiny;
  String? frontFemale;
  String? frontShinyFemale;

  Home({
    this.frontDefault,
    this.frontShiny,
    this.frontFemale,
    this.frontShinyFemale,
  });

  static Home fromJson(Map<String, dynamic> json) {
    return Home(
      frontDefault: json['frontDefault'],
      frontShiny: json['frontShiny'],
      frontFemale: json['frontFemale'],
      frontShinyFemale: json['frontShinyFemale'],
    );
  }
}

class Other {
  Sprite dreamWorld;
  Home home;
  Sprite officialArtwork;

  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  static Other fromJson(Map<String, dynamic> json) {
    return Other(
      dreamWorld: Sprite.fromJson(json['dream_world']),
      home: Home.fromJson(json['home']),
      officialArtwork: Sprite.fromJson(json['official-artwork']),
    );
  }
}

class PokemonSprites {
  String? frontDefault;
  String? frontShiny;
  String? frontFemale;
  String? frontShinyFemale;
  String? backDefault;
  String? backShiny;
  String? backFemale;
  String? backShinyFemale;
  Other other;
  GenerationGameVersions versions;

  PokemonSprites({
    this.frontDefault,
    this.frontShiny,
    this.frontFemale,
    this.frontShinyFemale,
    this.backDefault,
    this.backShiny,
    this.backFemale,
    this.backShinyFemale,
    required this.other,
    required this.versions,
  });

  static PokemonSprites fromJson(Map<String, dynamic> json) {
    return PokemonSprites(
      backDefault: json['back_default'],
      backFemale: json['back_female'],
      backShiny: json['back_shiny'],
      backShinyFemale: json['back_shiny_female'],
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'],
      frontShinyFemale: json['front_shiny_female'],
      other: Other.fromJson(json['other']),
      versions: GenerationGameVersions.fromJson(json['versions']),
    );
  }
}

class PokemonStat {
  NamedAPIResource stat;
  int effort;
  int baseStat;

  PokemonStat({
    required this.stat,
    required this.effort,
    required this.baseStat,
  });

  static PokemonStat fromJson(Map<String, dynamic> json) {
    return PokemonStat(
      stat: NamedAPIResource.fromJson(json['stat']),
      effort: json['effort'],
      baseStat: json['base_stat'],
    );
  }
}

class PokemonType {
  int slot;
  NamedAPIResource type;

  PokemonType({
    required this.slot,
    required this.type,
  });

  static PokemonType fromJson(Map<String, dynamic> json) {
    return PokemonType(
      slot: json['slot'],
      type: NamedAPIResource.fromJson(json['type']),
    );
  }
}

class PokemonResponse {
  int id;
  String name;
  int baseExperience;
  int height;
  bool isDefault;
  int order;
  int weight;
  List<PokemonAbility> abilities;
  List<NamedAPIResource> forms;
  List<VersionGameIndex> gameIndices;
  List<PokemonHeldItem> heldItems;
  String locationAreaEncounters;
  List<PokemonMove> moves;
  PokemonSprites sprites;
  NamedAPIResource species;
  List<PokemonStat> stats;
  List<PokemonType> types;

  PokemonResponse({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.abilities,
    required this.forms,
    required this.gameIndices,
    required this.heldItems,
    required this.locationAreaEncounters,
    required this.moves,
    required this.sprites,
    required this.species,
    required this.stats,
    required this.types,
  });

  static PokemonResponse fromJson(Map<String, dynamic> json) {
    return PokemonResponse(
      id: json['id'],
      name: json['name'],
      baseExperience: json['base_experience'],
      height: json['height'],
      isDefault: json['is_default'],
      order: json['order'],
      weight: json['weight'],
      abilities: (json['abilities'] as List<dynamic>)
          .map((e) => PokemonAbility.fromJson(e as Map<String, dynamic>))
          .toList(),
      forms: (json['forms'] as List<dynamic>)
          .map((e) => NamedAPIResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      gameIndices: (json['game_indices'] as List<dynamic>)
          .map((e) => VersionGameIndex.fromJson(e as Map<String, dynamic>))
          .toList(),
      heldItems: (json['held_items'] as List<dynamic>)
          .map((e) => PokemonHeldItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      locationAreaEncounters: json['location_area_encounters'],
      moves: (json['moves'] as List<dynamic>)
          .map((e) => PokemonMove.fromJson(e as Map<String, dynamic>))
          .toList(),
      sprites: PokemonSprites.fromJson(json['sprites']),
      species: NamedAPIResource.fromJson(json['species']),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => PokemonStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => PokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

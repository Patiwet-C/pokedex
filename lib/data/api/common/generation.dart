import 'package:pokedex/data/api/common/sprite.dart';

class GenerationI {
  Sprite redGreenBlue;
  Sprite yellow;

  GenerationI({
    required this.redGreenBlue,
    required this.yellow,
  });

  static GenerationI fromJson(Map<String, dynamic> json) {
    return GenerationI(
      redGreenBlue: Sprite.fromJson(json['red-blue']),
      yellow: Sprite.fromJson(json['yellow']),
    );
  }
}

class GenerationII {
  Sprite crystal;
  Sprite gold;
  Sprite silver;

  GenerationII({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  static GenerationII fromJson(Map<String, dynamic> json) {
    return GenerationII(
      crystal: Sprite.fromJson(json['crystal']),
      gold: Sprite.fromJson(json['gold']),
      silver: Sprite.fromJson(json['silver']),
    );
  }
}

class GenerationIII {
  Sprite emerald;
  Sprite fireredLeafgreen;
  Sprite rubySapphire;

  GenerationIII(
      {required this.emerald,
      required this.fireredLeafgreen,
      required this.rubySapphire});

  static GenerationIII fromJson(Map<String, dynamic> json) {
    return GenerationIII(
      emerald: Sprite.fromJson(json['emerald']),
      fireredLeafgreen: Sprite.fromJson(json['firered-leafgreen']),
      rubySapphire: Sprite.fromJson(json['ruby-sapphire']),
    );
  }
}

class GenerationIV {
  Sprite diamondPearl;
  Sprite heartgoldSoulsilver;
  Sprite platinum;

  GenerationIV({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  static GenerationIV fromJson(Map<String, dynamic> json) {
    return GenerationIV(
      diamondPearl: Sprite.fromJson(json['diamond-pearl']),
      heartgoldSoulsilver: Sprite.fromJson(json['heartgold-soulsilver']),
      platinum: Sprite.fromJson(json['platinum']),
    );
  }
}

class AnimatedSprite {
  Sprite animated;
  String? frontDefault;
  String? frontShiny;
  String? frontFemale;
  String? frontShinyFemale;
  String? backDefault;
  String? backShiny;
  String? backFemale;
  String? backShinyFemale;

  AnimatedSprite({
    required this.animated,
    this.frontDefault,
    this.frontShiny,
    this.frontFemale,
    this.frontShinyFemale,
    this.backDefault,
    this.backShiny,
    this.backFemale,
    this.backShinyFemale,
  });

  static AnimatedSprite fromJson(Map<String, dynamic> json) {
    return AnimatedSprite(
      animated: Sprite.fromJson(json['animated']),
      frontDefault: json['front_default'],
      frontShiny: json['front_shiny'],
      frontFemale: json['front_female'],
      frontShinyFemale: json['front_shiny_female'],
      backDefault: json['back_default'],
      backShiny: json['back_shiny'],
      backFemale: json['back_female'],
      backShinyFemale: json['back_shiny_female'],
    );
  }
}

class GenerationV {
  AnimatedSprite blackWhite;

  GenerationV({required this.blackWhite});

  static GenerationV fromJson(Map<String, dynamic> json) {
    return GenerationV(
        blackWhite: AnimatedSprite.fromJson(json['black-white']));
  }
}

class GenerationVI {
  Sprite omegarubyAlphasapphire;
  Sprite xy;

  GenerationVI({
    required this.omegarubyAlphasapphire,
    required this.xy,
  });

  static GenerationVI fromJson(Map<String, dynamic> json) {
    return GenerationVI(
      omegarubyAlphasapphire: Sprite.fromJson(json['omegaruby-alphasapphire']),
      xy: Sprite.fromJson(json['x-y']),
    );
  }
}

class GenerationVII {
  Sprite icons;
  Sprite ultraSunUltraMoon;

  GenerationVII({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  static GenerationVII fromJson(Map<String, dynamic> json) {
    return GenerationVII(
      icons: Sprite.fromJson(json['icons']),
      ultraSunUltraMoon: Sprite.fromJson(json['ultra-sun-ultra-moon']),
    );
  }
}

class GenerationVIII {
  Sprite icons;

  GenerationVIII({
    required this.icons,
  });

  static GenerationVIII fromJson(Map<String, dynamic> json) {
    return GenerationVIII(
      icons: Sprite.fromJson(json['icons']),
    );
  }
}

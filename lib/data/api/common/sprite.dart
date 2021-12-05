class Sprite {
  String? frontDefault;
  String? frontShiny;
  String? frontFemale;
  String? frontShinyFemale;
  String? backDefault;
  String? backShiny;
  String? backFemale;
  String? backShinyFemale;

  Sprite({
    this.frontDefault,
    this.frontShiny,
    this.frontFemale,
    this.frontShinyFemale,
    this.backDefault,
    this.backShiny,
    this.backFemale,
    this.backShinyFemale,
  });

  static Sprite fromJson(Map<String, dynamic> json) {
    return Sprite(
      frontDefault: json['front_default'],
      frontShiny: json['front_female'],
      frontFemale: json['front_shiny'],
      frontShinyFemale: json['front_shiny_female'],
      backDefault: json['back_default'],
      backShiny: json['front_shiny'],
      backFemale: json['back_female'],
      backShinyFemale: json['back_shiny_female'],
    );
  }
}

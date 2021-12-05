import 'package:pokedex/data/api/common/generation.dart';

class GenerationGameVersions {
  GenerationI generationI;
  GenerationII generationII;
  GenerationIII generationIII;
  GenerationIV generationIV;
  GenerationV generationV;
  GenerationVI generationVI;
  GenerationVII generationVII;
  GenerationVIII generationVIII;

  GenerationGameVersions({
    required this.generationI,
    required this.generationII,
    required this.generationIII,
    required this.generationIV,
    required this.generationV,
    required this.generationVI,
    required this.generationVII,
    required this.generationVIII,
  });

  static GenerationGameVersions fromJson(Map<String, dynamic> json) {
    return GenerationGameVersions(
      generationI: GenerationI.fromJson(json['generation-i']),
      generationII: GenerationII.fromJson(json['generation-ii']),
      generationIII: GenerationIII.fromJson(json['generation-iii']),
      generationIV: GenerationIV.fromJson(json['generation-iv']),
      generationV: GenerationV.fromJson(json['generation-v']),
      generationVI: GenerationVI.fromJson(json['generation-vi']),
      generationVII: GenerationVII.fromJson(json['generation-vii']),
      generationVIII: GenerationVIII.fromJson(json['generation-viii']),
    );
  }
}

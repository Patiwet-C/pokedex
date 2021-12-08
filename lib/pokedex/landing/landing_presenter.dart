import 'package:flutter/material.dart';
import 'package:pokedex/common/constants/number_constants.dart';
import 'package:pokedex/common/constants/string_constants.dart';
import 'package:pokedex/common/widgets/data_not_found.dart';
import 'package:pokedex/data/api/common/named_api_resource.dart';
import 'package:pokedex/data/api/pokedex/pokedex_response.dart';
import 'package:pokedex/data/api/pokemon/pokemon_response.dart';
import 'package:pokedex/pokedex/landing/landing_screen.dart';

abstract class LandingPresenterInterface {
  void setView(LandingView view);
  Widget pokedexListPresenter({
    required BuildContext context,
    PokedexResponse? data,
  });
  Widget pokemonDetailPresenter({
    required BuildContext context,
    PokemonResponse? data,
  });
}

class LandingPresenter implements LandingPresenterInterface {
  late LandingView _view;

  List<Widget> _pokemonList = [];

  LandingPresenter();

  void resetListItem() {
    _pokemonList = [];
  }

  @override
  void setView(LandingView view) {
    this._view = view;
  }

  void _manageListData({
    required BuildContext context,
    required List<NamedAPIResource> results,
  }) {
    List<Widget> items = [];

    results.forEach((item) {
      String name = item.name.replaceFirst(
        item.name[NumberConstants.FIRST_CHARACTER_INDEX],
        item.name[NumberConstants.FIRST_CHARACTER_INDEX].toUpperCase(),
      );

      items.add(
        _view.cardView(
            name: name,
            onPressed: () {
              _view.showButtomSheetModalView(
                context: context,
                url: item.url,
              );
            }),
      );
    });
    if (_pokemonList.length > NumberConstants.FIRST_CHARACTER_INDEX) {
      _pokemonList = [..._pokemonList, ...items];
    } else {
      _pokemonList = items;
    }
  }

  @override
  Widget pokedexListPresenter({
    required BuildContext context,
    PokedexResponse? data,
  }) {
    if (data != null) {
      _manageListData(
        context: context,
        results: data.results,
      );

      return _view.pokedexListView(
        context: context,
        pokemonList: _pokemonList,
      );
    }
    return DataNotFound();
  }

  @override
  Widget pokemonDetailPresenter({
    required BuildContext context,
    PokemonResponse? data,
  }) {
    if (data != null) {
      String name = data.name.replaceFirst(
        data.name[NumberConstants.FIRST_CHARACTER_INDEX],
        data.name[NumberConstants.FIRST_CHARACTER_INDEX].toUpperCase(),
      );

      return _view.pokemonDetailView(
        name: name,
        backImage: data.sprites.backDefault ?? StringConstants.EMPTY_STRING,
        frontImage: data.sprites.frontDefault ?? StringConstants.EMPTY_STRING,
        height: data.height,
        weight: data.weight,
      );
    }

    return DataNotFound();
  }
}

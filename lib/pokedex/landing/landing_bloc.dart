import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokedex/common/constants/string_constants.dart';
import 'package:pokedex/common/utils/api_provider.dart';
import 'package:pokedex/common/utils/api_response.dart';
import 'package:pokedex/data/api/pokedex/pokedex_response.dart';
import 'package:pokedex/data/api/pokemon/pokemon_response.dart';
import 'package:rxdart/rxdart.dart';

class LandingBloc {
  static const String _pokemonEndpoint = 'pokemon';

  late ApiProvider _apiProvider;
  late BehaviorSubject<ApiResponse<PokedexResponse>> _pokedexController;
  late BehaviorSubject<ApiResponse<PokemonResponse>> _pokemonController;
  late ScrollController _scrollController;
  String? _nextUrl;

  LandingBloc({
    required apiProvider,
    required pokedexController,
    required pokemonController,
    required scrollController,
  }) {
    this._apiProvider = apiProvider;
    this._pokedexController = pokedexController;
    this._pokemonController = pokemonController;
    this._scrollController = scrollController;

    _getPokedexResponse();
    _setScrollListiner();
  }

  LandingBloc.init()
      : this._apiProvider = ApiProvider(),
        this._pokedexController = BehaviorSubject(),
        this._pokemonController = BehaviorSubject(),
        this._scrollController = ScrollController() {
    _getPokedexResponse();
    _setScrollListiner();
  }

  ValueStream<ApiResponse<PokedexResponse>> get pokedexStream =>
      _pokedexController.stream;

  ValueStream<ApiResponse<PokemonResponse>> get pokemonStream =>
      _pokemonController.stream;

  ScrollController get scrollController => _scrollController;

  void _setScrollListiner() {
    _scrollController.addListener(() {
      double _maxScroll = _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels == _maxScroll) {
        String? url = _nextUrl;
        if (url == null) {
          _getPokedexResponse();
        } else {
          _getNextPokedexResponse(url);
        }
      }
    });
  }

  Future<void> pullRefresh() async {
    _getPokedexResponse();
  }

  void setNextUrl(String? nextUrl) {
    this._nextUrl = nextUrl;
  }

  Future<void> _getPokedexResponse() async {
    _pokedexController.sink.add(ApiResponse.loading(
      StringConstants.FETCHING_DATA,
    ));
    try {
      Map<String, dynamic>? response =
          await _apiProvider.get(endpoint: _pokemonEndpoint);
      if (response != null) {
        PokedexResponse data = PokedexResponse.fromJson(response);
        _pokedexController.sink.add(ApiResponse.completed(data));
      }
    } catch (event) {
      _pokedexController.sink.add(ApiResponse.error(event.toString()));
      debugPrint('${StringConstants.LANDING_ERROR_MESSAGE} :$event');
    }
  }

  Future<void> _getNextPokedexResponse(String url) async {
    _pokedexController.sink.add(ApiResponse.loading(
      StringConstants.FETCHING_DATA,
    ));
    try {
      Map<String, dynamic>? response =
          await _apiProvider.getByUrl(urlString: url);
      if (response != null) {
        PokedexResponse data = PokedexResponse.fromJson(response);
        _pokedexController.sink.add(ApiResponse.completed(data));
      }
    } catch (event) {
      _pokedexController.sink.add(ApiResponse.error(event.toString()));
      debugPrint('${StringConstants.LANDING_ERROR_MESSAGE} :$event');
    }
  }

  Future<void> getPokemonResponse({required String url}) async {
    _pokemonController.sink.add(ApiResponse.loading(
      StringConstants.FETCHING_DATA,
    ));
    try {
      Map<String, dynamic>? response =
          await _apiProvider.getByUrl(urlString: url);
      if (response != null) {
        PokemonResponse data = PokemonResponse.fromJson(response);
        _pokemonController.sink.add(ApiResponse.completed(data));
      }
    } catch (event) {
      _pokemonController.sink.add(ApiResponse.error(event.toString()));
      debugPrint('${StringConstants.LANDING_ERROR_MESSAGE} :$event');
    }
  }

  void dispose() {
    _pokedexController.close();
    _pokemonController.close();
    _scrollController.removeListener(_setScrollListiner);
  }
}

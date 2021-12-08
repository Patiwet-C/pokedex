import 'package:flutter/material.dart';
import 'package:pokedex/common/constants/string_constants.dart';
import 'package:pokedex/common/utils/api_response.dart';
import 'package:pokedex/common/widgets/bottom_sheet_view.dart';
import 'package:pokedex/common/widgets/card_view.dart';
import 'package:pokedex/common/widgets/custom_bottom_sheet_modal.dart';
import 'package:pokedex/common/widgets/data_not_found.dart';
import 'package:pokedex/common/widgets/loading.dart';
import 'package:pokedex/common/widgets/loading_error.dart';
import 'package:pokedex/data/api/pokedex/pokedex_response.dart';
import 'package:pokedex/data/api/pokemon/pokemon_response.dart';
import 'package:pokedex/pokedex/landing/landing_bloc.dart';
import 'package:pokedex/pokedex/landing/landing_presenter.dart';

abstract class LandingView {
  Widget landingScreenView();
  Widget loadingView(String? loadingMessage);
  Widget pokedexListView({
    required BuildContext context,
    required List<Widget> pokemonList,
  });
  Widget pokemonDetailView({
    required String name,
    required String backImage,
    required String frontImage,
    required int height,
    required int weight,
  });
  Widget cardView({
    required String name,
    required Function() onPressed,
  });
  void showButtomSheetModalView({
    required BuildContext context,
    required String url,
  });
}

class LandingScreen extends StatelessWidget implements LandingView {
  final LandingBloc _landingBloc;
  final LandingPresenter _landingPresenter;

  LandingScreen()
      : this._landingBloc = LandingBloc.init(),
        _landingPresenter = LandingPresenter() {
    _landingPresenter.setView(this);
  }

  @override
  Widget cardView({
    required String name,
    required Function() onPressed,
  }) {
    return CardView(
      title: name,
      onPressed: onPressed,
    );
  }

  @override
  Widget pokedexListView({
    required BuildContext context,
    required List<Widget> pokemonList,
  }) {
    return SingleChildScrollView(
      controller: _landingBloc.scrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: pokemonList,
      ),
    );
  }

  @override
  void showButtomSheetModalView({
    required BuildContext context,
    required String url,
  }) {
    _landingBloc.getPokemonResponse(url: url);

    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        isDismissible: true,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StreamBuilder<ApiResponse<PokemonResponse>>(
            stream: _landingBloc.pokemonStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                ApiResponse<PokemonResponse>? data = snapshot.data;
                if (data != null) {
                  switch (data.status) {
                    case ApiResponseStatus.LOADING:
                      return CustomBottomSheetModal(
                        child: loadingView(data.message),
                      );
                    case ApiResponseStatus.COMPLETED:
                      return _landingPresenter.pokemonDetailPresenter(
                        context: context,
                        data: data.data,
                      );
                    case ApiResponseStatus.ERROR:
                      return LoadingError();
                  }
                }
              }
              return DataNotFound();
            },
          );
        });
  }

  @override
  Widget landingScreenView() {
    return RefreshIndicator(
      child: StreamBuilder<ApiResponse<PokedexResponse>>(
        stream: _landingBloc.pokedexStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            ApiResponse<PokedexResponse>? data = snapshot.data;
            if (data != null) {
              switch (data.status) {
                case ApiResponseStatus.LOADING:
                  return loadingView(data.message);
                case ApiResponseStatus.COMPLETED:
                  _landingBloc.setNextUrl(data.data?.next);
                  return _landingPresenter.pokedexListPresenter(
                    context: context,
                    data: data.data,
                  );
                case ApiResponseStatus.ERROR:
                  return LoadingError();
              }
            }
          }
          return DataNotFound();
        },
      ),
      onRefresh: () async {
        _landingPresenter.resetListItem();
        _landingBloc.pullRefresh();
      },
    );
  }

  @override
  Widget loadingView(String? loadingMessage) {
    return SafeArea(
      child: Loading(loadingMessage: loadingMessage),
    );
  }

  @override
  Widget pokemonDetailView({
    required String name,
    required String backImage,
    required String frontImage,
    required int height,
    required int weight,
  }) {
    return CustomBottomSheetModal(
      child: BottomSheetView(
        name: name,
        backImage: backImage,
        frontImage: frontImage,
        height: height,
        weight: weight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.LANDING_TITLE),
      ),
      body: SafeArea(
        child: landingScreenView(),
      ),
    );
  }
}

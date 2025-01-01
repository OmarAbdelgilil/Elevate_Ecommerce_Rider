import 'dart:convert';

import 'package:elevate_ecommerce_driver/core/common/result.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/country.dart';

import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/check_cached_user_use_case.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/usecases/get_cached_user_use_case.dart';
import 'package:flutter/services.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';

@injectable
class OnBoardingViewModel extends Cubit<BoardingScreenState> {
  final CheckCachedUserUseCase _checkCachedUserUseCase;
  final GetCachedUserUseCase _getCachedUserUseCase;
  late List<Country> countries;
  late var dropdownvalue;
  OnBoardingViewModel(
    this._checkCachedUserUseCase,
    this._getCachedUserUseCase,
  ) : super(LoadingScreenState());

  Future<void> handleIntent(BoardingScreenIntent intent) async {
    switch (intent) {
      case CheckCacheIntent():
        _checkCache();
    }
  }

  Future<void> _checkCache() async {
    String jsonString = await rootBundle.loadString('assets/json/country.json');
    final List<dynamic> parsed = json.decode(jsonString);
    countries = parsed.map((json) => Country.fromJson(json)).toList();
    dropdownvalue = countries.firstWhere(
      (element) => element.name == 'Egypt',
    );
    final tokenFound = await _checkCachedUserUseCase.checkUser();
    switch (tokenFound) {
      case Success<String?>():
        if (tokenFound.data != null) {
          final getUser = await _getCachedUserUseCase.getUser();
          switch (getUser) {
            case Success<User?>():
              emit(LoggedInState());
              return;
            case Fail<User?>():
              emit(ErrorState(getUser.exception));
              return;
          }
        }
      case Fail<String?>():
        emit(ErrorState(tokenFound.exception));
        return;
    }
    emit(InitialState());
  }
}

sealed class BoardingScreenIntent {}

class CheckCacheIntent extends BoardingScreenIntent {}

sealed class BoardingScreenState {}

class InitialState extends BoardingScreenState {}

class LoadingScreenState extends BoardingScreenState {}

class LoggedInState extends BoardingScreenState {}

class ErrorState extends BoardingScreenState {
  Exception? exception;
  ErrorState(this.exception);
}

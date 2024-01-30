import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mula_biz_mobile/base/bloc/index.dart';

part 'my_wallet_state.dart';

class MyWalletCubit extends Cubit<SignInState> {
  MyWalletCubit() : super(const SignInState());

  void action() async {
    emit(state.copyWith(status: BaseStateStatus.loading));
    try {} on DioException catch (e) {
      emit(state.copyWith(
        status: BaseStateStatus.failed,
        errorMessage: e.message,
      ));
    }
  }
}

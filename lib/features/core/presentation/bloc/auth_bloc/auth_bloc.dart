import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:mula_biz_mobile/base/bloc/index.dart';
import 'package:mula_biz_mobile/features/core/domain/usecases/check_token_expire_usecase.dart';
import 'package:mula_biz_mobile/features/core/domain/usecases/get_user_profile_use_case.dart';
import 'package:mula_biz_mobile/features/core/domain/usecases/log_out_usecase.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

part 'auth_bloc.g.dart';

@injectable
class AuthBloc extends BaseBloc<AuthEvent, AuthState> {
  final CheckTokenExpireUseCase checkTokenExpire;
  final LogOutUseCase logOutUseCase;
  final GetUserProfileUseCase getUserProfileUseCase;

  AuthBloc(
    this.checkTokenExpire,
    this.logOutUseCase,
    this.getUserProfileUseCase,
  ) : super(AuthState.init()) {
    on<Init>(_onInit);
    on<Logout>(_onLogOut);
    on<GetUserProfile>(_onGetUserProfile);
  }

  FutureOr<void> _onInit(Init event, Emitter<AuthState> emit) async {
    final failureOrResponse = await checkTokenExpire.call();
    failureOrResponse.fold((l) {
      emit(
        AuthState.unauthenticated(),
      );
    }, (r) {
      emit(
        AuthState.authenticated(),
      );
    });
  }

  FutureOr<void> _onLogOut(event, Emitter<AuthState> emit) async {
    final failureOrResponse = await logOutUseCase();
    failureOrResponse.fold(
      (l) {},
      (_) {
        emit(
          AuthState.unauthenticated(),
        );
      },
    );
  }

  FutureOr<void> _onGetUserProfile(event, Emitter<AuthState> emit) async {
    emit(const AuthState(status: BaseStateStatus.loading));
    try {
      await getUserProfileUseCase();
      emit(const AuthState(status: BaseStateStatus.success));
    } on DioException catch (e) {
      emit(AuthState(
          status: BaseStateStatus.failed, message: e.response?.data?["error"]));
    }
  }
}

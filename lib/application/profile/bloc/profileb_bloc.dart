// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:flutter_cubit_bloc/domain/core/user/model/user_response.dart';
import 'package:flutter_cubit_bloc/infrastructure/profile/profile_repository.dart';

part 'profileb_bloc.freezed.dart';
part 'profileb_event.dart';
part 'profileb_state.dart';

class ProfilebBloc extends Bloc<ProfilebEvent, ProfilebState> {
  final ProfileRepository profileRepository;

  ProfilebBloc(
    this.profileRepository,
  ) : super(_Initial()) {
    on<ProfilebEvent>((event, emit) async {
      if (event is _GetAllUserData) {
        emit(const ProfilebState.isLoading());

        final profilResponse = await profileRepository.getAllUserData();

        profilResponse.fold(
          (l) => emit(ProfilebState.isError(l)),
          (r) => emit(ProfilebState.isSuccess(r)),
        );
      }
    });
  }
}

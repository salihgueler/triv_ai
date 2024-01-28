import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  void signOut() {
    Amplify.Auth.signOut();
  }
}

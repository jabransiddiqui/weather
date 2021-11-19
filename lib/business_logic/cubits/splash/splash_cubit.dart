import 'package:bloc/bloc.dart';
import './splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(Initial());

  Future<void> setRoot() async {
    await Future.delayed(const Duration(seconds: 1));
    emit(Loading());
    await Future.delayed(const Duration(seconds: 1));
    emit(Loaded());
  }
}

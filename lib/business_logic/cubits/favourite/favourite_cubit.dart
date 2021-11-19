import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '/data/data.dart';
import '../../business_logic.dart';

class FavouriteCubit extends Cubit<FavouriteState>  with HydratedMixin{
  FavouriteCubit() : super(const FavouriteState(favourite: []));

   addToFavourite(HomeModel model) {
    List<HomeModel> list = state.favourite.toList() ;
    if (list.contains(model)) {
      emit(IsFavouriteAdd(false,state));
    } else {
      emit(IsFavouriteAdd(true,state));
      Future.delayed(const Duration(seconds: 1));
      list.add(model);
      emit(state.copyWith(favourite: list));
      
    }
  }

  @override
  FavouriteState? fromJson(Map<String, dynamic> json) {
    return FavouriteState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(FavouriteState state) {
    return state.toMap();
  }
}

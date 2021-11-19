import 'dart:convert';
import 'package:equatable/equatable.dart';

import '/data/data.dart';

class FavouriteState extends Equatable {
  final List<HomeModel> favourite;
  const FavouriteState({
     required this.favourite,
  });

  @override
  List<Object> get props => [favourite];

  FavouriteState copyWith({
    List<HomeModel>? favourite,
  }) {
    return FavouriteState(
      favourite: favourite ?? this.favourite,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'favourite': favourite.map((x) => x.toMap()).toList(),
    };
  }

  factory FavouriteState.fromMap(Map<String, dynamic> map) {
    return FavouriteState(
      favourite: List<HomeModel>.from(map['favourite']?.map((x) => HomeModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FavouriteState.fromJson(String source) => FavouriteState.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}


class IsFavouriteAdd extends FavouriteState{
     final bool isSuccess;
     final FavouriteState state;
     IsFavouriteAdd(this.isSuccess,this.state) : super(favourite: state.favourite);
}
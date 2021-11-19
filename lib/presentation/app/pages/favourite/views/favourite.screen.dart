import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/presentation/presentation.dart';
import '/business_logic/business_logic.dart';

class FavouriteScreen extends StatelessWidget {
  final FavouriteCubit _favouriteCubit;
  const FavouriteScreen(this._favouriteCubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
      ),
      body: BlocProvider.value(
        value: _favouriteCubit,
        child: Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
              itemCount:_favouriteCubit.state.favourite.length,
              itemBuilder: (context, index) {
                return FavouriteRowWidget(_favouriteCubit.state.favourite[index]);
              }),
        ),
      ),
    );
  }
}

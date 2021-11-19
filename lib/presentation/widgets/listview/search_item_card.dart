import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/utils/utils.dart';
import '/services/services.dart';
import '/data/data.dart';
import '/business_logic/business_logic.dart';


class SearchItemCard extends StatelessWidget {
  const SearchItemCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final SearchCityModel item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.locationType),
      onTap: (){
        context.read<SearchCityCubit>().setSelectedCity(item);
        NavigationService.instance.pushAndReplac(homeRoute,arguments: item);
      },
    );
  }
}

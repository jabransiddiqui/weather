import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/presentation/presentation.dart';
import '/business_logic/business_logic.dart';

class SearchCityScreen extends StatefulWidget {
  const SearchCityScreen({Key? key}) : super(key: key);

  @override
  _SearchCityScreenState createState() => _SearchCityScreenState();
}

class _SearchCityScreenState extends State<SearchCityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
              child: SearchField(
                title: "Search for city",
                onChanged: (value) {
                  context.read<SearchCityCubit>().searchCities(value);
                },
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: BlocConsumer<SearchCityCubit, SearchCityState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    switch (state.runtimeType) {
                      case SearchCityLoading:
                        return const Center(child: CircularProgressIndicator());
                      case SearchComplete:
                        final items =
                            (state as SearchComplete).citiesData ?? [];
                        return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return SearchItemCard(item: items[index]);
                          },
                        );
                      case SearchError:
                        return Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: Text((state as SearchError).message))
                            ],
                          ),
                        );
                      default:
                        return const SizedBox();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

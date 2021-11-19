import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/presentation/presentation.dart';
import '/services/services.dart';
import '/business_logic/business_logic.dart';
import '/utils/utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<HomeCubit>()
        .getCityWeather(context.read<SearchCityCubit>().cityModel!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context1) => FavouriteCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: false,
          title: const Text("Weather"),
          actions: [
            TextButton(
                onPressed: () => context.read<ThemeCubit>().changeTheme(),
                child: Icon(
                  context.read<ThemeCubit>().state.variant == ThemeVariant.light
                      ? Icons.brightness_3_sharp
                      : Icons.wb_sunny,
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                child: Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                onTap: () =>
                    NavigationService.instance.navigateTo(searchCitiesRoute),
              ),
            )
          ],
        ),
        bottomSheet: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(bottom: 25, right: 15),
            height: 80,
            child: Builder(builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => context
                        .read<FavouriteCubit>()
                        .addToFavourite(context.read<HomeCubit>().homeModel),
                    child: Icon(
                      Icons.star_border,
                      size: 30,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      final favCubit = context.read<FavouriteCubit>();
                      NavigationService.instance
                          .navigateTo(favouriteRoute, arguments: favCubit);
                    },
                    child: Icon(
                      Icons.format_list_bulleted,
                      size: 30,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        body: SingleChildScrollView(
          child: BlocListener<FavouriteCubit, FavouriteState>(
            listener: (context, state) {
              if (state is IsFavouriteAdd) {
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      SnackBar(
                        content: Text(state.isSuccess
                            ? "City added to Favourite"
                            : 'City is already in Favourite list'),
                      ),
                    );
              }
            },
            child: SafeArea(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case HomeInitial:
                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Center(child: CircularProgressIndicator()),
                          ],
                        ),
                      );
                    case HomeWeatherLoaded:
                      final items = (state as HomeWeatherLoaded).homeModel;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 30),
                            child: Text(
                              items.timezone,
                              textAlign: TextAlign.center,
                              style: tempStyle.internNormal_25().copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                margin:
                                    const EdgeInsets.only(top: 10, left: 10),
                                child: Text(
                                  items.current.temp.toString(),
                                  textAlign: TextAlign.center,
                                  style: tempStyle.internNormal_80().copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground),
                                ),
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                margin: const EdgeInsets.only(bottom: 25),
                                child: Text(
                                  'c',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onBackground,
                                      fontSize: 30,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(
                                top: 10, left: 15, right: 15),
                            child: Text(
                              items.current.weather.first.main,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                  fontSize: 25,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 15),
                                    child: Text(
                                      'H:5',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      'o',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 15),
                                    child: Text(
                                      'L:5',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: const EdgeInsets.only(bottom: 4),
                                    child: Text(
                                      'o',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onBackground,
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Container(
                            height: 200,
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 30),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: tempColor.greyColor,
                            ),
                            child: Column(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 5, left: 15, right: 15),
                                  child: Text(
                                    '${items.hourly.length} Hours Forcast',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: tempColor.whiteColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ),
                                Divider(
                                  color: tempColor.whiteColor,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 50,
                                  height: 129,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: items.hourly.length,
                                      itemBuilder: (context, index) {
                                        final hourly = items.hourly[index];
                                        return HourlyForcastWidget(hourly);
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 20, right: 20, top: 10, bottom: 90),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              color: tempColor.greyColor,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      margin: const EdgeInsets.only(
                                          top: 15,
                                          left: 15,
                                          bottom: 4,
                                          right: 15),
                                      child: Icon(
                                        Icons.date_range,
                                        size: 30,
                                        color: tempColor.whiteColor,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      margin: const EdgeInsets.only(
                                          top: 10, right: 10),
                                      child: Text(
                                        '${items.daily.length} Days Forcast',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            color: tempColor.whiteColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: tempColor.whiteColor,
                                  thickness: 1,
                                ),
                                SizedBox(
                                  height: items.daily.length * 85,
                                  child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: items.daily.length,
                                      itemBuilder: (context, index) {
                                        final daily = items.daily[index];
                                        return DaysForcastRowWidget(daily);
                                      }),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    case HomeWeatherFetchError:
                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 110,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                    child: Text((state as HomeWeatherFetchError)
                                        .message))
                              ],
                            )),
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
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import '/data/data.dart';
import '/services/services.dart';
import '/utils/utils.dart';
import 'business_logic/business_logic.dart';
import 'helper/helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  final WeatherRepository weatherRepository = WeatherRepository();
  runApp(MyApp(
    weatherRepository: weatherRepository,
  ));
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;
  const MyApp({
    Key? key,
    required this.weatherRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: weatherRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(create: (context) => SearchCityCubit(weatherRepository)),
          BlocProvider(create: (context) => HomeCubit(weatherRepository))
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state.themeData,
              navigatorKey: NavigationService.instance.navigatorKey,
              onGenerateRoute: generateRoute,
              initialRoute: splashRoute,
            );
          },
        ),
      ),
    );
  }
}

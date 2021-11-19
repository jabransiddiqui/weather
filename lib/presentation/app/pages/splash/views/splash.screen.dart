import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/services/services.dart';
import '/business_logic/cubits/cubits.dart';
import '/utils/utils.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit(),
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(50),
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Container()),
                Container(
                  margin: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: BlocConsumer<SplashCubit, SplashState>(
                          listener: (context, state) {
                            if (state is Loaded) {
                              try {
                                NavigationService.instance
                                    .pushAndReplac(searchCitiesRoute);
                              } catch (e) {
                                NavigationService.instance
                                    .navigateTo(nodataRoute)
                                    .then((value) =>
                                        context.read<SplashCubit>().setRoot());
                              }
                            }
                          },
                          builder: (context, state) {
                            if (state is Loading) {
                              return splashLogo();
                            } else if ((state is Initial)) {
                              context.read<SplashCubit>().setRoot();
                              return const CircularProgressIndicator();
                            } else {
                              return splashLogo();
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container splashLogo() => Container(padding:const EdgeInsets.all(5),height: 100,width: 100,child: SvgPicture.asset("splash".svg));
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '/services/services.dart';

class NodataScreen extends StatelessWidget {
  const NodataScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50,left: 20,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(icon: const Icon(Icons.close), onPressed: () => NavigationService.instance.goBack() ,)
                  ],
                ),
              ),

              Expanded(
                child: Center(
                  child: Lottie.asset('lib/assets/lotties/404.json'),
                ),
              ),
            ],
          ),
        );
  }
}
import 'package:flutter/material.dart';
import '/services/services.dart';
import '/helper/helper.dart';
import '/data/data.dart';
import '/utils/utils.dart';

class DaysForcastRowWidget extends StatelessWidget {
  final Daily daily;
  const DaysForcastRowWidget(this.daily,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        NavigationService.instance.navigateTo(weatherDeatilRoute,arguments: daily);
      },
      child: SizedBox(
        height: 85,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: const EdgeInsets.only(
                    left: 10,
                    top: 10,
                  ),
                  child: Text(
                    convertTimeStampToDay(daily.dt),
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: tempColor.whiteColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                          top: 15, left: 15, bottom: 4, right: 15),
                      child: Image.network('http://openweathermap.org/img/w/${daily.weather.first.icon}.png'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(
                        top: 15,
                        left: 15,
                      ),
                      child: Text(
                        'L:${daily.temp.min}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: tempColor.whiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin: const EdgeInsets.only(
                        bottom: 1,
                      ),
                      child: Text(
                        'c',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: tempColor.whiteColor,
                            fontSize: 12,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(right: 15),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 15, left: 15),
                        child: Text(
                          'H:${daily.temp.max}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: tempColor.whiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(
                          bottom: 1,
                        ),
                        child: Text(
                          'c',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: tempColor.whiteColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Divider(
              color: tempColor.whiteColor,
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}

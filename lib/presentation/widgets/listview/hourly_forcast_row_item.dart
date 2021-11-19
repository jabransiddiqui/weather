import 'package:flutter/material.dart';
import '/data/data.dart';
import '/helper/helper.dart';
import '/utils/utils.dart';

class HourlyForcastWidget extends StatelessWidget {
  final Hourly hourly;
  const HourlyForcastWidget(this.hourly, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            top: 10,
            left: 10,
            bottom: 5,
          ),
          child: Text(
            convertTimeStampToHour(hourly.dt),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: tempColor.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
        ),
        Container(
          height: 30,
          width: 30,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 15, left: 15, bottom: 4),
          child: Image.network(
              'http://openweathermap.org/img/w/${hourly.weather.first.icon}.png'),
        ),
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 15, left: 15),
              child: Text(
                hourly.temp.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: tempColor.whiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.normal),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(bottom: 1),
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
      ],
    );
  }
}

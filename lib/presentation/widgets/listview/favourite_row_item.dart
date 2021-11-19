import 'package:flutter/material.dart';
import 'package:weather/utils/utils.dart';
import '/data/data.dart';

class FavouriteRowWidget extends StatelessWidget {
  final HomeModel model;
  const FavouriteRowWidget(this.model,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(0),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        color: tempColor.greyColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin:const EdgeInsets.only(top: 10, left: 10),
                  child: Text(
                    "Country/City",
                    textAlign: TextAlign.center,
                    style:tempStyle.internBold_20().copyWith(color: tempColor.whiteColor),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, left: 10),
                      child: Text(
                        model.current.temp.toString(),
                        textAlign: TextAlign.start,
                        style: tempStyle.internNormal_50().copyWith(color: tempColor.whiteColor),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      margin:const EdgeInsets.only(bottom: 10, left: 5, right: 10),
                      child: Text(
                        'c',
                        textAlign: TextAlign.start,
                        style: tempStyle.internNormal_20().copyWith(color: tempColor.whiteColor),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 10),
              child: Text(
                model.timezone,
                textAlign: TextAlign.center,
                style: tempStyle.internBold_14().copyWith(color: tempColor.whiteColor),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 12, left: 10),
                  child: Text(
                    model.current.weather.first.main,
                    textAlign: TextAlign.center,
                    style: tempStyle.internNormal_20().copyWith(color: tempColor.whiteColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

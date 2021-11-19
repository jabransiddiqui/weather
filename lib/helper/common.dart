  // ********************* Check Internet Connection *****************************/
  import 'dart:io';
  import 'package:intl/intl.dart';

Future<bool> checkConnection() async {
    bool hasConnection = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        hasConnection = true;
      } else {
        hasConnection = false;
      }
    } on SocketException catch (_) {
      hasConnection = false;
    }
    return hasConnection;
  }

  // end of Internet Connection method

   String convertTimeStampToHour(int timeStamp) {
     var dateToTimeStamp = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
     return DateFormat('HH a').format(dateToTimeStamp);
   }
    String convertTimeStampToDay(int timeStamp) {
        var dateToTimeStamp = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1000);
        return DateFormat('EEE').format(dateToTimeStamp);
      }

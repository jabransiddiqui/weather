import 'package:flutter/material.dart';


extension AppFonts on TextStyle {

  TextStyle internNormal_80() =>
       const TextStyle(fontSize: 80, fontWeight: FontWeight.w300); 
  TextStyle internNormal_50() =>
       const TextStyle(fontSize: 50, fontWeight: FontWeight.w300); 

  TextStyle internBold_25() =>
       const TextStyle(fontSize: 25, fontWeight: FontWeight.bold);
  TextStyle internNormal_25() =>
       const TextStyle(fontSize: 25, fontWeight: FontWeight.normal);   

  TextStyle internBold_20() =>
       const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  TextStyle internNormal_20() =>
       const TextStyle(fontSize: 20, fontWeight: FontWeight.normal); 

  TextStyle internNormal_14() =>
       const TextStyle(fontSize: 14, fontWeight: FontWeight.normal);
  TextStyle internBold_14() =>
       const TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
}

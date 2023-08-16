
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const colorGreen = Colors.green;
const colorBlack = Colors.black;
const colorWhite = Colors.white;
final colorLightGrey = Colors.grey.shade500;

const chipBgColorBlue = Colors.blue;
const chipBgColorPurple = Colors.purple;
const chipBgColorRed = Colors.red;
const chipBgColorGreen = Colors.green;



TextStyle appHeadingText1(textColor){
  return GoogleFonts.oxygen(
        //textStyle: Theme.of(context).textTheme.displayLarge,
        fontSize: 28,
        letterSpacing: 0.6,
        color: textColor,
        fontWeight: FontWeight.w600,
  );
}

TextStyle appHeadingText2(textColor){
  return GoogleFonts.oxygen(
    fontSize: 22,
    color: textColor,
    fontWeight: FontWeight.w700,
  );
}

TextStyle appHeadingText3(textColor){
  return GoogleFonts.oxygen(
    //textStyle: Theme.of(context).textTheme.displayLarge,
    fontSize: 19,
    color: textColor,
    fontWeight: FontWeight.w400,
  );
}

TextStyle appHeadingText5(textColor){
  return GoogleFonts.oxygen(
    fontSize: 15,
    color: textColor,
    fontWeight: FontWeight.w600,
  );
}

TextStyle appHeadingText6(textColor){
  return GoogleFonts.oxygen(
    fontSize: 15,
    color: textColor,
    fontWeight: FontWeight.w400,
  );
}

TextStyle listTileTitle(textColor){
  return GoogleFonts.oxygen(
    fontSize: 15,
    color: textColor,
    fontWeight: FontWeight.w600,
  );
}

TextStyle listTileSubTitle(){
  return GoogleFonts.oxygen(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
}

TextStyle listTileSubTitle2(textColor){
  return GoogleFonts.oxygen(
    fontSize: 14,
    color: textColor,
    fontWeight: FontWeight.w400,
  );
}

TextStyle snackBarText(textColor){
  return GoogleFonts.oxygen(
    color: textColor,
    fontWeight: FontWeight.w500,
  );
}

ButtonStyle appButtonStyle(){
  return ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 14),
    //elevation: 3
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(6)
    )
  );
}

ButtonStyle appTextButtonStyle(){
  return TextButton.styleFrom(
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 30),
      //elevation: 3
      backgroundColor: Colors.grey.shade600,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6))
      )
  );
}

InputDecoration myInputDecoration(label){
  return InputDecoration(
      hintText: label,
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Colors.grey.shade400),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: const OutlineInputBorder(
        borderSide: BorderSide.none
      )

  );
}

InputDecoration myInputDecoration2(){
  return InputDecoration(
      prefixIcon: TextButton(
        child: const Text("Photo"),
        onPressed: (){},
      ),
      filled: true,
      fillColor: Colors.white,
      hintStyle: TextStyle(color: Colors.grey.shade400),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      border: const OutlineInputBorder(
          borderSide: BorderSide.none
      )

  );
}



// InputDecoration myInputDecoration(label){
//   return InputDecoration(
//     hintText: label,
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(6),
//       borderSide: BorderSide(width: 1, color: Colors.deepPurple.shade200),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(6),
//       borderSide: BorderSide(width: 1, color: Colors.deepPurple.shade400),
//     ),
//     errorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(6),
//       borderSide: BorderSide(width: 1, color: Colors.red.shade200),
//     ),
//     focusedErrorBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(6),
//       borderSide: BorderSide(width: 1, color: Colors.red.shade400),
//     )
//   );
// }
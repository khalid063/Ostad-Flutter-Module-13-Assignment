import 'package:flutter/material.dart';
import '../style/style.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key, required this.number, required this.title,
  });

  final String number;
  final String title;

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   width: 86,
    //   child: Card(
    //     elevation: 2,
    //     child: Padding(
    //       padding: const EdgeInsets.all(6.0),
    //       child: Column(
    //         children: [
    //           Text(number.toString(), style: appHeadingText2(colorBlack),),
    //           Text(title, style: const TextStyle(fontSize: 13),),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return SizedBox(
      width: MediaQuery.of(context).size.width/4.2, //86,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/70),
          child: Column(
            children: [
              Text(number.toString(), style: appHeadingText2(colorBlack),),
              Text(title, style: const TextStyle(fontSize: 13),),
            ],
          ),
        ),
      ),
    );
  }
}
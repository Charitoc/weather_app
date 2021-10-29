import 'package:flutter/material.dart';

import 'dayItem.dart';
import 'models/HourlyByLatLng.dart';

class NextDaysScroll extends StatelessWidget {
  NextDaysScroll({@required this.response});

  final HourlyByLatLng response;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 24,
        itemBuilder: (ctx, i) {
          return DayItem(response: response, i: i);
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardHeartRange extends StatelessWidget {
  final String level;
  final String title;
  final String heartRateMin;
  final String heartRateMax;
  final String heartPercantageInfos;
  final String text;

  const CardHeartRange(
      {required this.level,
      required this.title,
      required this.heartRateMin,
      required this.heartRateMax,
      required this.heartPercantageInfos,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: retrieveColorFromLevel(),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
            height: 190,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: SizedBox(
                    width: 50,
                    height: 180,
                    child: Center(
                      child: Text(
                        this.level,
                        style: GoogleFonts.anton(
                            color: Colors.white, fontSize: 42),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(children: <Widget>[
                            Expanded(
                              child: Text(
                                this.heartPercantageInfos + '% max ♥',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.00),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              this.title,
                              style: GoogleFonts.anton(
                                  color: Colors.white, fontSize: 12.00),
                              textAlign: TextAlign.right,
                            )),
                          ]),
                          Text(
                            this.heartRateMin + ' - ' + this.heartRateMax + ' bpm',
                            style: GoogleFonts.anton(
                                color: Colors.white, fontSize: 12.00),
                          ),
                          Divider(color: Colors.white),
                          SizedBox(height: 10),
                          Text(this.text,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 10.00),
                              textAlign: TextAlign.justify)
                        ]),
                  ),
                )
              ],
            )),
      ),
    );
  }

  Color retrieveColorFromLevel() {
    switch (this.level) {
      case '1':
        return Colors.grey;
      case '2':
        return Colors.blueAccent;
      case '3':
        return Colors.greenAccent;
      case '4':
        return Colors.orangeAccent;
      case '5':
        return Colors.redAccent;
      default:
        return Colors.grey;
    }
  }
}

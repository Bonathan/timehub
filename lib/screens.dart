import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/material.dart';
import 'package:timehub/globals.dart' as globals;

TextEditingController? weatherLocationTextCtrl;

class ForecastSettings extends StatelessWidget {
  const ForecastSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Forecast',
            style: GoogleFonts.redHatDisplay(
                textStyle: TextStyle(
                    color: globals.trueBlack, fontWeight: FontWeight.w800)),
          ),
          centerTitle: true,
          backgroundColor: Colors.white12,
          elevation: 0,
          foregroundColor: globals.trueBlack,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Ionicons.chevron_back_outline,
              color: globals.trueBlack,
            ),
          ),
        ),
        body: Center(
          child: Container(
            margin: EdgeInsets.fromLTRB(300, 50, 300, 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  controller: weatherLocationTextCtrl,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'City, Country'),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: Container(
                      height: 35,
                      width: 75,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Icon(Ionicons.save_outline), Text('Save')],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

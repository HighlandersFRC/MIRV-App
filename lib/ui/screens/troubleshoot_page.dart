import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test/ui/screens/rover_status_page.dart';
import 'dart:async';
import 'package:test/ui/screens/rover_new_op_page.dart';

class TroubleShootingPage extends StatefulWidget {
  const TroubleShootingPage({Key? key}) : super(key: key);

  @override
  State<TroubleShootingPage> createState() => _TroubleShootingPageState();
} //TroubleShotingPage

class _TroubleShootingPageState extends State<TroubleShootingPage> {
  goOp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RoverOpPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    _goBack() {
      print("bruh");
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const StatusPage()),
      ); //Navigator.push
    } //_goBack

    return Scaffold(
      appBar: AppBar(
        title: const Text("fix it yourself"),
        actions: [
          ElevatedButton(onPressed: goOp, child: const Icon(Icons.drive_eta))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: 2000,
            height: 720,
            child: ElevatedButton(
              onPressed: _goBack,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 0, 255, 17)),
              ),
              child: Text("go back",
                  textScaleFactor: 20,
                  style: GoogleFonts.butcherman(
                      color: const Color.fromARGB(255, 141, 9, 0))),
            ),
          ),
        ], // children
      ),
    );
  } // build widget
}// _TroubleShootingPageState

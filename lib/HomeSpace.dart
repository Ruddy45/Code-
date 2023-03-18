import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:makig/home/Models.dart';
import 'package:makig/home/view.dart';

class HomeSpace extends StatelessWidget {
  const HomeSpace({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(colors: [
             Colors.cyan,
             Colors.pink,
            ]).createShader(bounds);
          },
          child: InkWell(onTap: () {
            Get.to(HomePage());
          },
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),color: Colors.black),
              height: 50,
              width: 100,
              child: Center(child: Text('Click Here', style: GoogleFonts.actor(color: Colors.white))),
            ),
          ),
        ),
      ),
    );
  }
}

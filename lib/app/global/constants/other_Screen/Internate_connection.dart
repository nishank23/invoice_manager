// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_color.dart';

class InternateConnection extends StatefulWidget {
  const InternateConnection({Key? key}) : super(key: key);

  @override
  State<InternateConnection> createState() => _InternateConnectionState();
}

class _InternateConnectionState extends State<InternateConnection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.white,
          body: WillPopScope(
            onWillPop: () {
              return Future.value(false);
            },
            child: SingleChildScrollView(
              child: Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 112,
                        width: 197,
                        // decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.logo))),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                        height: 220,
                        width: 220,

                        // decoration: BoxDecoration(image: DecorationImage(image: AssetImage(AppAsset.connectivity))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                           "No Internet Connection",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(color: AppColor.black, fontSize: 24, fontWeight: FontWeight.w500)),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                           "Plaese check your internet connection and reopen the app.",
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(color: AppColor.black, fontSize: 16, fontWeight: FontWeight.w400)),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 53,
                        width: 127,
                        decoration: BoxDecoration(color: AppColor.black, borderRadius: BorderRadius.circular(16)),
                        // ignore: sort_child_properties_last
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "Try Again",
                            style:GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 14, color: AppColor.white, fontWeight: FontWeight.w400)),
                          ),
                        ),
                        alignment: Alignment.center,
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}

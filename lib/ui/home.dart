import 'package:build_ui/component/list_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 270,
                color: Colors.amberAccent,
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Selamat Pagi, Tanti",
                        style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "Nikmati aktivitasmu bersama kami ya!",
                        style: GoogleFonts.montserrat(
                            fontSize: 16, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 40,
                  left: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Column(
                            children: [
                              Text(
                                "Riwayat Bulan",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Januari",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "120",
                                style: TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Column(
                            children: [
                              Text(
                                "Riwayat Bulan",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Januari",
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                "120",
                                style: TextStyle(fontSize: 30),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          )
        ],
      ),
    );
  }
}

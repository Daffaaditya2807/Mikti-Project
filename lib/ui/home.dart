import 'package:build_ui/component/list_color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> articleInfo = [];
  List<String> titles = ["Penanganan Pisang", "Pisang busuk"];
  int current = 0;
  final CarouselController _carouselController = CarouselController();
  double sizeWithContainer = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // articleInfo = [
    //   containerArticle("1"),
    //   containerArticle("2"),
    //   containerArticle("3")
    // ];
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    sizeWithContainer = MediaQuery.of(context).size.width * 0.9;
    print(sizeWithContainer);
  }

  @override
  Widget build(BuildContext context) {
    double p = MediaQuery.of(context).size.width * 0.87;
    print("p balap $p");
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 260,
                color: Colors.white,
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: orange,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
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
                  bottom: 20,
                  left: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Column(
                            children: [
                              Text(
                                "Riwayat Bulan",
                                style: GoogleFonts.montserrat(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Januari",
                                style: GoogleFonts.montserrat(fontSize: 12),
                              ),
                              Text(
                                "1278",
                                style: GoogleFonts.montserrat(
                                    fontSize: 30,
                                    color: orange,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: Column(
                            children: [
                              Text(
                                "Riwayat Harian",
                                style: GoogleFonts.montserrat(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "12 Jun 2023",
                                style: GoogleFonts.montserrat(fontSize: 12),
                              ),
                              Text(
                                "120",
                                style: GoogleFonts.montserrat(
                                    fontSize: 30,
                                    color: orange,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Riwayat Perpohon",
                      style: GoogleFonts.montserrat(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Selengkapnya",
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: lightGrey),
                    ),
                  ],
                ),
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return _historyPohon();
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Artikel",
                      style: GoogleFonts.montserrat(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Selengkapnya",
                      style: GoogleFonts.montserrat(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: lightGrey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                CarouselSlider(
                    items: generateContainers(titles, p),
                    carouselController: _carouselController,
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1.0,
                      height: 210,
                      aspectRatio: 16 / 9,
                      onPageChanged: (index, reason) {
                        setState(() {
                          current = index;
                        });
                      },
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> generateContainers(List<String> titles, double lebar) {
    List<Widget> containers = [];
    for (String title in titles) {
      containers.add(
        Container(
          height: 200,
          width: lebar,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300)),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 110,
                  color: Colors.amber,
                  child: Image.asset(
                    "assets/pisang1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  "Yuk jajan-jalan dan jajan pakai kode promo GRABBCA, ada diskon hingga 90% tanpa minimum transaksi lho!",
                  style: GoogleFonts.montserrat(fontSize: 12, color: lightGrey),
                )
              ],
            ),
          ),
        ),
      );
    }
    return containers;
  }

  Widget _historyPohon() {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Pohon A",
              style: GoogleFonts.montserrat(
                  fontSize: 16, fontWeight: FontWeight.normal),
            ),
            Text(
              "17 April 2024",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        const Divider()
      ],
    );
  }
}

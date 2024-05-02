import 'package:flutter/material.dart';

class GreetingScreen extends StatelessWidget {
  const GreetingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyHome(context),
    );
  }

  Widget _bodyHome(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Selamat Datang",
                      style: TextStyle(
                          fontSize: 14.0, color: Colors.grey.shade500),
                    ),
                    const Text(
                      "Caitlin Halderman",
                      style: TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(10)),
                  child: Icon(
                    Icons.widgets,
                    color: Colors.pink.shade300,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.pink.shade300,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 150, top: 30, bottom: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Big Sale",
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Dapatkan harga murah banget , mumpung lagi promo hari buruh nasional!!",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Image.asset(
                  "assets/model.png",
                  width: 230,
                  height: 220,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Menu Informasi",
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Promo Sale Baju! Besar besaran cuy buruann",
              style: TextStyle(fontSize: 14.0),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: _generateWidget(),
                  );
                } else if (constraints.maxWidth < 900) {
                  return GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: _generateWidget(),
                  );
                } else {
                  return GridView.count(
                    crossAxisCount: 6,
                    shrinkWrap: true,
                    children: _generateWidget(),
                  );
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Konfirmasi"),
                        content: const Text(
                            "Yakin ingin menolak cinta saya kamu? gak nyesell?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Iya"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Tidakkk"),
                          )
                        ],
                      );
                    },
                  );
                },
                child: const Text("Coba Tekan Saya"))
          ],
        ),
      ),
    );
  }

  List<Widget> _generateWidget() {
    return List<Widget>.generate(10, (index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.pink.shade300,
              borderRadius: BorderRadius.circular(15)),
          child: const Center(
            child: Text(
              "TES WIDGET",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    });
  }
}

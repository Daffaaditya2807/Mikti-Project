import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Orientation getOrientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return ListView(
              children: _generateWidget(),
            );
          } else if (constraints.maxWidth < 900) {
            return GridView.count(
              crossAxisCount: 2,
              children: _generateWidget(),
            );
          } else {
            return GridView.count(
              crossAxisCount: 6,
              children: _generateWidget(),
            );
          }
        },
      ),
    );
  }

  List<Widget> _generateWidget() {
    return List<Widget>.generate(10, (index) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.pink,
          height: 200,
        ),
      );
    });
  }

  Center _body(
      Size screenSize, Orientation getOrientation, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              "Size With : ${screenSize.width.toStringAsFixed(2)}  & Size Height : ${screenSize.height.toStringAsFixed(2)}"),
          Text("Screen Orientation : $getOrientation"),
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
    );
  }
}

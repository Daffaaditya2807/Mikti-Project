import 'package:build_ui/component/list_color.dart';
import 'package:build_ui/ui/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _controllerUsername = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  final FocusNode _focusNodeUsername = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Add listeners to handle focus changes
    _focusNodeUsername.addListener(() {
      setState(() {});
    });
    _focusNodePassword.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerUsername.dispose();
    _controllerPassword.dispose();
    _focusNodeUsername.dispose();
    _focusNodePassword.dispose();
    super.dispose();
  }

  Color _getTextColor(FocusNode focusNode) {
    return focusNode.hasFocus ? orange : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Text(
                "Selamat Datang",
                style: GoogleFonts.montserrat(
                    fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 280,
                child: Text(
                  "Harap konfirmasikan username dan password yang telah terdaftar",
                  style: GoogleFonts.montserrat(fontSize: 14, color: lightGrey),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Username",
                style: GoogleFonts.montserrat(
                  color: _getTextColor(
                      _focusNodeUsername), // Set text color based on focus
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                cursorColor: orange,
                controller: _controllerUsername,
                // style: TextStyle(
                //   color: _isFocused
                //       ? orange
                //       : Colors.black, // Change text color based on focus
                //   fontSize: 14,
                // ),
                focusNode: _focusNodeUsername,
                style: GoogleFonts.montserrat(
                  color: _getTextColor(
                      _focusNodeUsername), // Set text color based on focus
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    hintText: "user@gmail.com",
                    hintStyle: TextStyle(color: lightGrey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: lightGrey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: orange))),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Password",
                style: GoogleFonts.montserrat(
                  color: _getTextColor(
                      _focusNodePassword), // Set text color based on focus
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                cursorColor: orange,
                controller: _controllerPassword,
                focusNode: _focusNodePassword,
                obscureText: true,
                style: TextStyle(
                  color: _getTextColor(
                      _focusNodePassword), // Set text color based on focus
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    hintText: "************",
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.visibility_off,
                          color: _getTextColor(_focusNodePassword),
                        )),
                    hintStyle: TextStyle(color: lightGrey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: lightGrey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: orange))),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DashboardScreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: orange,
                      minimumSize: Size.fromHeight(55),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Text(
                    "Masuk",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
              Expanded(child: Container()),
              RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: "By entering my phone number , I accept",
                      style: GoogleFonts.montserrat(
                        color: lightGrey,
                        fontSize: 10,
                      ),
                      children: [
                        TextSpan(
                            text: " Grab's term of service",
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                            text: " and",
                            style: GoogleFonts.montserrat(
                              color: lightGrey,
                              fontSize: 10,
                            )),
                        TextSpan(
                            text: " Grab's term of service",
                            style: GoogleFonts.montserrat(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.w500)),
                      ])),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      )),
    );
  }
}

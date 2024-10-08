import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mac_store_app_flutter/controllers/auth_controller.dart';
import 'package:mac_store_app_flutter/views/screens/authentication/register_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();

  late String email;

  late String password;
  bool isLoading = false;

  loginUser() async {
    setState(() {
      isLoading = true;
    });
    await _authController
        .signInUsers(context: context, email: email, password: password)
        .whenComplete(() {
      _formKey.currentState!.reset();
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(.95),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("ورود به حساب کاربری",
                        style: TextStyle(
                          color: Color(0xFF0f120E),
                          fontWeight: FontWeight.bold,
                          fontSize: 23,
                          letterSpacing: 0.2,
                        )),
                    const Text("برای کاوش در دنیای انحصاری",
                        style: TextStyle(
                          color: Color(0xFF0f120E),
                          fontSize: 14,
                          letterSpacing: 0.8,
                        )),
                    Image.asset(
                      "assets/images/Illustration.png",
                      width: 200,
                      height: 200,
                    ),
                    const Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "ایمیل",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, letterSpacing: .2),
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "ایمیل را وارد کنید";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(9)),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: "ایمیل خود را وارد کنید",
                        labelStyle:
                            const TextStyle(fontSize: 14, letterSpacing: .1),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "assets/icons/email.png",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "رمز عبور را وارد کنید";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          labelText: "رمز خود را وارد کنید",
                          labelStyle:
                              const TextStyle(fontSize: 14, letterSpacing: .1),
                          suffixIcon: const Icon(Icons.visibility),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset(
                              "assets/icons/password.png",
                              width: 20,
                              height: 20,
                            ),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          loginUser();
                        }
                      },
                      child: Container(
                          width: 319,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: const LinearGradient(colors: [
                                Color(0xCC0D6EFF),
                                Color(0xFF102DE1),
                              ])),
                          child: Stack(
                            children: [
                              Positioned(
                                  right: 278,
                                  top: 19,
                                  child: Opacity(
                                    opacity: .5,
                                    child: Container(
                                      width: 60,
                                      height: 60,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                              width: 12,
                                              color: const Color(0xFF1030DE5))),
                                    ),
                                  )),
                              Positioned(
                                right: 311,
                                top: 36,
                                child: Opacity(
                                  opacity: .3,
                                  child: Container(
                                      width: 5,
                                      height: 5,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      )),
                                ),
                              ),
                              Positioned(
                                left: 15,
                                top: -10,
                                child: Opacity(
                                  opacity: .3,
                                  child: Container(
                                      width: 20,
                                      height: 20,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),
                              ),
                              Center(
                                  child: isLoading
                                      ? const CircularProgressIndicator(
                                          color: Colors.white,
                                        )
                                      : const Text(
                                          "ورود به حساب",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white),
                                        )),
                            ],
                          )),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          " کاربر جدید هستید؟ ",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, letterSpacing: .5),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return RegisterScreen();
                            }));
                          },
                          child: const Text("ثبت نام",
                              style: TextStyle(
                                  color: Color(0xFF103DE5),
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

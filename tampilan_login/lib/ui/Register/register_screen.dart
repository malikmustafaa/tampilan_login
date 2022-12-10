// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tampilan_login/constants/style_constant.dart';
import 'package:tampilan_login/constants/text.dart';
import 'package:tampilan_login/ui/login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscureText = true;
  bool _isVisible = true;
  bool valNamaLengkap = false;
  bool valUserID = false;
  bool valEmail = false;
  bool valNomorHP = false;
  bool valPassword = false;
  bool valKonfirmasiPassword = false;
  bool alertCheck = false;
  TextEditingController namalengkap = TextEditingController();
  TextEditingController userID = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController nomorHP = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController konfirmasiPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: Colors.grey.shade100,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/header_login.png',
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset("assets/logo.png", width: size.width * 0.25),
            ),
            SizedBox(height: size.height * 0.03),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      SetText.register,
                      style: ttlStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: size.height * 0.00),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      SetText.subRegister,
                      style: subttlStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      SetText.namalengkap,
                      textAlign: TextAlign.left,
                      style: pleacehStyle,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: TextField(
                      controller: namalengkap,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: SetText.namalengkap,
                        errorText: valNamaLengkap
                            ? SetText.namalengkap + '' + SetText.nextval
                            : null,
                        hintStyle: valStyle,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: borderStyle,
                        ),
                      ),
                      style: tfStyle,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      SetText.userID,
                      textAlign: TextAlign.left,
                      style: pleacehStyle,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: TextField(
                      controller: userID,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: SetText.userID,
                        errorText: valUserID
                            ? SetText.userID + '' + SetText.nextval
                            : null,
                        hintStyle: valStyle,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: borderStyle,
                        ),
                      ),
                      style: tfStyle,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      SetText.email,
                      textAlign: TextAlign.left,
                      style: pleacehStyle,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: TextField(
                      controller: email,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        hintText: SetText.email,
                        errorText: valEmail
                            ? SetText.email + '' + SetText.nextval
                            : null,
                        hintStyle: valStyle,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: borderStyle,
                        ),
                      ),
                      style: tfStyle,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      SetText.nomorHP,
                      textAlign: TextAlign.left,
                      style: pleacehStyle,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: TextField(
                      inputFormatters: <TextInputFormatter>[
                        LengthLimitingTextInputFormatter(12),
                      ],
                      controller: nomorHP,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: SetText.nomorHP,
                        errorText: valNomorHP
                            ? SetText.nomorHP + '' + SetText.nextval
                            : null,
                        hintStyle: valStyle,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: borderStyle,
                        ),
                      ),
                      style: tfStyle,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      SetText.password,
                      textAlign: TextAlign.left,
                      style: pleacehStyle,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: TextField(
                      controller: password,
                      decoration: InputDecoration(
                        hintText: SetText.password,
                        errorText: valPassword
                            ? SetText.password + '' + SetText.nextval
                            : null,
                        hintStyle: valStyle,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: borderStyle,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: _toggle,
                          child: Icon(
                            _isVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: size.width * 0.06,
                            color: defaultColor,
                          ),
                        ),
                      ),
                      obscureText: _obscureText,
                      style: tfStyle,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      SetText.konfirmasiPassword,
                      textAlign: TextAlign.left,
                      style: pleacehStyle,
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: TextField(
                      controller: konfirmasiPassword,
                      decoration: InputDecoration(
                        hintText: SetText.konfirmasiPassword,
                        errorText: valKonfirmasiPassword
                            ? SetText.konfirmasiPassword + '' + SetText.nextval
                            : null,
                        hintStyle: valStyle,
                        enabledBorder: UnderlineInputBorder(
                          borderSide: borderStyle,
                        ),
                        suffixIcon: GestureDetector(
                          onTap: _toggle,
                          child: Icon(
                            _isVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: size.width * 0.06,
                            color: defaultColor,
                          ),
                        ),
                      ),
                      obscureText: _obscureText,
                      style: tfStyle,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Container(
                    alignment: Alignment.centerRight,
                    // margin: const EdgeInsets.symmetric(horizontal: 40),
                    child: RaisedButton(
                      onPressed: _register,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(80.0)),
                      textColor: whiteColor,
                      padding: const EdgeInsets.all(0),
                      child: Container(
                        alignment: Alignment.center,
                        height: size.height * 0.062,
                        width: size.width * 0.9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(80.0),
                            gradient: const LinearGradient(
                                colors: [defaultColor, defaultColor])),
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          SetText.register.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.06),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    SetText.infosingin,
                    style: infosinginStyle,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (content) => const LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      SetText.singin,
                      style: singinStyle,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: size.height * 0.06),
          ],
        ),
      ),
    ));
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      _isVisible = !_isVisible;
    });
  }

  void _register() async {
    setState(() {
      namalengkap.text.isEmpty ? valNamaLengkap = true : valNamaLengkap = false;
      userID.text.isEmpty ? valUserID = true : valUserID = false;
      email.text.isEmpty ? valEmail = true : valEmail = false;
      nomorHP.text.isEmpty ? valNomorHP = true : valNomorHP = false;
      password.text.isEmpty ? valPassword = true : valPassword = false;
      konfirmasiPassword.text.isEmpty
          ? valKonfirmasiPassword = true
          : valKonfirmasiPassword = false;
    });

    if (email.text.isNotEmpty && password.text.isNotEmpty) {
      // hit ke BE
      _alert(alertCheck = true);
    } else {
      _alert(alertCheck = false);
    }
  }

  void _alert(alertCheck) async {
    Size size = MediaQuery.of(context).size;
    Alert(
        context: context,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                alertCheck ? SetText.a_ttlsuccess : SetText.a_ttlfield,
                textAlign: TextAlign.left,
                style: alertttlStyle,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              alertCheck ? SetText.a_descsuccess : SetText.a_descfield,
              textAlign: TextAlign.left,
              style: alerttextdescStyle,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            width: size.width * 0.28,
            child: Text(
              SetText.oke,
              style: alerttextStyle,
            ),
            onPressed: () => {
              Navigator.pop(context),
            },
            gradient:
                const LinearGradient(colors: [defaultColor, defaultColor]),
          )
        ]).show();
  }
}

buildInputDecoration(IconData lock, String s) {}

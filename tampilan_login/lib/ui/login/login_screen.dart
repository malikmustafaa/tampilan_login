// ignore_for_file: deprecated_member_use, prefer_final_fields, unused_local_variable, avoid_print, unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tampilan_login/constants/style_constant.dart';
import 'package:tampilan_login/constants/text.dart';
import 'package:tampilan_login/ui/Register/register_screen.dart';
import 'package:tampilan_login/ui/login/bg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;
  bool _isVisible = true;
  bool valUserId = false;
  bool valPassword = false;
  bool _userIdError = false;
  bool _passError = false;
  bool alertCheck = false;

  String textEmpty = "mohon diisi";
  String _textUserIdError = "";
  String _textPassError = "";

  bool _doValidate() {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regexUserID = RegExp(pattern as String);
    RegExp regexPass = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,32}$');
    bool _success = true;

    String _userID = _userIdController.text;
    String _pass = _passwordController.text;

    if (_userID.isEmpty) {
      setState(
        () {
          _textUserIdError = textEmpty;
          _userIdError = true;
        },
      );
      _success = false;
    } else if (_userID.length < 8) {
      setState(
        () {
          _userIdError = true;
          _textUserIdError = "minimal 8 karakter";
        },
      );
      _success = false;
    } else {
      setState(
        () {
          _userIdError = false;
        },
      );
    }

    if (_pass.isEmpty) {
      setState(
        () {
          _textPassError = textEmpty;
          _passError = true;
        },
      );
      _success = false;
    } else if (!regexPass.hasMatch(_pass)) {
      setState(
        () {
          _passError = true;
          _textPassError = " minimal 8 karakter kombinasi huruf dan angka";
        },
      );
      _success = false;
    } else {
      setState(
        () {
          _passError = false;
        },
      );
    }

    return _success;
  }

  void _login() async {
    if (_doValidate()) {
      print("object === >");
      // proses kirim data ke BE
      _alert(alertCheck = true);
    }
  }

  TextEditingController userId = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          const Background(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  // padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    SetText.login,
                    style: ttlStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                SizedBox(height: size.height * 0.003),
                Container(
                  alignment: Alignment.centerLeft,
                  // padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    SetText.subLogin,
                    style: subttlStyle,
                    textAlign: TextAlign.left,
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
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(' '),
                      FilteringTextInputFormatter.allow(
                        RegExp(
                          (r'[a-z^A-Z^0-9]'),
                        ),
                      ),
                      //Regex for accepting only alphanumeric characters
                    ],
                    controller: _userIdController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: SetText.userID,
                      errorText: _userIdError
                          ? SetText.user + ' ' + _textUserIdError
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
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: SetText.password,
                      errorText: _passError
                          ? SetText.password + ' ' + _textPassError
                          : null,
                      hintStyle: valStyle,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: borderStyle,
                      ),
                      suffixIcon: GestureDetector(
                        onTap: _toggle,
                        child: Icon(
                          _isVisible ? Icons.visibility_off : Icons.visibility,
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
                  child: RaisedButton(
                    onPressed: _login,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    textColor: whiteColor,
                    padding: const EdgeInsets.all(0),
                    child: Container(
                      alignment: Alignment.center,
                      height: size.height * 0.062,
                      width: size.width * 0.95,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: const LinearGradient(
                          colors: [
                            defaultColor,
                            defaultColor,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(0),
                      child: Text(
                        SetText.login.toUpperCase(),
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
          Positioned(
            bottom: size.height * 0.02,
            right: size.width * 0.22,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  SetText.infosingup,
                  style: infosingupStyle,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (content) => const RegisterScreen(),
                      ),
                    );
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //   SnackBar(
                    //     content: Text(SetText.gosingup),
                    //     action: SnackBarAction(
                    //         label: SetText.oke, onPressed: () {}),
                    //   ),
                    // );
                  },
                  child: Text(
                    SetText.singup,
                    style: singupStyle,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggle() {
    setState(
      () {
        _obscureText = !_obscureText;
        _isVisible = !_isVisible;
      },
    );
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
              alertCheck ? SetText.login_descsuccess : SetText.a_descfield,
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
            gradient: const LinearGradient(
              colors: [
                defaultColor,
                defaultColor,
              ],
            ),
          )
        ]).show();
  }
}

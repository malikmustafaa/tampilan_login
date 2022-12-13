// ignore_for_file: deprecated_member_use, non_constant_identifier_names, avoid_print

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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _namalengkapController = TextEditingController();
  final _userIdController = TextEditingController();
  final _emailController = TextEditingController();
  final _nomorHpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _konfirmasiPasswordController = TextEditingController();

  bool _obscureText = true;
  bool _isVisible = true;
  bool valNamaLengkap = false;
  bool valUserID = false;
  bool valEmail = false;
  bool valNomorHP = false;
  bool valPassword = false;
  bool valKonfirmasiPassword = false;
  bool alertCheck = false;
  bool _namaLengkapError = false;
  bool _userIdError = false;
  bool _emailError = false;
  bool _nomorHpError = false;
  bool _passError = false;
  bool _passKonfirmError = false;

  String textEmpty = "mohon diisi";
  String _textUserIdError = "";
  String _textNamaLengkapError = "";
  String _textEmailError = "";
  String _textNomorHpError = "";
  String _textPassError = "";
  String _textPassKonfirmError = "";

  bool _doValidate() {
    Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regexEmail = RegExp(pattern as String);
    RegExp regexPass = RegExp(r'^(?=.*?[a-z])(?=.*?[0-9]).{8,32}$');
    bool _success = true;

    String _namaLengkap = _namalengkapController.text;
    String _userID = _userIdController.text;
    String _email = _emailController.text;
    String _nomorHp = _nomorHpController.text;
    String _pass = _passwordController.text;
    String _passConfirm = _konfirmasiPasswordController.text;

    if (_namaLengkap.isEmpty) {
      setState(
        () {
          _textNamaLengkapError = textEmpty;
          _namaLengkapError = true;
        },
      );
      _success = false;
    } else {
      setState(
        () {
          _namaLengkapError = false;
        },
      );
    }

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

    if (_email.isEmpty) {
      setState(
        () {
          _textEmailError = textEmpty;
          _emailError = true;
        },
      );
      _success = false;
    } else if (!regexEmail.hasMatch(_email)) {
      setState(
        () {
          _emailError = true;
          _textEmailError = "masukkan dengan benar";
        },
      );
      _success = false;
    } else {
      setState(
        () {
          _emailError = false;
        },
      );
    }

    if (_nomorHp.isEmpty) {
      setState(
        () {
          _textNomorHpError = textEmpty;
          _nomorHpError = true;
        },
      );
      _success = false;
    } else if (_nomorHp.length < 8) {
      setState(
        () {
          _nomorHpError = true;
          _textNomorHpError = "minimal 8 karakter";
        },
      );
      _success = false;
    } else {
      setState(
        () {
          _nomorHpError = false;
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

    if (_passConfirm.isEmpty) {
      setState(
        () {
          _textPassKonfirmError = textEmpty;
          _passKonfirmError = true;
        },
      );
      _success = false;
    } else if (_passConfirm != _pass) {
      setState(
        () {
          _passKonfirmError = true;
          _textPassKonfirmError = " tidak sama";
        },
      );
      _success = false;
    } else {
      setState(
        () {
          _passKonfirmError = false;
        },
      );
    }

    return _success;
  }

  void _register() async {
    if (_doValidate()) {
      print("object === >");
      // proses kirim data ke BE
      _alert(alertCheck = true);
    }
  }

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
                '',
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Image.asset("assets/logo.png", width: size.width * 0.25),
            ),
            SizedBox(height: size.height * 0.03),
            Column(
              children: [
                Form(
                  key: _formKey,
                  child: Container(
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
                            controller: _namalengkapController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: SetText.namalengkap,
                              errorText: _namaLengkapError
                                  ? SetText.namalengkap +
                                      ' ' +
                                      _textNamaLengkapError
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
                            // maxLength: 90,
                            // minLines: 3,
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
                                  ? SetText.userID + ' ' + _textUserIdError
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
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(' '),
                            ],
                            controller: _emailController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              hintText: SetText.email,
                              errorText: _emailError
                                  ? SetText.email + ' ' + _textEmailError
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
                              LengthLimitingTextInputFormatter(15),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            controller: _nomorHpController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: SetText.nomorHP,
                              errorText: _nomorHpError
                                  ? SetText.nomorHP + ' ' + _textNomorHpError
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
                              hintText: SetText.password, // _textPassError
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
                            controller: _konfirmasiPasswordController,
                            decoration: InputDecoration(
                              hintText: SetText.konfirmasiPassword,
                              errorText: _passKonfirmError
                                  ? SetText.konfirmasiPassword +
                                      ' ' +
                                      _textPassKonfirmError
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
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          // margin: const EdgeInsets.symmetric(horizontal: 40),
                          child: RaisedButton(
                            onPressed: _register,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                80.0,
                              ),
                            ),
                            textColor: whiteColor,
                            padding: const EdgeInsets.all(0),
                            child: Container(
                              alignment: Alignment.center,
                              height: size.height * 0.062,
                              width: size.width * 0.9,
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
                )
              ],
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
            alertCheck ? SetText.register_descsuccess : SetText.a_descfield,
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
      ],
    ).show();
  }
}

@override
Widget build(BuildContext context) {
  // ignore: todo
  // TODO: implement build
  throw UnimplementedError();
}

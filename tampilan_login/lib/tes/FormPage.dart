// ignore_for_file: file_names
// // ignore_for_file: file_names, avoid_print, deprecated_member_use, duplicate_import, unnecessary_import, unused_import, unused_field

// import 'package:flutter/material.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:rflutter_alert/rflutter_alert.dart';
// import 'package:tampilan_login/tes/bg.dart';
// import 'package:tampilan_login/ui/login/login_screen.dart';
// import 'package:tampilan_login/constants/style_constant.dart';

// class FormPage extends StatefulWidget {
//   const FormPage({Key? key}) : super(key: key);

//   @override
//   _FormPageState createState() => _FormPageState();
// }

// class _FormPageState extends State<FormPage> {
//   final bool _obscureText = true;
//   final bool _isVisible = true;
//   bool valNamaLengkap = false;
//   bool valUserID = false;
//   bool valEmail = false;
//   bool valNomorHP = false;
//   bool valPassword = false;
//   bool valKonfirmasiPassword = false;
//   bool alertCheck = false;
//   //TextController to read text entered in text field
//   TextEditingController password = TextEditingController();
//   TextEditingController confirmpassword = TextEditingController();
//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formkey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircleAvatar(
//                   radius: 70,
//                   child: Image.network(
//                       "https://protocoderspoint.com/wp-content/uploads/2020/10/PROTO-CODERS-POINT-LOGO-water-mark-.png"),
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(bottom: 15, left: 10, right: 10),
//                   child: TextFormField(
//                     keyboardType: TextInputType.text,
//                     decoration: buildInputDecoration(Icons.person, "Full Name"),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please Enter Name';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       valUserID = value! as bool;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(bottom: 15, left: 10, right: 10),
//                   child: TextFormField(
//                     keyboardType: TextInputType.text,
//                     decoration: buildInputDecoration(Icons.email, "Email"),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please a Enter';
//                       }
//                       if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                           .hasMatch(value)) {
//                         return 'Please a valid Email';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       valEmail = value! as bool;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(bottom: 15, left: 10, right: 10),
//                   child: TextFormField(
//                     keyboardType: TextInputType.number,
//                     decoration: buildInputDecoration(Icons.phone, "Phone No"),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please enter phone no ';
//                       }
//                       return null;
//                     },
//                     onSaved: (value) {
//                       valNomorHP = value! as bool;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(bottom: 15, left: 10, right: 10),
//                   child: TextFormField(
//                     controller: password,
//                     keyboardType: TextInputType.text,
//                     decoration: buildInputDecoration(Icons.lock, "Password"),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please a Enter Password';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.only(bottom: 15, left: 10, right: 10),
//                   child: TextFormField(
//                     controller: confirmpassword,
//                     obscureText: true,
//                     keyboardType: TextInputType.text,
//                     decoration:
//                         buildInputDecoration(Icons.lock, "Confirm Password"),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Please re-enter password';
//                       }
//                       print(password.text);
//                       print(confirmpassword.text);
//                       if (password.text != confirmpassword.text) {
//                         return "Password does not match";
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   width: 200,
//                   height: 50,
//                   child: RaisedButton(
//                     color: Colors.redAccent,
//                     onPressed: () {
//                       if (_formkey.currentState!.validate()) {
//                         print("successful");
//                         return;
//                       } else {
//                         print("UnSuccessfull");
//                       }
//                     },
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(50.0),
//                         side: const BorderSide(color: Colors.blue, width: 2)),
//                     textColor: Colors.white,
//                     child: const Text("Submit"),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// buildInputDecoration(IconData phone, String s) {}

// import 'package:flutter/material.dart';
// import 'package:tampilan_login/constants/style_constant.dart';

// class Background extends StatelessWidget {
//   const Background({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       backgroundColor: whiteColor,
//       body: Column(
//         children: <Widget>[
//           const ImgHeaderLogin(),
//           Expanded(
//             child: Container(),
//           ),
//         ],
//       ),
//     );
//   }
//   // ignore_for_file: file_names

//   InputDecoration buildInputDecoration(IconData icons, String hinttext) {
//     return InputDecoration(
//       hintText: hinttext,
//       prefixIcon: Icon(icons),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(25.0),
//         borderSide: const BorderSide(color: Colors.green, width: 1.5),
//       ),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(25.0),
//         borderSide: const BorderSide(
//           color: Colors.blue,
//           width: 1.5,
//         ),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(25.0),
//         borderSide: const BorderSide(
//           color: Colors.blue,
//           width: 1.5,
//         ),
//       ),
//     );
//   }
// }

// class ImgHeaderLogin extends StatelessWidget {
//   const ImgHeaderLogin({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Stack(
//       children: <Widget>[
//         Align(
//           alignment: Alignment.topLeft,
//           // ignore: avoid_unnecessary_containers
//           child: Container(
//             child: Image.asset(
//               'assets/header_login.png',
//             ),
//           ),
//         ),
//         Positioned(
//           top: size.height * 0.08,
//           right: size.width * 0.39,
//           child: Image.asset("assets/logo.png", width: size.width * 1000),
//         ),
//       ],
//     );
//   }
// }

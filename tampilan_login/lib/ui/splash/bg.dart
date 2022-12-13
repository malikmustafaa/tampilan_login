// ignore_for_file: avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:tampilan_login/constants/style_constant.dart';

class Background extends StatelessWidget {
  const Background({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: Column(
        children: <Widget>[
          const ImgHeaderSplash(),
          Expanded(
            child: Container(),
          ),
          const ImgFooterSplash(),
        ],
      ),
    );
  }
}

class ImgHeaderSplash extends StatelessWidget {
  const ImgHeaderSplash({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: Container(
            child: Image.asset(
              '',
            ),
          ),
        )
      ],
    );
  }
}

// image footer splash
class ImgFooterSplash extends StatelessWidget {
  const ImgFooterSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            child: Image.asset(
              '',
            ),
          ),
        )
      ],
    );
  }
}

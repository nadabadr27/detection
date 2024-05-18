// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:detection/component/component.dart';
import 'package:detection/constant/constant.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../drawer/drawer.dart';
import '../showdoctor_screen/docor drawer/docordrewer.dart';

class result extends StatefulWidget {
  const result({super.key, required this.responseValue});

  final String responseValue;
  @override
  State<result> createState() => _resultState();
}

class _resultState extends State<result> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer:drawer (),
        appBar: AppBar(
          title: text(
              text: 'Check up', color: white, size: 20, weiht: FontWeight.w500),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Container(
                width: 250,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(widget.responseValue,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: widget.responseValue == 'Mild'
                                ? Text(
                                    "You have mild symptoms of alzahimer. Please consult a doctor for further advice.",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ))
                                : widget.responseValue == 'ModerateDemented'
                                    ? Text(
                                        "You have ModerateDemented symptoms of alzahimer. Please consult a doctor for further advice.",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ))
                                    : widget.responseValue == 'NonDemented'
                                        ? Text(
                                            "You have NonDemented symptoms of alzahimer. Please consult a doctor for further advice.",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ))
                                        : widget.responseValue ==
                                                'VeryMildDemented'
                                            ? Text(
                                                "You have VeryMildDemented symptoms of alzahimer. Please consult a doctor for further advice.",
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ))
                                            : Text(
                                                "Please GO scan Your image then retry"),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

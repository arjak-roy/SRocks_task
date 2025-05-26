import 'package:flutter/material.dart';
import 'package:s_rocks/Models/service.dart';

class Servicepage extends StatefulWidget {
  final serviceModel service;
  const Servicepage({super.key, required this.service});

  @override
  State<Servicepage> createState() => _ServicepageState();
}

class _ServicepageState extends State<Servicepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(widget.service.serviceName.toString()),
      ),
      body: Center(
        child: Text("You tapped on ${widget.service.serviceName}"),
      ),  
    );
  }
}
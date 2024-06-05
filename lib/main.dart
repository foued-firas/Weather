import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Weather(),);
  }
}
class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(children : [
        Icon(Icons.location_pin,color: Colors.grey,),
          Text("Gabes",style: TextStyle(fontSize: 20,color: Colors.grey )),
            ],),
  
          Lottie.asset("assets/rain.json"),
          const Text("15°",style: TextStyle(fontSize: 35,fontWeight:FontWeight.bold ) ,)
          
        ],),
      ),
    );
  }
}


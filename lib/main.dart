//import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

import 'dart:async';


import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';

void main()async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade900),
        useMaterial3: true,
      ),

      home: const MyHomePage(title:'The BMI APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
      var wt=TextEditingController();
      var htf=TextEditingController();
      var hef=TextEditingController();
      var result = "";
      var cr=Colors.blue.shade500;
      var msg="";
      var ic=FaIcon(FontAwesomeIcons.faceSmile,size: 50,color: Colors.grey.shade300,);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body:
     AnimatedContainer(
       duration: Duration(seconds: 2),
       color:cr,


       child: Center(
         child:SingleChildScrollView(
           scrollDirection: Axis.vertical,
           child: Container(

             width: 350,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               color: Colors.grey.shade300,
                 boxShadow: [
                  BoxShadow(
                    spreadRadius: 3,
                    blurRadius: 5,


                  )
                 ]

             ),
           
           
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Text('BMI',style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 30
                   ),),
                   SizedBox(height: 15,),
                   TextField(
                     controller: wt,
           
                     decoration: InputDecoration(
           
                         border: OutlineInputBorder(   ),
                       label: Text('Enter Your Weight in kg'),
                       prefixIcon: Icon(Icons.line_weight)
                     ),
                     keyboardType: TextInputType.number,
                   ),
                   SizedBox(height: 15,),
                   TextField(
                     controller: htf,
                     decoration: InputDecoration(
                         border: OutlineInputBorder(   ),
                         label: Text('Enter Your height in feet'),
                         prefixIcon: Icon(Icons.height)
                     ),
                     keyboardType: TextInputType.number,
                   ),
                   SizedBox(height: 15,),
                   TextField(
                     controller: hef,
           
                     decoration: InputDecoration(
                       border: OutlineInputBorder(   ),
                         label: Text('Enter Your height in inch'),
                         prefixIcon: Icon(Icons.height)
                     ),
                     keyboardType: TextInputType.number,
                   ),
                   SizedBox(height: 15,),
                   ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.blue,
                         foregroundColor: Colors.white70,
                         textStyle: TextStyle(
                           fontWeight: FontWeight.bold
                         )
                       ),
                       onPressed: (){
                     var wtv=wt.text.toString();
                     var htfv=htf.text.toString();
                     var hefv=hef.text.toString();
                     if(wtv !="" && htfv != "" && hefv != "")
                     {
                            var iwt=int.parse(wtv);
                            var iht=int.parse(htfv);
                            var ift=int.parse(hefv);
                            var ti=(iht*12) + ift;
                            var cm=ti*2.54;
                            var tm = cm/100;
                            var bmi = iwt/(tm*tm);
                            if(bmi>25){
                              msg="Overwaight";
                              cr=Colors.orange;
                             ic= FaIcon(FontAwesomeIcons.faceSadCry,color: Colors.orange,size: 50,);


                            }
                            else if(bmi<18){
                              msg="Underwaighted";
                              cr=Colors.red;
                             ic= FaIcon(FontAwesomeIcons.faceSadCry,color: Colors.red,size: 50);


                              setState(() {
           
                              });
                            }
                            else{
                              msg="You are healthy";
                              ic=FaIcon(FontAwesomeIcons.faceSmile,color: Colors.green,size: 50,);


                              cr=Colors.green;
                              setState(() {
           
                              });
                            }
                            setState(() {
                              result='   $msg \n Your BMI is: ${bmi.toStringAsFixed(2)}';
                              setState(() {
           
                              });
                            });
                     }else {
                       result='Please enter value';

                       setState(() {

                       });
                     }
           
           
                   },
           
                       child: Text('Calculate',)),
                   SizedBox(height: 15,),
                   Text(result,style: TextStyle(
                     fontSize: 16,

                   ),),
                   SizedBox(height: 15,),

                  ic
           
           
                 ],
           
               ),
             ),
           ),
         ),
       ),
     )

    );

  }
}

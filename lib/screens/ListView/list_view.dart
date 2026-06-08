import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/MultiProviders/Providers/provider3.dart';
import 'package:provider/provider.dart';


class ListViewClass extends StatelessWidget {
  const ListViewClass({super.key});

  @override
  Widget build(BuildContext context) {
    return
     Scaffold(
   appBar: AppBar(backgroundColor: Colors.teal,
   ),

   body:
   SizedBox(
    height: 200,
    width: 200,
     child: ListView(
     padding: EdgeInsets.all(10),   
     scrollDirection: Axis.horizontal,
     
      children: [
       
     
        Container(
          height: 100,
          margin: EdgeInsets.symmetric(vertical: 20),
          color: Colors.pink,
        ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
          Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
     
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
     
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
            Container(
          height: 100,
          margin: EdgeInsets.symmetric(vertical: 20),
          color: Colors.pink,
        ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
          Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
     
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
     
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
         Container(
          color: Colors.red,
          width: 50,
          margin: EdgeInsets.symmetric(horizontal: 5),
         ),
     
          Consumer<Provider3>(
                builder: (context, provider, child) {
                  return Text(
                    provider.count.toString(),
                    style: Theme.of(context).textTheme.displayLarge,
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Provider.of<Provider3>(context, listen: false).increment();
                },
                child: Text('Counter 1 Increment'),
              ),
      ],
     ),
   )
   
   

    );
 
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/ListView/list_view.dart';
import 'package:flutter_application_1/screens/MultiProviders/Providers/provider1.dart';
import 'package:flutter_application_1/screens/MultiProviders/Providers/provider2.dart';
import 'package:flutter_application_1/screens/MultiProviders/Providers/provider3.dart';
import 'package:provider/provider.dart';

class HomeScreenM extends StatelessWidget {
  const HomeScreenM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Center(
        child: Column(
          children: [
            Consumer<Provider1>(
              builder: (context, provider, child) {
                return Text(
                  provider.count.toString(),
                  style: Theme.of(context).textTheme.displayLarge,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<Provider1>(context, listen: false).increment();
              },
              child: Text('Counter 1 Increment'),
            ),

            Consumer<Provider2>(
              builder: (context, provider, child) {
                return Text(
                  provider.count.toString(),
                  style: Theme.of(context).textTheme.displayLarge,
                );
              },
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<Provider2>(context, listen: false).increment();
              },
              child: Text('Counter 2 Increment'),
            ),

           
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
                    create:(context)=>Provider3(),
                    child: ListViewClass(),
                  )),
                );
              },
              child: Text('NextScreen'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class Multiplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          'Multiplication',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          int multiplication = index + 1;

          return ListTile(
            title: Text('$multiplication x 1 = ${multiplication * 1}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$multiplication x 2 = ${multiplication * 2}'),
                Text('$multiplication x 3 = ${multiplication * 3}'),
                Text('$multiplication x 4 = ${multiplication * 4}'),
                Text('$multiplication x 5 = ${multiplication * 5}'),
                Text('$multiplication x 6 = ${multiplication * 6}'),
                Text('$multiplication x 7 = ${multiplication * 7}'),
                Text('$multiplication x 8 = ${multiplication * 8}'),
                Text('$multiplication x 9 = ${multiplication * 9}'),
                Divider(),
              ],
            ),
          );
        },
      ),
    );
  }
}

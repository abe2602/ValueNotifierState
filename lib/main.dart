import 'package:flutter/material.dart';
import 'package:state_example/new_way/new_way_page.dart';

import 'old_way/old_way_page.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const NewWayPage(),
              ),
            ),
            child: const Text('NEW WAY'),
          ),
          const SizedBox(
            height: 50,
          ),
          MaterialButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const OldWayPage(),
              ),
            ),
            child: const Text('OLD WAY'),
          ),
        ],
      ),
    );
  }
}

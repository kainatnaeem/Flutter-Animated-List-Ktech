import 'package:animatedlistflutterbyktech/animatedlist.dart';
import 'package:animatedlistflutterbyktech/provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (_) =>
  ListProvider(),
    child:MaterialApp(
      title: 'Animated List',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: AnimatedListByKtech(),
    ) 
    );
    
     
  }
}



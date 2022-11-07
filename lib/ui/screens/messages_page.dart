import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';


class MessagesPage extends StatefulWidget {
  const MessagesPage({Key key}) : super(key: key);

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
   return Scaffold(
            backgroundColor: Colors.white,

      body: Center(
        child: Text('Messages Page'),
      ),
    );
  }
}
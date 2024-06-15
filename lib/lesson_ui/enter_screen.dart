import 'package:flutter/material.dart';
import 'package:travel_app/lesson_ui/instagram_ui.dart';

void main(List<String> args) {
  runApp(
    EnterScreen()
  );
}

class EnterScreen extends StatelessWidget {
  const EnterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('This is enter screen', style: TextStyle(color: Colors.black),),
            ElevatedButton(onPressed: () => {
              Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const InstagramUi(),
              ),
            )
            }, child: Text(
              'Next screen',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ))
        ],),
      )
    );
  }
}

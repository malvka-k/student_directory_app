import 'package:flutter/material.dart';

class Studentlogin extends StatelessWidget {
  const Studentlogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 198, 194, 191),
      appBar: AppBar(
        title: Center(child: Text("Student directory")),
        backgroundColor: const Color.fromARGB(255, 200, 121, 17),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ignore: sort_child_properties_last
        },
        // ignore: sort_child_properties_last
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 230, 169, 64),
      ),
    );
  }
}

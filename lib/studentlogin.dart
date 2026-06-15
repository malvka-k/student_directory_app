import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:student_directory_app/service.dart';

class Studentlogin extends StatefulWidget {
  @override
  State<Studentlogin> createState() => _StudentloginState();
}

class _StudentloginState extends State<Studentlogin> {
  TextEditingController name = TextEditingController();

  TextEditingController rollno = TextEditingController();

  TextEditingController course = TextEditingController();

  void editbox(DocumentSnapshot doc) {
    name.text = doc["Name"];
    rollno.text = doc["RollNo"];
    course.text = doc["Course"];
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          children: [
            Text(
              "UPDATE STUDENT INFO",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Student name",
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            TextField(
              controller: rollno,
              decoration: InputDecoration(
                hintText: "Roll No",
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            TextField(
              controller: course,
              decoration: InputDecoration(
                hintText: "Course",
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                updatestudent(
                  doc.id,
                  name.text,
                  rollno.text,
                  course.text,
                  context,
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(300, 60),
                backgroundColor: const Color.fromARGB(255, 232, 109, 48),
                foregroundColor: Colors.black,
              ),

              child: Text("Update"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Getstudents(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Text("No data"));
          }
          final data = snapshot.data!.docs;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(data[index]["Name"]),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data[index]["RollNo"]),
                    Text(data[index]["Course"]),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        editbox(data[index]);
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        Deletestudent(data[index].id, context);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      backgroundColor: const Color.fromARGB(255, 198, 194, 191),
      appBar: AppBar(
        title: Center(child: Text("Student directory")),
        backgroundColor: const Color.fromARGB(255, 200, 121, 17),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text("Add student"),
                content: Column(
                  mainAxisSize: .min,
                  children: [
                    TextField(
                      controller: name,
                      decoration: InputDecoration(
                        hintText: "student name",
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    TextField(
                      controller: rollno,
                      decoration: InputDecoration(
                        hintText: "Roll No",
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    TextField(
                      controller: course,
                      decoration: InputDecoration(
                        hintText: "Course",
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        {
                          addstudent(
                            name.text,
                            rollno.text,
                            course.text,
                            context,
                          );
                          name.clear();
                          rollno.clear();
                          course.clear();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(300, 60),
                        backgroundColor: const Color.fromARGB(
                          255,
                          232,
                          109,
                          48,
                        ),
                        foregroundColor: Colors.black,
                      ),
                      child: Text("Add"),
                    ),
                  ],
                ),
              );
            },
          );
          // ignore: sort_child_properties_last
        },
        // ignore: sort_child_properties_last
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 230, 169, 64),
      ),
    );
  }
}

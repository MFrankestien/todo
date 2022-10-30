import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Const/Const.dart';
import '../sqlflite/db.helper.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  //full of States
  final key = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController taskController = TextEditingController();
  DataBaseHelper? db;
  bool isopen = false;

  @override
  void initState() {
    db = DataBaseHelper();
    db!.createDataBase();
    isopen = false;
  }

  @override
  void dispose() {
    timeController.clear();
    taskController.clear();
    dateController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // build ui
    return Scaffold(
      key: key,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.note_alt_rounded),
        onPressed: () {
          key.currentState!.showBottomSheet((context) {
            return Container(
                width: double.infinity,
                color: Colors.cyan,
                padding: EdgeInsets.all(20),
                // height: 200,
                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                        color: Colors.grey[100]
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'Enter the task '),
                                controller: taskController,
                                onTap: () {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'Enter the Time'),
                                controller: timeController,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    timeController.text = value!.format(context);
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'data must not be empty ';
                                  }
                                  print(value);
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                    hintText: 'Enter the Date'),
                                controller: dateController, //
                                onTap: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2100),
                                  ).then((value) {
                                    dateController.text =
                                        DateFormat.yMMMMd().format(value!);
                                  });
                                },
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'data must not be empty ';
                                  }
                                  print(value);
                                },
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  db!
                                      .insertToDataBase(
                                      task: taskController.text,
                                      time: timeController.text,
                                      date: dateController.text)
                                      .then((value) {
                                    Navigator.pop(context);
                                    timeController.clear();
                                    taskController.clear();
                                    dateController.clear();
                                    //
                                  });
                                },
                                child: Text('Submit'))
                          ],
                        ),
                      ),
                    )
                  ],
                ));
          });
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("To do App",style:TextStyle(fontSize: 25),),
        centerTitle: true,
      ),
      body:  ListView.separated(
          itemBuilder:(context,index){
            return  Container(
              child:  ListTile(
                  title: Row(


                    children: [
                      CircleAvatar(
                        radius: 30,
                        child: Text("${task[index]['id']}",style: TextStyle(fontSize: 25),),
                      ),
                      SizedBox(width: 15,),
                      Column(
                        children: [
                          Text(
                            "${task[index]['task']}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "${task[index]['date']}",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            ),
                          ),

                        ],
                      ),
                      SizedBox(width: 10,),
                      Text(
                        "${task[index]['time']}",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(child: IconButton(
                          onPressed: (){}, icon:Icon(Icons.delete,color: Colors.red,size: 35,)))
                    ],)

              ),
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.cyan,
                  borderRadius: BorderRadius.all(Radius.circular(6))
              ),
            );
          } ,
          separatorBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Container(
                  color: Colors.grey,
                  height: 2,
                  width:double.infinity
              ),
            );
          },
          itemCount: task.length),
    );
  }
}
//tree widgets

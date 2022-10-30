import 'package:flutter/material.dart';

class CustomTodo extends StatelessWidget {
  const CustomTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  ListTile(
          title: Row(


            children: [
              CircleAvatar(
                radius: 30,
                child: Text("5",style: TextStyle(fontSize: 25),),
              ),
              SizedBox(width: 15,),
              Column(
                children: [
                  Text(
                    "todoText",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    "tododate",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                  ),

                ],
              ),
              SizedBox(width: 35,),
              Text(
                "todoTime",
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 35,),
              IconButton(onPressed: (){}, icon:Icon(Icons.delete,color: Colors.red,size: 35,))
            ],)

      ),
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.all(Radius.circular(6))
      ),
    );
  }
}

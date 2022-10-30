//1. create database
//2. create table
//3. open database =>obj
//4. insert to database
//____________________
//5. get from database
//6. update in database
//7. delete dtabase
//8. delete row

import 'package:sqflite/sqflite.dart';
import 'package:todo/Const/Const.dart';

class DataBaseHelper {
  Database? database;

  createDataBase() async {
     database = await openDatabase('tasks.db', version: 1,
        onCreate: (Database db, int version) async {
         print('database created'); //first time
      // When creating the db, create the table
      await db
          .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, task TEXT, time TEXT, date TEXT)')
          .then((value) {
        print('table is created');//first time
      }).catchError((error) {
        print('Error when creating Table $error');
      });
    }, onOpen: (Database){
           getDataFromDataBase(Database);
      print(' database opened');//first time

        }
    );
  }
  Future insertToDataBase({required String task ,required String time ,required String date ,})async{

   return await database!.transaction((txn) async {
          await txn.rawInsert(
          'INSERT INTO tasks(task,time,date) VALUES("$task","$time","$date")').then((value) {
            print('$value inserted successfully ');
          }).catchError((e){
            print(' Error When Inserting New Record $e');
          });
      print('inserted ');
    }) ;
  }
  getDataFromDataBase(database) async {
     task= await database.rawQuery('SELECT * FROM tasks');
    print(task);

  }
}
//instance of future await
//key , value
// id =key , 15=value
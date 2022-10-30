// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../componant/custom_button.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     final formKey =GlobalKey<FormState>();
//     final nameController=TextEditingController();
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () async {
//           var name= await getUserName('nagham').then((value) {
//             print(value);
//           }).catchError((e)=>print(e)) ;
//
//
//         },
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//          children: [
//           Form(
//             key: formKey,
//               child: Column(
//             children: [
//               TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'name',
//                   label: Text('enter your name'),
//                 ),
//                 controller: nameController,
//                 onChanged: (value){
//                   print(value);
//                   print(nameController);
//                 },
//                 onTap: (){
//
//                 },
//               )
//             ],
//           ))
//
//         ],
//       ),
//     );
//   }
// }
// String getName(){
//   return 'zeinab';
// }
// Future<String> getUserName(name)async{ //then
//
//  return name;
//
// }
//
//

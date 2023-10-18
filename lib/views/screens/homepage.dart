// import 'dart:convert';
// import 'package:flutter/material.dart';
//
// import 'package:http/http.dart' as http;
//
// class HomePage extends StatefulWidget {
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController postcontroller = TextEditingController();
//   TextEditingController salarycontroller = TextEditingController();
//
//   Future<void> insertRecord() async {
//     if (namecontroller.text != "" ||
//         postcontroller.text != "" ||
//         salarycontroller.text != "") {
//       try {
//         String uri = "http://localhost/website/api/insert_api.php";
//         var res = await http.post(Uri.parse(uri), body: {
//           "name": namecontroller.text,
//           "post": postcontroller.text,
//           "salary": salarycontroller.text,
//         });
//
//         var respones = jsonDecode(res.body);
//         if (respones['Success'] == "true") {
//           print("record inserted");
//         } else {
//           print("record not inserted");
//         }
//       } catch (e) {
//         print("Error : $e");
//       }
//     } else {
//       print("please filled all field");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Php"),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.of(context).pushNamed("ViewData");
//             },
//             icon: Icon(Icons.view_day),
//           ),
//         ],
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(14),
//         child: Column(
//           children: [
//             TextFormField(
//               controller: namecontroller,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 label: Text("Enter Name"),
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             TextFormField(
//               controller: postcontroller,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 label: Text("Enter post"),
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             TextFormField(
//               controller: salarycontroller,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//                 label: Text("Enter salary"),
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 insertRecord();
//               },
//               child: const Text("Insert"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:php_with_flutter/helper/api_helper.dart';
import 'dart:convert';

import '../../modal/employee_modal.dart';


class Home extends StatefulWidget {
  const Home({super.key});
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
   late Future<List<Student>> students;
  final studentListKey = GlobalKey<HomeState>();


  // @override
  // void initState() {
  //   super.initState();
  //   getdata();
  // }
  //
  // Future<void> getdata()async{
  //   student = await APIHelper.apiHelper.getStudentList();
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: studentListKey,
      appBar: AppBar(
        title: const Text('Student List'),
      ),
      // body: Center(
      //   child: FutureBuilder<List<Student>>(
      //     future: students,
      //     builder: (BuildContext context, AsyncSnapshot snapshot) {
      //       if (!snapshot.hasData) return const CircularProgressIndicator();
      //       return ListView.builder(
      //         itemCount: snapshot.data.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           var data = snapshot.data[index];
      //           print("data : $data");
      //           return Card(
      //             child: ListTile(
      //               leading: const Icon(Icons.person),
      //               trailing: const Icon(Icons.view_list),
      //               title: Text(
      //                 data.name,
      //                 style: const TextStyle(fontSize: 20),
      //               ),
      //               onTap: () {
      //                 // Navigator.push(
      //                 //   context,
      //                 //   MaterialPageRoute(builder: (context) => Details(student: data)),
      //                 // );
      //               },
      //             ),
      //           );
      //         },
      //       );
      //     },
      //   ),
      // ),
      body: FutureBuilder(
        future: APIHelper.apiHelper.getStudentList(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            print("${snapshot.error}");
            return Center(child: Text("ERROR : ${snapshot.error}"));

          }
          else if(snapshot.hasData){
            Student? student = snapshot.data;
                return ListTile(
                  title: Text("${student}"),
                );
          }else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Navigator.push(context, MaterialPageRoute(builder: (_) {
          //   return Create();
          // }));
        },
      ),
    );
  }
}
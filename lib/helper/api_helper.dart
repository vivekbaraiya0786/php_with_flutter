import 'dart:convert';
import 'package:http/http.dart' as http;

import '../modal/employee_modal.dart';

class APIHelper{
  APIHelper._();
  static final APIHelper apiHelper = APIHelper._();

  // Future<Products?> fetchdata()async{
  //   String baseurl = "http://127.0.0.1/website/api/fetch_api.php";
  //   http.Response res = await http.get(Uri.parse(baseurl));
  //   if(res.statusCode == 200){
  //     String data = res.body;
  //     Map<String,dynamic>  decoddata = jsonDecode(data);
  //     Products products = Products.fromJson(json: decoddata);
  //     return products;
  //   }
  //   return null;
  // }

   Future<Student?> getStudentList() async {

     String api = "http://127.0.0.1/website/api/fetch_api.php";
     http.Response res = await http.get(Uri.parse(api));
     if(res.statusCode == 200){
           String data = res.body;
           Map decoddata = jsonDecode(data);
           Student student = Student.fromJson(json: decoddata);
           return student;
         }
     return null;
  }

}


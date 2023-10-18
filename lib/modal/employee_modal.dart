// import 'dart:convert';
//
//
// class Products {
//   List<Datum> productdata;
//
//   Products({
//     required this.productdata,
//   });
//
//   factory Products.fromJson({required Map<String, dynamic> json}) => Products(
//     productdata: List<Datum>.from(json["productdata"].map((x) => Datum.fromJson(x))),
//   );
//
// }
//
// class Datum {
//   String id;
//   String name;
//   String post;
//   String salary;
//
//   Datum({
//     required this.id,
//     required this.name,
//     required this.post,
//     required this.salary,
//   });
//
//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//     id: json["id"],
//     name: json["name"],
//     post: json["post"],
//     salary: json["salary"],
//   );
//
// }
class Student {
   String name;
   String post;
   int salary;

  Student({required this.name,required this.post,required this.salary});

  factory Student.fromJson({required Map json}) {
    return Student(
      name: json['name'],
      post: json['post'],
      salary: json['salary'],
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'post':post,
    'salary':salary,
  };
}

class Env {
  static String URL_PREFIX = "http://127.0.0.1/";
}
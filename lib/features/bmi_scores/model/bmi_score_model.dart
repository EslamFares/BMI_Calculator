// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BmiScresModel {
  final String height;
  final String wight;
  final String age;
  final String bmi;
  final String time;

  BmiScresModel({
    required this.height,
    required this.wight,
    required this.age,
    required this.bmi,
    required this.time,
  });

  Map<String, String> toMap() {
    return <String, String>{
      'height': height,
      'wight': wight,
      'age': age,
      'bmi': bmi,
      'time': time.toString(),
    };
  }

  factory BmiScresModel.fromMap(Map<String, dynamic> map) {
    return BmiScresModel(
      height: map['height'] as String,
      wight: map['wight'] as String,
      age: map['age'] as String,
      bmi: map['bmi'] as String,
      time: map['time'].toString().toString().split(".")[0],
    );
  }

  String toJson() => json.encode(toMap());

  factory BmiScresModel.fromJson(String source) =>
      BmiScresModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BmiScresModel(height: $height, wight: $wight, age: $age, bmi: $bmi, time: $time)';
  }
}

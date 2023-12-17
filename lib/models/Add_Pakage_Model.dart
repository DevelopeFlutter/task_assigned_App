// ignore_for_file: non_constant_identifier_names

class Add_Pakage_Model{

  late String id,pakage_name,te1,te2,uid,days,package_no;

  Add_Pakage_Model({required this.id, required this.pakage_name, required this.te1,
    required this.te2, required this.uid,required this.days, required this.package_no});

  factory Add_Pakage_Model.fromJson(Map<dynamic, dynamic> json) {
    return Add_Pakage_Model(
      id: json["id"],
      pakage_name: json["pakage_name"],
      te1: json["te1"],
      te2: json["te2"],
      uid: json["uid"],
      days: json['days'],
      package_no: json['package_no']
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "id": this.id,
      "pakage_name": this.pakage_name,
      "te1": this.te1,
      "te2": this.te2,
      "uid": this.uid,
      "days":this.days,
      "package_no":this.package_no
    };
  }
//


}
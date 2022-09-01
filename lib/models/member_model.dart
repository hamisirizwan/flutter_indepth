class Member {
  String? sId;
  String? firstname;
  String? lastname;
  String? phone;
  String? idNumber;
  String? residence;
  String? createdAt;
  String? updatedAt;
  int? iV;

  Member(
      {this.sId,
      this.firstname,
      this.lastname,
      this.phone,
      this.idNumber,
      this.residence,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Member.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phone = json['phone'];
    idNumber = json['id_number'];
    residence = json['residence'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = sId;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['phone'] = phone;
    data['id_number'] = idNumber;
    data['residence'] = residence;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    return data;
  }
}

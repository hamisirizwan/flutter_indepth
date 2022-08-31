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
    data['_id'] = this.sId;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['phone'] = this.phone;
    data['id_number'] = this.idNumber;
    data['residence'] = this.residence;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

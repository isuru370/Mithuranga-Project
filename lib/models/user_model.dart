class UserModel {
  String? fullName;
  String? email;
  String? address;
  String? contactNumber;
  String? birthDay;
  String? password;
  String? height;
  String? weight;

  UserModel({
    this.fullName,
    this.email,
    this.address,
    this.contactNumber,
    this.birthDay,
    this.password,
    this.height,
    this.weight,
  });

  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "address": address,
      "contactNumber": contactNumber,
      "birthDay": birthDay,
      "password": password,
      "height": height,
      "weight": weight,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json["fullName"],
      email: json["email"],
      address: json["address"],
      contactNumber: json["contactNumber"],
      birthDay: json["birthDay"],
      password: json["password"],
      height: json["height"],
      weight: json["weight"],
    );
  }
}

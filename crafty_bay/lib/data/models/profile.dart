class Profile {
  int? id;
  String? firsName;
  String? lastName;
  String? mobile;
  String? city;
  String? shippingAddress;
  String? email;
  String? createdAt;
  String? updateAt;

  Profile(
      {this.id,
      this.firsName,
      this.lastName,
      this.mobile,
      this.city,
      this.shippingAddress,
      this.email,
      this.createdAt,
      this.updateAt});

      Profile.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        firsName = json['firsName'];
        lastName = json['lastName'];
        mobile = json['mobile'];
        city = json['city'];
        shippingAddress = json['shippingAddress'];
        email = json['email'];
        createdAt = json['createdAt'];
        updateAt = json['updateAt'];
      }

      Map<String, dynamic> toJson() => {
        'id': id,
        'firsName': firsName,
        'lastName': lastName,
        'mobile': mobile,
        'city': city,
        'shippingAddress': shippingAddress,
        'email': email,
        'createdAt': createdAt,
        'updateAt': updateAt,
      };
}

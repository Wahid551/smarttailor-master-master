class UserModel {
  String firstName;
  String lastName;
  String userEmail;
  String userImage;
  String address;
  int gender;
  String phone;
  String uid;
  String shopName;


  UserModel({
    required this.userEmail,
    required this.userImage,
    required this.firstName,
    required this.address,
    required this.gender,required this.lastName,
    required this.phone,
    required this.uid,
    required this.shopName,
  });
}
class CustomerOrderModel{

  List<dynamic> ItemsList;
  double totalAmount;
  String arm;
  String height;
  String length;
  String lowerKWidth;
  String neck;
  String shoulder;
  String upperChest;
  String area;
  String street;
  String pincode;
  String city;
  String society;
  String customerId;

  CustomerOrderModel({required this.customerId, required this.area,required this.pincode,required this.street,required this.city,required this.society, required this.upperChest,required this.shoulder,required this.neck,required this.lowerKWidth,required this.height,required this.length,required this.arm,required this.totalAmount,required this.ItemsList});
}
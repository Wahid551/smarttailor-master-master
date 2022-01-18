class ProductModel{

  String productName;
  String productDesc;
  String productImage;
  String productCategory;
  int productPrice;
  String userUid;
  int genderCategory;
  String userDocId;

  ProductModel({required this.userDocId, required this.userUid,required this.genderCategory,required this.productCategory,required this.productDesc,required this.productImage,required this.productName,required this.productPrice});


}
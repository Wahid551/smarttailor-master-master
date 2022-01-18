class ReviewCartModel {
  late String cartId;
  late String cartImage;
  late int cartPrice;
  late String cartName;
  late int genderCategory;
  late String cartCategory;
  late String cartSDesc;
  late bool isAdd;
  String tailorId;
  ReviewCartModel({
    required this.cartId,
    required this.cartImage,
    required this.cartName,
    required this.cartPrice,
   required this.genderCategory,required this.cartCategory,required this.cartSDesc,required this.isAdd,
    required this.tailorId
  });
}

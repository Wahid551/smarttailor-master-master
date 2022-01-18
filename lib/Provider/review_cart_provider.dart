
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smarttailor/models/review_cart_model.dart';

class ReviewProvider extends ChangeNotifier{
    Future<void> addReviewCartData( {required String cartId,
    required String cartName,
    required String cartImage,
    required int cartPrice,
    required int genderCategory,
    required var cartCategory,
    required String cartDesc,
      required String tailorId,
      required BuildContext context
    })async{

      await FirebaseFirestore.instance
          .collection('ReviewCart')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('YourReviewCart')
          .doc(cartId).set(
        {
          'cartId': cartId,
          'cartImage': cartImage,
          'cartName': cartName,
          'cartPrice': cartPrice,
          'genderCategory': genderCategory,
          "cartCategory": cartCategory,
          "cartDesc":cartDesc,
          "tailorId":tailorId,
          'isAdd': true,
        },
      ).then((value){

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              content: Text(
                "Added To Cart Successfully",
                style: TextStyle(fontSize: 18.0, color: Colors.black),
              ),
            ),
          );
          notifyListeners();

      });
      notifyListeners();
    }


    //// Get Review Cart Data/////

    List<ReviewCartModel> reviewCartDataList = [];
    void getReviewCartData() async {
      List<ReviewCartModel> newList = [];

      QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
          .collection("ReviewCart")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("YourReviewCart")
          .get();
      reviewCartValue.docs.forEach((element) {
        ReviewCartModel reviewCartModel = ReviewCartModel(
          cartId: element.get("cartId"),
          cartImage: element.get("cartImage"),
          cartName: element.get("cartName"),
          cartPrice: element.get("cartPrice"),
          cartSDesc: element.get("cartDesc"),
          cartCategory: element.get('cartCategory'),
          genderCategory: element.get("genderCategory"),
          isAdd: element.get("isAdd"),
          tailorId: element.get("tailorId")
        );
        newList.add(reviewCartModel);
      });
      reviewCartDataList = newList;
      notifyListeners();
    }

    ////////Get Cart Data List////
    List<ReviewCartModel> get getReviewCartDataList {
      return reviewCartDataList;
    }

    //// TotalPrice  ///

    getTotalPrice() {
      double total = 0.0;
      reviewCartDataList.forEach((element) {
        total += element.cartPrice;
      });
      return total;
    }
    getTotalPrice_shipiing(){
      double total = 0.0;
      reviewCartDataList.forEach((element) {
        total += element.cartPrice;
      });
      return total+200;
    }

    ////////////// ReviCartDeleteFunction ////////////
    reviewCartDataDelete(cartId) {
      FirebaseFirestore.instance
          .collection("ReviewCart")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("YourReviewCart")
          .doc(cartId)
          .delete();
      notifyListeners();
    }

    void deleteCart(String id) {
      FirebaseFirestore.instance.collection("ReviewCart").doc(FirebaseAuth.instance.currentUser!.uid).collection("YourReviewCart").get().then((value){
        value.docs.forEach((element) {
          FirebaseFirestore.instance.collection("ReviewCart").doc(FirebaseAuth.instance.currentUser!.uid).collection("YourReviewCart")
              .doc(element.id).delete();
        });
      } );
      notifyListeners();
    }

}
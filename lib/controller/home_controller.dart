import 'dart:convert';

import 'package:fake_task/model/product_res_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class HomeController with ChangeNotifier{

List<ProductResModel> lstProductModel=[];

bool isLoading=false;
  
  


  Future getProducts()async{
// try{
    
    isLoading=true;
    notifyListeners();
    Uri url = Uri.parse("https://fakestoreapi.com/products");

    var response =await http.get(url);


   if(response.statusCode>=200&& response.statusCode<300){
  List decodedData = jsonDecode(response.body);

  lstProductModel = decodedData.map((e) => ProductResModel.fromJson(e)).toList();
   print(lstProductModel.first.category);
   }else{
    
    print("Failed");

   }
 isLoading=false;
 notifyListeners();
   
// }Catch(Exception e){
//       print(e.toString());
//     }
  }
    

}
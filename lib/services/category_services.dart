import 'dart:core';

import 'package:http/http.dart' as http;
import 'package:ushop_app/models/category_model.dart';
import 'package:ushop_app/models/product_models.dart';
import 'package:ushop_app/utils/my_string.dart';



class CategoryServices{



static Future <List<String>> getCategory() async{

var response =await  http.get(Uri.parse('$baseUrl/products/categories'));
if (response.statusCode==200){

   var jsonData= response.body;
   return categoryModelFromJson(jsonData);

}else{
  return throw Exception("Faild to load product");
}

}}




class AllCategoryServices{



static Future <List<ProductModels>> getAllCategory(String categoryNames) async{

var response =await  http.get(Uri.parse('$baseUrl/products/category/$categoryNames'));
if (response.statusCode==200){

   var jsonData= response.body;
   return productModelsFromJson(jsonData);

}else{
  return throw Exception("Faild to load product");
}

}}
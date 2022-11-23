import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ushop_app/models/product_models.dart';
import 'package:ushop_app/services/category_services.dart';

class CategoryController extends GetxController{


var isCategoryLoading=false.obs;
var categoryNameList=<String>[].obs;
var categoryList=<ProductModels>[].obs;
var isAllCategory=false.obs;

List<String>imageCategory=[


     "https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",
];

@override
  void onInit() {
    super.onInit();
    getCategorys();
    
  }




void getCategorys() async{
 var categoryName= await  CategoryServices.getCategory();
 try {
  isCategoryLoading(true);
  if(categoryName.isNotEmpty){
    categoryNameList.addAll(categoryName);
  }
   
 }finally {
   isCategoryLoading(false);
 }

}




 getAllCategorys(String nameCategory) async{
  
    isAllCategory(true);

   categoryList.value = await AllCategoryServices.getAllCategory(nameCategory);

   

   isAllCategory(false);


}


getCategoryIndex(int index)async{
  var categoryAllName=  await getAllCategorys(categoryNameList[index]);

if(categoryAllName !=null){
  categoryList.value=categoryAllName;
}

}
}
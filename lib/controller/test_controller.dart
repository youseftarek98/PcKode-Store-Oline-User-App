import 'package:get/get.dart';
import 'package:pckode/core/class/status_request.dart';
import 'package:pckode/core/functions/handlinfdatacontroller.dart';
import 'package:pckode/data/datasource/remote/test_data.dart';

class TestController extends GetxController{
  TestData testData = TestData(Get.find()) ;

  List data = [] ;
  late StatusRequest statusRequest ;
  getData()async{
    statusRequest = StatusRequest.loading ;
    var response = await testData.getData();
    print("================== Response Controller $response") ;
    statusRequest = handlingData(response) ;
    if(StatusRequest.success== statusRequest){
       if(response["status"] == 'success'){
        data.addAll(response["data"]) ;
       }else{
        statusRequest = StatusRequest.failure ;
       }
    }
    update() ;
  }

  @override
  void onInit() {
   getData() ;
    super.onInit();
  }
}
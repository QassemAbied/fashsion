import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../core/local_network.dart';
import '../../core/token.dart';
import '../../data/models/all_clotges_models.dart';
import '../../data/models/sign_in_required_models.dart';
import '../../data/models/sign_up_required_models.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  //final AuthRepo authRepo;
  AuthCubit(
     // this.authRepo
      ) : super(AuthInitial());

  Future<void> signUpCubit({
    required BuildContext context ,required SignUpRequired signUpRequired
  })
  // async {
  //   // emit(SignUpLoading());
  //   // final result = await authRepo.signUpRepo(context: context, signUpRequired: signUpRequired);
  //   // result.fold(
  //   //       (l) {
  //   //     emit(SignUpFailure( errorMassage: l.errMessage,));
  //   //   },
  //   //       (r) {
  //   //     emit(SignUpSuccess());
  //   //   },
  //   // );
  //
  // }
  async {
  //try {
    emit(SignUpLoading());
    var data = FormData.fromMap({
      'email': signUpRequired.email,
      'name': signUpRequired.name,
      'password': signUpRequired.password,
      'password_confirmation': signUpRequired.password_confirmation,
    });

    var dio = Dio();
    var response = await dio.request(
      'https://clothes-style.site/api/register',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );
    //SignUpModels? signUpModels;


    if (response.statusCode == 200) {

     // signUpModels= SignUpModels.fromJson(response.data);

      debugPrint('data  for success signUpModels  ${response.data}');
      emit(SignUpSuccess());
        //emit(RegisterSuccessState());

        //debugPrint('data for Register ${response.data}');


    }
    // else if(response.statusCode == 400){
    //   CustomDialog.dialogWidget(
    //     context: context,
    //     image: AppImages.successImage,
    //     title:  response.data['message'],
    //   );
    //   // emit(SignUpFailure( errorMassage: response.data['message'],));
    //   // debugPrint('data Error 200 for Register ${response.data}');
    // }
    else {
      //emit(RegisterErrorState(response.data['message']));
      emit(SignUpFailure( errorMassage: response.data["error"]['email'],));
      debugPrint('data Error 200 for Register ${response.data}');

    }
   // return right(signUpModels);

 // }
  // catch (e) {
  //   if (e is DioException) {
  //     debugPrint('data error catch for signUpModels  ${e.toString()}');
  //     // Future.delayed(Duration(seconds: 3),()async{
  //     //   await CacheNetwork.removeDate(key: 'TOKEN').then((value) {
  //     //     token = '';
  //     //   });
  //     //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>PhoneAuthView()),
  //     //           (route) => false);
  //     // });
  //     //debugPrint('data success for sms ${response.data}');
  //     return left(ServerFailure.fromDioError(e));
  //   }
  //   // Future.delayed(Duration(seconds: 3),()async{
  //   //   await CacheNetwork.removeDate(key: 'TOKEN').then((value) {
  //   //     token = '';
  //   //   });
  //   //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>PhoneAuthView()),
  //   //           (route) => false);
  //   // });
  //   debugPrint('data error catch for signUpModels  ${e}');
  //   return left(ServerFailure(e.toString()));
  // }
}

  Future<void> signInCubit({
    required BuildContext context ,required SignInRequired signInRequired
  })
  async {
    //try {
    emit(SignInLoading());
    var data = FormData.fromMap({
      'email': signInRequired.email,
      'password': signInRequired.password,
      //'password_confirmation': '1234567'
    });

    var dio = Dio();
    var response = await dio.request(
      'https://clothes-style.site/api/login',
      options: Options(
        method: 'POST',
      ),
      data: data,
    );
    //SignUpModels? signUpModels;


    if (response.statusCode == 200) {

      //signUpModels= SignUpModels.fromJson(response.data);
      // signUpModels= SignUpModels.fromJson(response.data);
      await CacheNetwork.setDate( key: 'TOKEN', value: response.data['access_token']).then((value) {
        token= response.data['access_token'];
      });
      debugPrint('data  for Success signInModels  ${response.data}');
      emit(SignInSuccess());
      //emit(RegisterSuccessState());

      //debugPrint('data for Register ${response.data}');


    }
    // else if(response.statusCode == 400){
    //   CustomDialog.dialogWidget(
    //     context: context,
    //     image: AppImages.successImage,
    //     title:  response.data['message'],
    //   );
    //   // emit(SignUpFailure( errorMassage: response.data['message'],));
    //   // debugPrint('data Error 200 for Register ${response.data}');
    // }
    else {
      //emit(RegisterErrorState(response.data['message']));
      emit(SignInFailure( errorMassage: response.data['msg'],));
      debugPrint('data Error 200 signInModels for Register ${response.data}');

    }
    // return right(signUpModels);

    // }
    // catch (e) {
    //   if (e is DioException) {
    //     debugPrint('data error catch for signUpModels  ${e.toString()}');
    //     // Future.delayed(Duration(seconds: 3),()async{
    //     //   await CacheNetwork.removeDate(key: 'TOKEN').then((value) {
    //     //     token = '';
    //     //   });
    //     //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>PhoneAuthView()),
    //     //           (route) => false);
    //     // });
    //     //debugPrint('data success for sms ${response.data}');
    //     return left(ServerFailure.fromDioError(e));
    //   }
    //   // Future.delayed(Duration(seconds: 3),()async{
    //   //   await CacheNetwork.removeDate(key: 'TOKEN').then((value) {
    //   //     token = '';
    //   //   });
    //   //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>PhoneAuthView()),
    //   //           (route) => false);
    //   // });
    //   debugPrint('data error catch for signUpModels  ${e}');
    //   return left(ServerFailure(e.toString()));
    // }
  }
  List<AllClothes> allClothes=[];
  void getAllClothes()async{
    emit(AllClothesLoading());
    var dio = Dio();
    var response = await dio.request(
      'https://clothes-style.site/api/all',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      //List<ListServiceData> listServiceData=[];
      for(var item in response.data['data']){
        allClothes.add(AllClothes.fromJson(item));
      }
      emit(AllClothesSuccess(allClothes));
    }
    else {
      print(response.statusMessage);
      emit(AllClothesFailure(errorMassage: 'are error'));
    }
  }
}
// async {
//   //try {
//     emit(SignUpLoading());
//     var data = FormData.fromMap({
//       'email': signUpRequired.email,
//       'name': signUpRequired.name,
//       'password': signUpRequired.password,
//     });
//
//     var dio = Dio();
//     var response = await dio.request(
//       'http://172.208.112.141:8000/api/v1/user/signup/',
//       options: Options(
//         method: 'POST',
//       ),
//       data: data,
//     );
//     SignUpModels? signUpModels;
//     if (response.statusCode == 201) {
//
//       signUpModels= SignUpModels.fromJson(response.data);
//
//       debugPrint('data  for signUpModels  ${response.data}');
//       emit(SignUpSuccess());
//         //emit(RegisterSuccessState());
//
//         //debugPrint('data for Register ${response.data}');
//
//
//     }
//     else {
//       //emit(RegisterErrorState(response.data['message']));
//       emit(SignUpFailure( errorMassage: response.data['email'],));
//       debugPrint('data Error 200 for Register ${response.data}');
//
//     }
//     return right(signUpModels);
//
//  // }
//   // catch (e) {
//   //   if (e is DioException) {
//   //     debugPrint('data error catch for signUpModels  ${e.toString()}');
//   //     // Future.delayed(Duration(seconds: 3),()async{
//   //     //   await CacheNetwork.removeDate(key: 'TOKEN').then((value) {
//   //     //     token = '';
//   //     //   });
//   //     //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>PhoneAuthView()),
//   //     //           (route) => false);
//   //     // });
//   //     //debugPrint('data success for sms ${response.data}');
//   //     return left(ServerFailure.fromDioError(e));
//   //   }
//   //   // Future.delayed(Duration(seconds: 3),()async{
//   //   //   await CacheNetwork.removeDate(key: 'TOKEN').then((value) {
//   //   //     token = '';
//   //   //   });
//   //   //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>PhoneAuthView()),
//   //   //           (route) => false);
//   //   // });
//   //   debugPrint('data error catch for signUpModels  ${e}');
//   //   return left(ServerFailure(e.toString()));
//   // }
// }

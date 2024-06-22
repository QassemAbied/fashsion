part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}


class SignUpSuccess extends AuthState {}
class SignUpLoading extends AuthState {}
class SignUpFailure extends AuthState {
  final String errorMassage;
  SignUpFailure({required this.errorMassage});
}

class SignInSuccess extends AuthState {}
class SignInLoading extends AuthState {}
class SignInFailure extends AuthState {
  final String errorMassage;
  SignInFailure({required this.errorMassage});
}


class AllClothesSuccess extends AuthState {
  final List<AllClothes> allClothes;
  AllClothesSuccess(this.allClothes);
}
class AllClothesLoading extends AuthState {}
class AllClothesFailure extends AuthState {
  final String errorMassage;
  AllClothesFailure({required this.errorMassage});
}

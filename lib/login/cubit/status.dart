abstract class LoginState {}

class initialState extends LoginState {}

class Loading extends LoginState {}

class Loaded extends LoginState {}

class ThemeLoaded extends LoginState {}

class LanguageLoaded extends LoginState {}

class ChangeSelectedGovernment extends LoginState {}

class UserLoginLoading extends LoginState {}

class UserLoginSuccess extends LoginState {
  final String token;

  UserLoginSuccess({
    required this.token,
  });
}

class UserLoginError extends LoginState {
  final String message;

  UserLoginError({
    required this.message,
  });
}
class GetImageSuccess extends LoginState {
}

class GetImageError extends LoginState {
  final String message;

  GetImageError({
    required this.message,
  });
}
class AddNewTypeSuccess extends LoginState {
}

class AddNewTypeError extends LoginState {
  final String message;

  AddNewTypeError({
    required this.message,
  });
}

class GetAllGovernmentsLoading extends LoginState {}

class GetAllGovernmentsSuccess extends LoginState {}

class GetAllGovernmentsError extends LoginState {
  final String message;

  GetAllGovernmentsError({
    required this.message,
  });
}

class UserRegisterLoading extends LoginState {}

class UserRegisterSuccess extends LoginState {}

class UserRegisterError extends LoginState {
  final String message;

  UserRegisterError({
    required this.message,
  });
}

class WorkerRegisterLoading extends LoginState {}

class WorkerRegisterSuccess extends LoginState {}

class WorkerRegisterError extends LoginState {
  final String message;

  WorkerRegisterError({
    required this.message,
  });
}

class AllRequestedLoading extends LoginState {}

class AllRequestedSuccess extends LoginState {}

class AllRequestedError extends LoginState {
  final String message;

  AllRequestedError({
    required this.message,
  });
}

class ChangeLoaded extends LoginState {}

class PrintRequestPDF extends LoginState {}

class BottomChanged extends LoginState {}

class PostImagePickedSuccess extends LoginState {}

class PostImagePickedError extends LoginState {}

class GetUserError extends LoginState {
  final String message;

  GetUserError({
    required this.message,
  });
}

class GetUserSuccess extends LoginState {}

class GetPostsSuccess extends LoginState {}

class GetMessagesSuccess extends LoginState {}

class GetUsersSuccess extends LoginState {}

class PostUpdatedSuccess extends LoginState {}

class PostUpdatedError extends LoginState {
  final String message;

  PostUpdatedError({
    required this.message,
  });
}

class SendMessage extends LoginState {
  final String message;

  SendMessage({
    required this.message,
  });
}

class CreateChatError extends LoginState {
  final String message;

  CreateChatError({
    required this.message,
  });
}

//class CreateUserLoading extends LoginState {}

class CreateUserSuccess extends LoginState {}

class CreateUserError extends LoginState {
  final String message;

  CreateUserError({
    required this.message,
  });
}
class CreateWorkerSuccess extends LoginState {}

class CreateWorkerError extends LoginState {
  final String message;

  CreateWorkerError({
    required this.message,
  });
}


class AppSignOutSuccessStates extends LoginState {}

class AppSignOutErrorStates extends LoginState {
  final String message;

  AppSignOutErrorStates({
    required this.message,
  });
}

class SavePostSuccess extends LoginState {}

class SavePostError extends LoginState {
  final String message;

  SavePostError({
    required this.message,
  });
}



class GetAllDepartmentError extends LoginState {
  final String message;

  GetAllDepartmentError({
    required this.message,
  });
}

class GetAllDepartmentSuccess extends LoginState {}
class GetAllDepartmentLoading extends LoginState {}

class getImageErrorStates extends LoginState {
  final String message;

  getImageErrorStates({
    required this.message,
  });
}

class getImageSuccessStates extends LoginState {}




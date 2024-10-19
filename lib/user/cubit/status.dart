abstract class UserState {}

class Empty extends UserState {}

class Loading extends UserState {}

class Loaded extends UserState {}

class ThemeLoaded extends UserState {}

class LanguageLoaded extends UserState {}

class ChangeSelectedGovernment extends UserState {}

class UserLoginLoading extends UserState {}

class UserLoginSuccess extends UserState {
  final String token;

  UserLoginSuccess({
    required this.token,
  });
}

class UserLoginError extends UserState {
  final String message;

  UserLoginError({
    required this.message,
  });
}
class GetImageSuccess extends UserState {
}

class GetImageError extends UserState {
  final String message;

  GetImageError({
    required this.message,
  });
}
class AddNewTypeSuccess extends UserState {
}

class AddNewTypeError extends UserState {
  final String message;

  AddNewTypeError({
    required this.message,
  });
}

class GetAllGovernmentsLoading extends UserState {}

class GetAllGovernmentsSuccess extends UserState {}

class GetAllGovernmentsError extends UserState {
  final String message;

  GetAllGovernmentsError({
    required this.message,
  });
}

class UserRegisterLoading extends UserState {}

class UserRegisterSuccess extends UserState {}

class UserRegisterError extends UserState {
  final String message;

  UserRegisterError({
    required this.message,
  });
}

class WorkerRegisterLoading extends UserState {}

class WorkerRegisterSuccess extends UserState {}

class WorkerRegisterError extends UserState {
  final String message;

  WorkerRegisterError({
    required this.message,
  });
}

class AllRequestedLoading extends UserState {}

class AllRequestedSuccess extends UserState {}

class AllRequestedError extends UserState {
  final String message;

  AllRequestedError({
    required this.message,
  });
}

class ChangeLoaded extends UserState {}

class PrintRequestPDF extends UserState {}

class BottomChanged extends UserState {}

class PostImagePickedSuccess extends UserState {}

class PostImagePickedError extends UserState {}

class GetUserError extends UserState {
  final String message;

  GetUserError({
    required this.message,
  });
}

class GetUserSuccess extends UserState {}

class GetPostsSuccess extends UserState {}

class GetMessagesSuccess extends UserState {}

class GetUsersSuccess extends UserState {}

class PostUpdatedSuccess extends UserState {}

class PostUpdatedError extends UserState {
  final String message;

  PostUpdatedError({
    required this.message,
  });
}

class SendMessage extends UserState {
  final String message;

  SendMessage({
    required this.message,
  });
}

class CreateChatError extends UserState {
  final String message;

  CreateChatError({
    required this.message,
  });
}

//class CreateUserLoading extends UserState {}

class CreateUserSuccess extends UserState {}

class CreateUserError extends UserState {
  final String message;

  CreateUserError({
    required this.message,
  });
}
class CreateWorkerSuccess extends UserState {}

class CreateWorkerError extends UserState {
  final String message;

  CreateWorkerError({
    required this.message,
  });
}

//
// class AppSignOutSuccessStates extends UserState {}
//
// class AppSignOutErrorStates extends UserState {
//   final String message;
//
//   AppSignOutErrorStates({
//     required this.message,
//   });
// }

class SavePostSuccess extends UserState {}

class SavePostError extends UserState {
  final String message;

  SavePostError({
    required this.message,
  });
}



class GetAllDepartmentError extends UserState {
  final String message;

  GetAllDepartmentError({
    required this.message,
  });
}

class GetAllDepartmentSuccess extends UserState {}
class GetAllDepartmentLoading extends UserState {}

class getImageErrorStates extends UserState {
  final String message;

  getImageErrorStates({
    required this.message,
  });
}

class GetServiceProvidersError extends UserState {
  final String message;

  GetServiceProvidersError({
    required this.message,
  });
}

class getImageSuccessStates extends UserState {}


class GetServiceProvidersLoading extends UserState {}
class GetServiceProvidersSuccess extends UserState {}




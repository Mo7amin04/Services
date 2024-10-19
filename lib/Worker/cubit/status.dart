abstract class WorkerState {}

class Empty1 extends WorkerState {}

class Loading extends WorkerState {}

class Loaded extends WorkerState {}

class ThemeLoaded extends WorkerState {}

class LanguageLoaded extends WorkerState {}

class ChangeSelectedGovernment extends WorkerState {}

class UserLoginLoading extends WorkerState {}

class UserLoginSuccess extends WorkerState {
  final String token;

  UserLoginSuccess({
    required this.token,
  });
}

class UserLoginError extends WorkerState {
  final String message;

  UserLoginError({
    required this.message,
  });
}
class GetImageSuccess extends WorkerState {
}

class GetImageError extends WorkerState {
  final String message;

  GetImageError({
    required this.message,
  });
}
class AddNewTypeSuccess extends WorkerState {
}

class AddNewTypeError extends WorkerState {
  final String message;

  AddNewTypeError({
    required this.message,
  });
}

class GetAllGovernmentsLoading extends WorkerState {}

class GetAllGovernmentsSuccess extends WorkerState {}

class GetAllGovernmentsError extends WorkerState {
  final String message;

  GetAllGovernmentsError({
    required this.message,
  });
}

class UserRegisterLoading extends WorkerState {}

class UserRegisterSuccess extends WorkerState {}

class UserRegisterError extends WorkerState {
  final String message;

  UserRegisterError({
    required this.message,
  });
}

class WorkerRegisterLoading extends WorkerState {}

class WorkerRegisterSuccess extends WorkerState {}

class WorkerRegisterError extends WorkerState {
  final String message;

  WorkerRegisterError({
    required this.message,
  });
}

class AllRequestedLoading extends WorkerState {}

class AllRequestedSuccess extends WorkerState {}

class AllRequestedError extends WorkerState {
  final String message;

  AllRequestedError({
    required this.message,
  });
}

class ChangeLoaded extends WorkerState {}

class PrintRequestPDF extends WorkerState {}

class BottomChanged extends WorkerState {}

class PostImagePickedSuccess extends WorkerState {}

class PostImagePickedError extends WorkerState {}

class GetUserError extends WorkerState {
  final String message;

  GetUserError({
    required this.message,
  });
}

class GetUserSuccess extends WorkerState {}

class GetPostsSuccess extends WorkerState {}

class GetMessagesSuccess extends WorkerState {}

class GetUsersSuccess extends WorkerState {}

class PostUpdatedSuccess extends WorkerState {}

class PostUpdatedError extends WorkerState {
  final String message;

  PostUpdatedError({
    required this.message,
  });
}

class SendMessage extends WorkerState {
  final String message;

  SendMessage({
    required this.message,
  });
}

class CreateChatError extends WorkerState {
  final String message;

  CreateChatError({
    required this.message,
  });
}

//class CreateUserLoading extends WorkerState {}

class CreateUserSuccess extends WorkerState {}

class CreateUserError extends WorkerState {
  final String message;

  CreateUserError({
    required this.message,
  });
}
class CreateWorkerSuccess extends WorkerState {}

class CreateWorkerError extends WorkerState {
  final String message;

  CreateWorkerError({
    required this.message,
  });
}


// class AppSignOutSuccessStates extends WorkerState {}
//
// class AppSignOutErrorStates extends WorkerState {
//   final String message;
//
//   AppSignOutErrorStates({
//     required this.message,
//   });
// }

class SavePostSuccess extends WorkerState {}

class SavePostError extends WorkerState {
  final String message;

  SavePostError({
    required this.message,
  });
}



class GetAllDepartmentError extends WorkerState {
  final String message;

  GetAllDepartmentError({
    required this.message,
  });
}

class GetAllDepartmentSuccess extends WorkerState {}
class GetAllDepartmentLoading extends WorkerState {}

class getImageErrorStates extends WorkerState {
  final String message;

  getImageErrorStates({
    required this.message,
  });
}

class getImageSuccessStates extends WorkerState {}




part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthUserChanged extends AuthEvent{
 final auth.User? authUser;
 final User? user;

 const AuthUserChanged({
   required this.authUser,
   this.user
});
  @override
  List<Object?> get props => [authUser, user];

}

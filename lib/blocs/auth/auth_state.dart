part of 'auth_bloc.dart';

enum AuthStatus{ UNKNOWN, AUTHENTICATED, UNAUTHENTICATED}

// abstract class AuthState extends Equatable {
//   const AuthState();
// }

class AuthState extends Equatable {
  final AuthStatus status;
  final auth.User? authUser;
  final User? user;

  const AuthState._({
    this.status =  AuthStatus.UNKNOWN,
    this.authUser,
    this.user
});

  const AuthState.unknown() : this._();

  const AuthState.authenticated({
    required auth.User authUser,
    required User user
}) : this._(
    status: AuthStatus.AUTHENTICATED,
    authUser: authUser,
    user: user
  );

  const AuthState.unauthenticated() : this._(
    status: AuthStatus.UNAUTHENTICATED
  );

  @override
  List<Object> get props => [status,authUser!,user!];
}

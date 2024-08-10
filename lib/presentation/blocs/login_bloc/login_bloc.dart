import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:udrive/data/data_source/login_ds.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginDs loginDs;
  LoginBloc({required this.loginDs}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        final String result =
            await loginDs.login(email: event.email, password: event.password);
        emit(LoginSuccess(response: result));
      } catch (e) {
        emit(LoginError(errorText: e.toString()));
      }
    });
  }
}

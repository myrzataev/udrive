import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:udrive/data/data_source/create_user_repo.dart';

part 'create_user_event.dart';
part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  CreateUserRepo createUserRepo;
  CreateUserBloc({required this.createUserRepo}) : super(CreateUserInitial()) {
    on<CreateUserEvent>((event, emit) async {
      emit(CreateUserLoading());
      try {
        await createUserRepo.createUser(
            email: event.email, password: event.password);
        emit(CreateUserSuccess());
      } catch (e) {
        emit(CreateUserError(errorText: e.toString()));
      }
    });
  }
}

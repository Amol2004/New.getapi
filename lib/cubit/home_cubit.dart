import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapp/repo/home_repo.dart';
import '../model/home_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final HomeRepo homeRepo = HomeRepo();

  void getData() async {
    try {
      emit(HomeLoading());
      var data = await homeRepo.getData();  
      data.fold((error) {
        emit(HomeError(errorMessage: error.message));
      }, (data) {
        emit(HomeLoaded(homeModel: data));
      });
    } catch (e) {
      emit(HomeError(errorMessage: e.toString()));
    }
  }
}

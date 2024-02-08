part of 'home_cubit.dart';



abstract class HomeState {
  HomeModel? homeModel;
  HomeState({this.homeModel});
}

class HomeInitial extends HomeState {
  HomeInitial({HomeModel? homeModel}) : super(homeModel: homeModel);
}

class HomeLoading extends HomeState {
  HomeLoading({HomeModel? homeModel}) : super(homeModel: homeModel);
}

class HomeLoaded extends HomeState {
  HomeLoaded({HomeModel? homeModel}) : super(homeModel: homeModel);
}

class HomeError extends HomeState {
  final String? errorMessage;
  HomeError({this.errorMessage});
}

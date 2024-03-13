part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}


class UpdateHomeData extends HomeEvent {

  const UpdateHomeData({this.homeData});

  final Pokemon? homeData;

  @override
  List<Object?> get props => [ homeData ];
}

part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState({this.homeData});

  final Pokemon? homeData;

  HomeState copyWith({
    Pokemon? homeData,
}) {
    return HomeState(
      homeData: homeData ?? this.homeData,
    );
  }
  
  @override
  List<Object?> get props => [ ];
}

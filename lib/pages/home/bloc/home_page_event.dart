abstract class HomePageEvent {
  const HomePageEvent();
}

class HomePageDots extends HomePageEvent {
  HomePageDots(this.index);

  final int index;
}
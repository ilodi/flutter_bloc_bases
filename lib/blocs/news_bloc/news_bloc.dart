import 'package:bloc/bloc.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
//
import './news_events.dart';
import './news_state.dart';

class NewsBloc extends Bloc<NewsEvents, NewsState> {

  final client = HnpwaClient();


  //estados del bloc
  @override
  NewsState get initialState => NewsState.initialState();

  //crear instancia del newsbloc esto ayuda para cuando apenas se crea una
  // intacia y emitira este evento
  NewsBloc() {
    add(LoadEvent());
  }

  //eventos del bloc
  @override
  Stream<NewsState> mapEventToState(NewsEvents event) async* {
    if (event is LoadEvent) {
      print('load ');
      //que va a hacer antes de consumir
      yield this.state.copyWith(loading: true);
      final feed = await client.news();
      //el estado cambio (yield)
      yield this.state.copyWith(loading: false, news: feed.items);
    } else if (event is DeleteEvent) {
      print('delete ${event.position}');
      //se pasara una lista que no va a tener el elemento eliminado
      //crear una copia de una lista
     final newsList = List<FeedItem>.from(this.state.news);
      newsList.removeAt(event.position);
      yield this.state.copyWith(news: newsList);
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:hnpwa_client/hnpwa_client.dart';
import 'package:meta/meta.dart';

class NewsState extends Equatable{
  final bool loading;
  final List<FeedItem> news;

  NewsState({@required this.loading, @required this.news});

  static NewsState initialState() => NewsState(loading: false, news: []);

  //retornara una copy del estado actual del bloc, con modificaciones
  NewsState copyWith({
    bool loading,
    List<FeedItem> news,
  }) {
    //this.  es el valor actual
    return NewsState(loading: loading ?? this.loading, news: news ?? this.news);
  }


  @override
  // TODO: implement props
  List<Object> get props => [this.loading, this.news];
}

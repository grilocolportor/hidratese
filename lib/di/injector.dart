
import 'package:kiwi/kiwi.dart';

part 'injector.g.dart';


abstract class Injector {

  static KiwiContainer container;

  static void setup() {
    container = KiwiContainer();
    _$Injector()._configure();
  }

  static final resolve = container.resolve;

  void configure(){

  }

  @Register.factory(ArticlesRepository, from: ArticlesRepositoryImpl)
}

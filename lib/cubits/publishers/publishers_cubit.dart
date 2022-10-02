import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'publishers_state.dart';

class PublishersCubit extends Cubit<PublishersState> {
  PublishersCubit() : super(PublishersInitial());
}

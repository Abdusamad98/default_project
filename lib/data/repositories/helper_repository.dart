import 'package:default_project/data/models/helper/helper_model.dart';
import 'package:default_project/data/services/api_provider.dart';

class HelperRepository {
  HelperRepository({required this.apiProvider});

  final ApiProvider apiProvider;

  Future<List<HelperModel>> getLanguages() => apiProvider.getLanguages();

  Future<List<HelperModel>> getGenres() => apiProvider.getGenres();
}

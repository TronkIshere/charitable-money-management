import 'package:frontend/features/home/data/datasource/home_remote_data_source.dart';
import 'package:frontend/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource homeRemoteDataSource;
  HomeRepositoryImpl({required this.homeRemoteDataSource});
}

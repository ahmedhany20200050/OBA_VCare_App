import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled/Features/home/data/models/history_model.dart';
import 'package:untitled/Features/home/data/models/major_model.dart';
import 'package:untitled/Features/home/data/models/user_model.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cubit/home_state.dart';
import 'package:untitled/core/helpers/api.dart';
import 'package:untitled/core/utils/endpoints.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  String? token;
  List<MajorModel> majorList = [];
  UserModel? userModel;
  List<HistoryModel> historyList = [];

  allMajors() async {
    majorList.clear();
    emit(HomeMajorsLoading());
    var storage = const FlutterSecureStorage();
    token = await storage.read(key: 'token');
    await Api()
        .get(
      url: EndPoints.baseUrl + EndPoints.homeEndpoint,
      token: token,
    )
        .then((value) {
      for (var element in value['data']) {
        majorList.add(MajorModel.fromJson(element));
      }
      emit(HomeMajorsSuccess());
    });
  }

  userProfile() async {
    var storage = const FlutterSecureStorage();
    token = await storage.read(key: 'token');
    await Api()
        .get(
      url: EndPoints.baseUrl + EndPoints.userProfileEndpoint,
      token: token,
    )
        .then((value) {
      userModel = UserModel.fromJson(value['data'][0]);
    });
  }

  getHistory() async {
    historyList.clear();
    var storage = const FlutterSecureStorage();
    token = await storage.read(key: 'token');
    await Api()
        .get(
      url: EndPoints.baseUrl + EndPoints.historyEndpoint,
      token: token,
    )
        .then((value) {
      for (var element in value['data']) {
        historyList.add(HistoryModel.fromJson(element));
      }
    });
  }
}

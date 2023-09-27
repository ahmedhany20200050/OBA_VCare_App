class EndPoints {
  static String baseUrl = 'https://vcare.integration25.com/api';
  static String homeEndpoint = '/home/index';
  static String registerEndpoint = '/auth/register';
  static String loginEndpoint = '/auth/login';
  static String appointmentStoreEndpoint = '/appointment/store';
  static String doctorShowEndpoint = '/doctor/show/';
  static String userProfileEndpoint = '/user/profile';
  static String historyEndpoint = '/appointment/index';
  static String allDoctorsEndpoint = '/doctor/index';
  static String logoutEndpoint = '/auth/logout';
  static String citiesOfGovernmentEndPoint(int governmentId) =>
      '/city/show/$governmentId';
  static String getAllGovernmentsEndPoint = "/governrate/index";
  static String getAllSpecializationsEndPoint = "/specialization/index";
  static String getAllCitiesEndPoint = "/city/index";
  static String filterDoctorsEndpoint(
          {required int cityId, required int specializationId,required governorateId}) =>
      "/doctor/doctor-filter?city=$cityId&specialization=$specializationId&governrate=$governorateId";
  static String updateProfileEndpoint = "/user/update";
}

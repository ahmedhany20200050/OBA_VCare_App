// ignore_for_file: body_might_complete_normally_nullable
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../data/all_doctors_response.dart';
import '../manger/cubit/search_cubit.dart';
import '../manger/cubit/search_cubit_state.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const id = 'GetDoctorsScreen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController search = TextEditingController();
  List<Data> doctorsList = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetDoctorsCubit>(context).getAllDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetDoctorsCubit, GetDoctorsCubitState>(
      listener: (context, state) {
        if (state is GetDoctorsCubitFailure) {
          AnimatedSnackBar.material(
            state.err.toString().replaceAll("Exception:", " "),
            type: AnimatedSnackBarType.error,
            duration: const Duration(seconds: 4),
          ).show(context);
        }
      },
      builder: (context, state) {
        // var cubit = BlocProvider.of<GetDoctorsCubit>(context);
        return state is GetDoctorsCubitFailure
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
            : SafeArea(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8 * SizeConfig.verticalBlock),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3D000000),
                            blurRadius: 4,
                            offset: Offset(0, 2),
                            spreadRadius: 0,
                          ),
                          BoxShadow(
                            color: Color(0x2D000000),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10 * SizeConfig.horizontalBlock,
                          ),
                          Expanded(
                            child: TextFormField(
                              onChanged: (value) {
                                var cubit =
                                    BlocProvider.of<GetDoctorsCubit>(context);
                                if (state is GetDoctorsCubitSuccess) {
                                  var dummyList = cubit.doctors.data
                                      ?.toList()
                                      .where((element) {
                                    String name = element.name ?? "";
                                    return name
                                        .toLowerCase()
                                        .contains(value.toLowerCase());
                                  }).toList();
                                  setState(() {
                                    doctorsList = dummyList ?? [];
                                  });
                                }
                              },
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Search',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: SizedBox(
                        width: double.infinity,
                        child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          itemCount: doctorsList.length,
                          itemBuilder: (context, index) {
                            return DoctorGetDoctorsItem(
                              doctor: doctorsList[index],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
      },
    );
  }
}

class DoctorGetDoctorsItem extends StatelessWidget {
  const DoctorGetDoctorsItem({super.key, required this.doctor});
  final Data doctor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //todo: push doctor details with doctor id
        // Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorDetails(doctor.id??1),));
      },
      child: Ink(
        child: Container(
          padding: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
          height: 51 * SizeConfig.verticalBlock,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                  ),
                  child: Image.network(
                    doctor.photo ??
                        "https://via.placeholder.com/640x480.png/0099cc?text=doctors+ab",
                    fit: BoxFit.fill,
                    width: 50 * SizeConfig.verticalBlock,
                    height: 50 * SizeConfig.verticalBlock,
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${doctor.name}",
                    style: AppStyles.homeTitleStyle,
                  ),
                  const Spacer(),
                  Text(
                    "${doctor.specialization?.name}",
                    style: AppStyles.descriptionStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

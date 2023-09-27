import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/history_details/presentation/views/history_details_screen.dart';
import 'package:untitled/Features/home/data/models/history_model.dart';
import 'package:untitled/Features/user_profile/presentation/manager/cubits/get_all_appointments/get_all_appointments_cubit.dart';
import 'package:untitled/Features/user_profile/presentation/manager/cubits/get_all_appointments/get_all_appointments_states.dart';
import 'package:untitled/Features/user_profile/presentation/manager/cubits/user_profile/user_profile_cubit.dart';
import 'package:untitled/Features/user_profile/presentation/manager/cubits/user_profile/user_profile_states.dart';
import 'package:untitled/Features/user_profile_edit/presentation/views/user_profile_edit.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';
import 'package:untitled/core/widgets/get_error_message.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});
  static String id = "UserProfile";

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    UserProfileCubit.get(context).getUserProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileCubit, UserProfileStates>(
        listener: (_, state) {
          if (state is UserProfileSuccessState) {
            GetAllAppointmentCubit.get(context).getAllAppointments();
          }
        },
        listenWhen: (previous, current) => current is UserProfileSuccessState,
        builder: (_, state) {
          if (state is UserProfileSuccessState) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16 * SizeConfig.horizontalBlock,
                vertical: 20 * SizeConfig.verticalBlock,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.person_2_outlined,
                    size: 40,
                  ),
                  SizedBox(
                    height: 10 * SizeConfig.verticalBlock,
                  ),
                  Text(
                    state.userModel.name!,
                    style: AppStyles.textStyle24w400inter,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'edit account details ',
                        style: AppStyles.textStyle24w400inter.copyWith(
                          fontSize: 18,
                          color: AppColors.colorBlack.withOpacity(0.5),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed(
                            UserProfileEdit.id,
                            arguments: state.userModel.id.toString()),
                        child: Icon(
                          Icons.edit,
                          size: 20,
                          color: AppColors.colorBlack.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10 * SizeConfig.horizontalBlock,
                    ),
                    child: Column(
                      children: [
                        const Divider(
                          thickness: 2,
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.email_outlined,
                              size: 40,
                              color: AppColors.colorBlack,
                            ),
                            SizedBox(
                              width: 10 * SizeConfig.horizontalBlock,
                            ),
                            Text(
                              state.userModel.email!,
                              style: AppStyles.textStyle24w400inter.copyWith(
                                fontSize: 18,
                                color: AppColors.colorBlack,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.phone_outlined,
                              size: 40,
                              color: AppColors.colorBlack,
                            ),
                            SizedBox(
                              width: 10 * SizeConfig.horizontalBlock,
                            ),
                            Text(
                              state.userModel.phone!,
                              style: AppStyles.textStyle24w400inter.copyWith(
                                fontSize: 18,
                                color: AppColors.colorBlack,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'History',
                      style: AppStyles.textStyle24w400inter,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 60 * SizeConfig.horizontalBlock,
                      child: const Divider(
                        thickness: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  Expanded(
                    child: BlocBuilder<GetAllAppointmentCubit,
                        GetAllAppointmentsStates>(builder: (_, state) {
                      if (state is GetAllAppointmentsSuccessState) {
                        return ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          itemCount: state.appointments.isEmpty
                              ? 2
                              : state.appointments.length,
                          itemBuilder: (context, index) => state
                                  .appointments.isEmpty
                              ? const SizedBox()
                              : state.appointments.length == 1
                                  ? HistoryComponant(
                                      historyModel: state.appointments[0],
                                    )
                                  : HistoryComponant(
                                      historyModel: state.appointments[index],
                                    ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10 * SizeConfig.verticalBlock,
                          ),
                        );
                      } else if (state is GetAllAppointmentsFailureState) {
                        return GetErrorMessage(
                            errorMessage: state.errorMessage,
                            onPressed: () {
                              GetAllAppointmentCubit.get(context)
                                  .getAllAppointments();
                            });
                      } else {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(),
                        );
                      }
                    }),
                  ),
                ],
              ),
            );
          } else if (state is UserProfileFailureState) {
            return GetErrorMessage(
                errorMessage: state.errorMessage,
                onPressed: () {
                  UserProfileCubit.get(context).getUserProfile();
                });
          } else {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
        });
  }
}

class HistoryComponant extends StatelessWidget {
  const HistoryComponant({
    super.key,
    required this.historyModel,
  });
  final HistoryModel historyModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HistoryDetails(historyModel: historyModel),));
      },
      child: Ink(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(),
          ),
          child: Padding(
            padding: EdgeInsets.all(5 * SizeConfig.verticalBlock),
            child: Row(
              children: [
                Text(historyModel.appointmentTime!),
                const Spacer(),
                Text(historyModel.status!),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

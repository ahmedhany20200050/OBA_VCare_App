import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Features/doctor%20details(booking)/data/models/doctor_model.dart';
import 'package:untitled/Features/doctor%20details(booking)/presentation/manager/cubit/doctor_details_cubit.dart';
import 'package:untitled/Features/doctor%20details(booking)/presentation/manager/cubit/doctor_details_state.dart';
import 'package:untitled/Features/user_profile/presentation/views/user_profile.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});
  static String id = "DoctorDetails";

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController datecon = TextEditingController();
  int? selectedTimeIndex;
  bool firsttimeinthispage = true;
  bool isPicked = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorDetailsCubit, DoctorDetailsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: BlocProvider.of<DoctorDetailsCubit>(context).docmodel == null
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Form(
                      key: key,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                        BlocProvider.of<DoctorDetailsCubit>(
                                                context)
                                            .docmodel!
                                            .photo!),
                                  ),
                                  color: AppColors.primaryColor,
                                ),
                                height: 215 * SizeConfig.verticalBlock,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 8 * SizeConfig.horizontalBlock,
                                  top: 8 * SizeConfig.verticalBlock,
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.secondaryColor
                                          .withOpacity(0.5),
                                    ),
                                    child: const Icon(
                                      Icons.close,
                                      size: 30,
                                      color: AppColors.colorWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10 * SizeConfig.verticalBlock,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16 * SizeConfig.horizontalBlock,
                              vertical: 10 * SizeConfig.verticalBlock,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  BlocProvider.of<DoctorDetailsCubit>(context)
                                      .docmodel!
                                      .name!,
                                  style:
                                      AppStyles.textStyle34w400roboto.copyWith(
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                                SizedBox(
                                  height: 17 * SizeConfig.verticalBlock,
                                ),
                                Text(
                                  BlocProvider.of<DoctorDetailsCubit>(context)
                                      .docmodel!
                                      .description!,
                                  style:
                                      AppStyles.textStyle34w400roboto.copyWith(
                                    fontSize: 16 * SizeConfig.textRatio,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                                SizedBox(
                                  height: 11 * SizeConfig.verticalBlock,
                                ),
                                const Divider(
                                  thickness: 2,
                                ),
                                SizedBox(
                                  height: 12 * SizeConfig.verticalBlock,
                                ),
                                Text(
                                  'Select date',
                                  style:
                                      AppStyles.textStyle34w400roboto.copyWith(
                                    fontSize: 16 * SizeConfig.textRatio,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                                TextFormField(
                                  controller: datecon,
                                  readOnly: true,
                                  onTap: () => showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime(2025),
                                  ).then(
                                    (value) {
                                      if (value != null) {
                                        datecon.text =
                                            value.toString().split(' ')[0];
                                      }
                                    },
                                  ),
                                  // ignore: body_might_complete_normally_nullable
                                  validator: (value) {
                                    if (datecon.text.isEmpty ||
                                        datecon.text.contains('nu')) {
                                      return 'Date must be choosen';
                                    }
                                  },

                                  decoration: InputDecoration(
                                    hintText: 'yy/mm/dd',
                                    hintStyle: AppStyles.textStyle34w400roboto
                                        .copyWith(
                                      fontSize: 21 * SizeConfig.textRatio,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 19 * SizeConfig.verticalBlock,
                                ),
                                Text(
                                  'Select time',
                                  style:
                                      AppStyles.textStyle34w400roboto.copyWith(
                                    fontSize: 16 * SizeConfig.textRatio,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
                                ),
                                SizedBox(
                                  height: 8 * SizeConfig.verticalBlock,
                                ),
                                SizedBox(
                                  height: 30 * SizeConfig.verticalBlock,
                                  child: ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) =>
                                        GestureDetector(
                                      onTap: () {
                                        isPicked = true;
                                        setState(() {
                                          selectedTimeIndex = index;
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                          horizontal:
                                              16 * SizeConfig.horizontalBlock,
                                          vertical:
                                              6 * SizeConfig.verticalBlock,
                                        ),
                                        height: 15 * SizeConfig.verticalBlock,
                                        width: 75 * SizeConfig.horizontalBlock,
                                        decoration: BoxDecoration(
                                          color: selectedTimeIndex == index
                                              ? AppColors.primaryColor
                                              : AppColors.colorBlack
                                                  .withOpacity(
                                                  0.1,
                                                ),
                                          borderRadius:
                                              BorderRadius.circular(24),
                                          border: const Border(),
                                        ),
                                        child: Text(
                                          '19:00',
                                          style: AppStyles.textStyle34w400roboto
                                              .copyWith(
                                            fontSize: 14 * SizeConfig.textRatio,
                                            color: selectedTimeIndex == index
                                                ? AppColors.colorWhite
                                                : AppColors.colorBlack,
                                          ),
                                        ),
                                      ),
                                    ),
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      width: 8 * SizeConfig.horizontalBlock,
                                    ),
                                    itemCount: 5,
                                  ),
                                ),
                                if (isPicked == false &&
                                    firsttimeinthispage == false)
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 5 * SizeConfig.verticalBlock,
                                      ),
                                      const Text(
                                        'Time must be choosen',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 174, 34, 24),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                SizedBox(
                                  height: 33 * SizeConfig.verticalBlock,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  height: 36 * SizeConfig.verticalBlock,
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: AppColors.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        )),
                                    onPressed: () async {
                                      setState(() {
                                        firsttimeinthispage = false;
                                      });

                                      if (key.currentState!.validate() &&
                                          isPicked == true) {
                                        // BlocProvider.of<DoctorDetailsCubit>(
                                        //         context)
                                        //     .bookAppointment(
                                        //   doctorId: ,
                                        //   startTime: '${datecon.text} ',
                                        // );
                                      }
                                    },
                                    child: Text(
                                      "BOOK AN APPOINTMENT",
                                      textAlign: TextAlign.center,
                                      style: AppStyles.buttonTextStyle,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}

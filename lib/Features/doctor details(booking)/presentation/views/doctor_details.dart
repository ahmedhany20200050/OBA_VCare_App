import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled/Features/doctor%20details(booking)/presentation/manager/cubit/doctor_details_cubit.dart';
import 'package:untitled/Features/doctor%20details(booking)/presentation/manager/cubit/doctor_details_state.dart';
import 'package:untitled/Features/home/presentation/manager/cubits/cubit/home_cubit.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key, required this.docID});
  static const id = "DoctorDetails";
  final String docID;
  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController datecon = TextEditingController();
  int? selectedTimeIndex;
  String? selectedTime;
  bool firsttimeinthispage = true;
  bool isPicked = false;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      BlocProvider.of<DoctorDetailsCubit>(context)
          .showDoctorDetails(docId: widget.docID);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorDetailsCubit, DoctorDetailsState>(
      listener: (context, state) {
        if (state is BookAppointmentSuccess) {
          BlocProvider.of<HomeCubit>(context).getHistory();
          AnimatedSnackBar.material(
            'Appointment booked Successfully',
            type: AnimatedSnackBarType.success,
            duration: const Duration(seconds: 4),
          ).show(context);
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var doctorM = BlocProvider.of<DoctorDetailsCubit>(context).docmodel;
        return Scaffold(
          body: BlocProvider.of<DoctorDetailsCubit>(context).docmodel == null ||
                  BlocProvider.of<DoctorDetailsCubit>(context)
                      .availTimes
                      .isEmpty
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    child: Form(
                      key: key,
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      BlocProvider.of<DoctorDetailsCubit>(
                                                      context)
                                                  .docmodel!
                                                  .gender!
                                                  .contains('fe') ||
                                              BlocProvider.of<
                                                          DoctorDetailsCubit>(
                                                      context)
                                                  .docmodel!
                                                  .name!
                                                  .startsWith('Ms.') ||
                                              BlocProvider.of<
                                                          DoctorDetailsCubit>(
                                                      context)
                                                  .docmodel!
                                                  .name!
                                                  .startsWith('Miss')
                                          ? 'assets/images/doctor-woman.jpg'
                                          : 'assets/images/doctor-man.jpg',
                                    ),
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
                                    BlocProvider.of<DoctorDetailsCubit>(context)
                                        .docmodel = null;
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
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    BlocProvider.of<DoctorDetailsCubit>(context)
                                        .docmodel!
                                        .name!,
                                    textAlign: TextAlign.center,
                                    style: AppStyles.textStyle34w400roboto
                                        .copyWith(
                                      fontSize: 28,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10 * SizeConfig.verticalBlock,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.email,
                                      color: AppColors.primaryColor,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: 280 * SizeConfig.horizontalBlock,
                                      child: Text(
                                        doctorM!.email!,
                                        style: AppStyles.textStyle24w400inter
                                            .copyWith(fontSize: 16),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5 * SizeConfig.verticalBlock,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      color: AppColors.primaryColor,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      doctorM.phone!,
                                      style: AppStyles.textStyle24w400inter
                                          .copyWith(fontSize: 16),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5 * SizeConfig.verticalBlock,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      FontAwesomeIcons.stethoscope,
                                      color: AppColors.primaryColor,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: 160,
                                      child: Text(
                                        doctorM.specialization!.name!,
                                        style: AppStyles.textStyle24w400inter
                                            .copyWith(fontSize: 16),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    const Icon(
                                      FontAwesomeIcons.graduationCap,
                                      color: AppColors.primaryColor,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      doctorM.degree!,
                                      style: AppStyles.textStyle24w400inter
                                          .copyWith(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5 * SizeConfig.verticalBlock,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: AppColors.primaryColor,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 10),
                                    SizedBox(
                                      width: 160,
                                      child: Text(
                                        doctorM.city!.name!,
                                        style: AppStyles.textStyle24w400inter
                                            .copyWith(fontSize: 16),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    const Icon(
                                      Icons.payments_rounded,
                                      color: AppColors.primaryColor,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      doctorM.appointPrice!.toString(),
                                      style: AppStyles.textStyle24w400inter
                                          .copyWith(fontSize: 16),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10 * SizeConfig.verticalBlock,
                                ),
                                Text(
                                  'Select date',
                                  style:
                                      AppStyles.textStyle34w400roboto.copyWith(
                                    fontSize: 16 * SizeConfig.textRatio,
                                    color: AppColors.primaryColor,
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
                                      fontSize: 20 * SizeConfig.textRatio,
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15 * SizeConfig.verticalBlock,
                                ),
                                Text(
                                  'Select time',
                                  style:
                                      AppStyles.textStyle34w400roboto.copyWith(
                                    fontSize: 16 * SizeConfig.textRatio,
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 10 * SizeConfig.verticalBlock,
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
                                        selectedTime =
                                            BlocProvider.of<DoctorDetailsCubit>(
                                                    context)
                                                .availTimes[index];
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
                                          BlocProvider.of<DoctorDetailsCubit>(
                                                  context)
                                              .availTimes[index],
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
                                    itemCount:
                                        BlocProvider.of<DoctorDetailsCubit>(
                                                context)
                                            .availTimes
                                            .length,
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
                                  height: 25 * SizeConfig.verticalBlock,
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
                                        BlocProvider.of<DoctorDetailsCubit>(
                                                context)
                                            .bookAppointment(
                                          doctorId: widget.docID,
                                          startTime:
                                              '${datecon.text} $selectedTime',
                                        );
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

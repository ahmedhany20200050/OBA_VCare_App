import 'package:flutter/material.dart';
import 'package:untitled/Features/user_profile/presentation/views/user_profile.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';

class DoctorDetails extends StatefulWidget {
  const DoctorDetails({super.key});

  @override
  State<DoctorDetails> createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  int? selected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: 215 * SizeConfig.verticalBlock,
                    color: AppColors.primaryColor,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 8 * SizeConfig.horizontalBlock,
                        top: 8 * SizeConfig.verticalBlock),
                    child: IconButton(
                      onPressed: () {},
                      icon: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.secondaryColor.withOpacity(0.5),
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
                height: 20 * SizeConfig.verticalBlock,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16 * SizeConfig.horizontalBlock,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Doctor Name',
                      style: AppStyles.textStyle34w400roboto.copyWith(
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    SizedBox(
                      height: 17 * SizeConfig.verticalBlock,
                    ),
                    Text(
                      'Doctor description here and summary about everything they did and who they are etc.. lorem ipsum lorem ipsum lorem ipsum lorem ipsum.',
                      style: AppStyles.textStyle34w400roboto.copyWith(
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
                      style: AppStyles.textStyle34w400roboto.copyWith(
                        fontSize: 16 * SizeConfig.textRatio,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    TextField(
                      onTap: () => showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2025),
                      ),
                      decoration: InputDecoration(
                        hintText: 'yy/mm/dd',
                        hintStyle: AppStyles.textStyle34w400roboto.copyWith(
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
                      style: AppStyles.textStyle34w400roboto.copyWith(
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
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16 * SizeConfig.horizontalBlock,
                              vertical: 6 * SizeConfig.verticalBlock,
                            ),
                            height: 15 * SizeConfig.verticalBlock,
                            width: 75 * SizeConfig.horizontalBlock,
                            decoration: BoxDecoration(
                              color: selected == index
                                  ? AppColors.primaryColor
                                  : AppColors.colorBlack.withOpacity(
                                      0.1,
                                    ),
                              borderRadius: BorderRadius.circular(24),
                              border: const Border(),
                            ),
                            child: Text(
                              '19:00',
                              style: AppStyles.textStyle34w400roboto.copyWith(
                                fontSize: 14 * SizeConfig.textRatio,
                                color: selected == index
                                    ? AppColors.colorWhite
                                    : AppColors.colorBlack,
                              ),
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 8 * SizeConfig.horizontalBlock,
                        ),
                        itemCount: 5,
                      ),
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
                              borderRadius: BorderRadius.circular(4),
                            )),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>const UserProfile(),
                              ));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 8 * SizeConfig.verticalBlock,
                          ),
                          child: Text(
                            "BOOK AN APPOINTMENT",
                            textAlign: TextAlign.center,
                            style: AppStyles.buttonTextStyle,
                          ),
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
    );
  }
}

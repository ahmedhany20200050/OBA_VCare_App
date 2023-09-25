import 'package:flutter/material.dart';
import 'package:untitled/Features/user_profile_edit/presentation/views/user_profile_edit.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});
  static String id ="UserProfile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
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
                'user name',
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
                    onTap: () => Navigator.of(context).pushNamed(UserProfileEdit.id),
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
                          'employee@email.com',
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
                          '+20123178903',
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
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 15,
                  itemBuilder: (context, index) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(5 * SizeConfig.verticalBlock),
                      child: const Row(
                        children: [
                          Text('Booking date'),
                          Spacer(),
                          Text('Status'),
                        ],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 10 * SizeConfig.verticalBlock,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';
import 'package:untitled/core/widgets/custom_app_bar.dart';
import 'package:untitled/core/widgets/custom_text_form_field.dart';

class UserProfileEdit extends StatefulWidget {
  const UserProfileEdit({super.key});
  static const id = "UserProfileEdit";

  @override
  State<UserProfileEdit> createState() => _UserProfileEditState();
}

class _UserProfileEditState extends State<UserProfileEdit> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    // String userId = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const Drawer(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * SizeConfig.horizontalBlock,
          vertical: 20 * SizeConfig.verticalBlock,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Update details!',
                  style: AppStyles.textStyle34w400roboto,
                ),
                SizedBox(
                  height: 20 * SizeConfig.verticalBlock,
                ),
                Text(
                  'Update your info and become a new you!',
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle34w400roboto.copyWith(
                    fontSize: 16 * SizeConfig.textRatio,
                    color: AppColors.colorBlack.withOpacity(0.5),
                  ),
                ),
                SizedBox(
                  height: 20 * SizeConfig.verticalBlock,
                ),
                CustomTextFormField(
                  controller: name,
                  hintText: 'Name',
                  validator: (p0) {},
                ),
                SizedBox(
                  height: 20 * SizeConfig.verticalBlock,
                ),
                CustomTextFormField(
                  controller: email,
                  hintText: 'Email',
                  validator: (p0) {},
                ),
                SizedBox(
                  height: 20 * SizeConfig.verticalBlock,
                ),
                CustomTextFormField(
                  controller: phone,
                  hintText: 'Phone',
                  validator: (p0) {},
                ),
                SizedBox(
                  height: 20 * SizeConfig.verticalBlock,
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: AppColors.primaryColor,
                        value: isMale,
                        onChanged: (value) {
                          setState(() {
                            isMale = true;
                          });
                        }),
                    Text(
                      "Male",
                      style: AppStyles.textStyle34w400roboto.copyWith(
                        fontSize: 16 * SizeConfig.textRatio,
                      ),
                    ),
                    SizedBox(
                      width: 20 * SizeConfig.horizontalBlock,
                    ),
                    Checkbox(
                        activeColor: AppColors.primaryColor,
                        value: !isMale,
                        onChanged: (value) {
                          setState(() {
                            isMale = false;
                          });
                        }),
                    Text(
                      "Female",
                      style: AppStyles.textStyle34w400roboto.copyWith(
                        fontSize: 16 * SizeConfig.textRatio,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20 * SizeConfig.verticalBlock,
                ),
                SizedBox(
                  height: 48 * SizeConfig.verticalBlock,
                  width: 312 * SizeConfig.horizontalBlock,
                  child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        )),
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {}
                    },
                    child: Text(
                      "UPDATE",
                      textAlign: TextAlign.center,
                      style: AppStyles.buttonTextStyle,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

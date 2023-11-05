import 'package:flutter/material.dart';
import 'package:untitled/Features/history_details/presentation/views/history_details_screen.dart';
import 'package:untitled/Features/home/data/models/history_model.dart';
import 'package:untitled/Features/home/data/models/user_model.dart';
import 'package:untitled/Features/user_profile_edit/presentation/views/user_profile_edit.dart';
import 'package:untitled/core/app_colors.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';
import 'package:untitled/core/widgets/custom_button.dart';

class UserProfile extends StatelessWidget {
  const UserProfile(
      {super.key, required this.userModel, required this.historyList});
  static String id = "UserProfile";

  final UserModel? userModel;
  final List<HistoryModel> historyList;

  @override
  Widget build(BuildContext context) {
    return userModel == null
        ? const Center(child: CircularProgressIndicator.adaptive())
        : Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * SizeConfig.horizontalBlock,
              vertical: 20 * SizeConfig.verticalBlock,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 80,
                      child: userModel != null
                          ? Image.asset(userModel!.gender!.contains('f')
                              ? 'assets/images/woman.png'
                              : 'assets/images/man.png')
                          : null,
                    ),
                    SizedBox(
                      height: 10 * SizeConfig.verticalBlock,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: 220,
                          child: Text(
                            userModel!.name!,
                            style: AppStyles.textStyle24w400inter
                                .copyWith(fontSize: 20),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(
                          height: 5 * SizeConfig.verticalBlock,
                        ),
                        SizedBox(
                          width: 220,
                          child: Text(
                            userModel!.email!,
                            style: AppStyles.textStyle24w400inter.copyWith(
                              fontSize: 16,
                              color: AppColors.colorBlack.withOpacity(0.5),
                            ),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        SizedBox(
                          height: 20 * SizeConfig.verticalBlock,
                        ),
                        CustomButton(
                          mustBeMaxSize: false,
                          buttonText: 'Edit account',
                          onTap: () => Navigator.of(context).pushNamed(
                              UserProfileEdit.id,
                              arguments: userModel!.id.toString()),
                          verticalPadding: 25,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 25 * SizeConfig.verticalBlock,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'History',
                    style: AppStyles.textStyle24w400inter.copyWith(
                      color: AppColors.primaryColor,
                    ),
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
                  height: 10 * SizeConfig.verticalBlock,
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: historyList.isEmpty ? 1 : historyList.length,
                    itemBuilder: (context, index) => historyList.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(top: 70),
                            child: Center(
                              child: Text(
                                'Empty for now!',
                                style: AppStyles
                                    .color0xFF020D18FontSize16FontWeightW400,
                              ),
                            ),
                          )
                        : HistoryComponant(
                            historyModel: historyList[index],
                          ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 10 * SizeConfig.verticalBlock,
                    ),
                  ),
                ),
              ],
            ),
          );
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
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HistoryDetails(historyModel: historyModel),
            ));
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
                Text(historyModel.status!,
                    style: const TextStyle(color: AppColors.primaryColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

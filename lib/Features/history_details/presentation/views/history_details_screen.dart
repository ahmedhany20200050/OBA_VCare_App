// ignore_for_file: body_might_complete_normally_nullable
import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/Features/register/presentation/views/register_screen.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_styles.dart';
import '../../../../core/utils/size_config.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../home/presentation/views/home_screen.dart';
import '../manger/cubit/history_details_cubit.dart';
import '../manger/cubit/history_details_cubit_state.dart';

class HistoryDetails extends StatefulWidget {
  const HistoryDetails({super.key});
  static const id = 'HistoryDetails';

  @override
  State<HistoryDetails> createState() => _HistoryDetailsState();
}

class _HistoryDetailsState extends State<HistoryDetails> {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryDetailsCubit, HistoryDetailsCubitState>(
      listener: (context, state) {

      },
      builder: (context, state) {

        return Scaffold(
          appBar: const CustomAppBar(),
          drawer: const Drawer(),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Doctor details",style: AppStyles.homeTitleStyle.copyWith(fontSize: 20*SizeConfig.textRatio),),
                  SizedBox(
                    height: 16*SizeConfig.verticalBlock,
                  ),
                   Property(name: "name",value: "doctor name"),
                   Property(name: "location", value: "doctor location"),
                   Property(name: "email", value: "doctor email"),
                   Property(name: "phone", value: "doctor phone"),
                   SizedBox(height: 20*SizeConfig.verticalBlock,),
                   Text("Patient details",style: AppStyles.homeTitleStyle.copyWith(fontSize: 20*SizeConfig.textRatio),),
                   SizedBox(
                     height: 16*SizeConfig.verticalBlock,
                   ),
                   Property(name: "name",value: "patient name"),
                   Property(name: "location", value: "patient location"),
                   Property(name: "email", value: "patient email"),
                   Property(name: "phone", value: "patient phone"),
                  SizedBox(height: 20*SizeConfig.verticalBlock,),
                  Text("Appointment details",style: AppStyles.homeTitleStyle.copyWith(fontSize: 20*SizeConfig.textRatio),),
                  SizedBox(
                    height: 16*SizeConfig.verticalBlock,
                  ),
                  Property(name: "date",value: "date"),
                  Property(name: "id", value: "id"),
                  Property(name: "status", value: "status"),
                  SizedBox(
                    height: 10*SizeConfig.verticalBlock,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10*SizeConfig.verticalBlock,horizontal: 5*SizeConfig.horizontalBlock),
                    color: AppColors.primaryColor,
                    child: Row(children: [
                      Text("Total",style: AppStyles.homeTitleStyle.copyWith(fontWeight: FontWeight.w500,color: Colors.white),),
                      const Spacer(),
                      Text("\$00.00",style: AppStyles.homeTitleStyle.copyWith(fontWeight: FontWeight.w500,color: Colors.white),),
                    ],),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Property extends StatelessWidget {
  const Property({
    super.key, required this.name, required this.value,
  });
  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
     Text(name,style: AppStyles.homeTitleStyle.copyWith(fontWeight: FontWeight.w500),),
     const Spacer(),
     Text(value,style: AppStyles.homeTitleStyle.copyWith(fontWeight: FontWeight.w500),),
                  ],);
  }
}



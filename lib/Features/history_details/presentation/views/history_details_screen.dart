// ignore_for_file: body_might_complete_normally_nullable
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Features/home/data/models/history_model.dart';
import '../../../../core/app_colors.dart';
import '../../../../core/app_styles.dart';
import '../../../../core/utils/size_config.dart';
import '../manger/cubit/history_details_cubit.dart';
import '../manger/cubit/history_details_cubit_state.dart';

class HistoryDetails extends StatefulWidget {
  const HistoryDetails({super.key, required this.historyModel});
  final HistoryModel historyModel;
  static const id = 'HistoryDetails';

  @override
  State<HistoryDetails> createState() =>
      // ignore: no_logic_in_create_state
      _HistoryDetailsState(historyModel);
}

class _HistoryDetailsState extends State<HistoryDetails> {
  _HistoryDetailsState(this.historyModel);
  final HistoryModel historyModel;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HistoryDetailsCubit, HistoryDetailsCubitState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
          foregroundColor: AppColors.colorWhite,
          backgroundColor: AppColors.primaryColor,
        ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Doctor details",
                    style: AppStyles.homeTitleStyle
                        .copyWith(fontSize: 20 * SizeConfig.textRatio),
                  ),
                  SizedBox(
                    height: 10 * SizeConfig.verticalBlock,
                  ),
                  Property(name: "name", value: "${historyModel.doctor?.name}"),
                  Property(
                      name: "location",
                      value: "${historyModel.doctor?.city?.name}"),
                  Property(
                      name: "email", value: "${historyModel.doctor?.email}"),
                  Property(
                      name: "phone", value: "${historyModel.doctor?.phone}"),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  Text(
                    "Patient details",
                    style: AppStyles.homeTitleStyle
                        .copyWith(fontSize: 20 * SizeConfig.textRatio),
                  ),
                  SizedBox(
                    height: 10 * SizeConfig.verticalBlock,
                  ),
                  Property(
                      name: "name", value: "${historyModel.patient?.name}"),
                  Property(
                      name: "gender", value: "${historyModel.patient?.gender}"),
                  Property(
                      name: "email", value: "${historyModel.patient?.email}"),
                  Property(
                      name: "phone", value: "${historyModel.patient?.phone}"),
                  SizedBox(
                    height: 20 * SizeConfig.verticalBlock,
                  ),
                  Text(
                    "Appointment details",
                    style: AppStyles.homeTitleStyle
                        .copyWith(fontSize: 20 * SizeConfig.textRatio),
                  ),
                  SizedBox(
                    height: 10 * SizeConfig.verticalBlock,
                  ),
                  Property(
                      name: "date", value: "${historyModel.appointmentTime}"),
                  Property(name: "id", value: "${historyModel.id}"),
                  Property(name: "status", value: "${historyModel.status}"),
                  SizedBox(
                    height: 30 * SizeConfig.verticalBlock,
                  ),
                  Container(
                    padding: EdgeInsets.all(
                      10 * SizeConfig.verticalBlock,
                    ),
                    color: AppColors.primaryColor,
                    child: Row(
                      children: [
                        Text(
                          "Total",
                          style: AppStyles.homeTitleStyle.copyWith(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                        const Spacer(),
                        Text(
                          "${historyModel.appointmentPrice}\$",
                          style: AppStyles.homeTitleStyle.copyWith(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ],
                    ),
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
    super.key,
    required this.name,
    required this.value,
  });
  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80 * SizeConfig.horizontalBlock,
          child: Text(
            name,
            style:
                AppStyles.homeTitleStyle.copyWith(fontWeight: FontWeight.w500),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style:
                AppStyles.homeTitleStyle.copyWith(fontWeight: FontWeight.w500),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

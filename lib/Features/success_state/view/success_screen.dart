import 'package:flutter/material.dart';
import 'package:untitled/core/app_styles.dart';
import 'package:untitled/core/utils/size_config.dart';

class SuccessStateScreen extends StatefulWidget {
  const SuccessStateScreen({super.key});
  static const id = 'SuccessStateScreen';

  @override
  State<SuccessStateScreen> createState() => _SuccessStateScreenState();
}

class _SuccessStateScreenState extends State<SuccessStateScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        // print('2 second has passed.');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.done,
            size: 100,
            color: Colors.green,
          ),
          SizedBox(
            height: 16 * SizeConfig.verticalBlock,
          ),
          Text(
            'Appointment Booked',
            textAlign: TextAlign.center,
            style: AppStyles.textStyle34w400roboto.copyWith(
              fontSize: 24 * SizeConfig.textRatio,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

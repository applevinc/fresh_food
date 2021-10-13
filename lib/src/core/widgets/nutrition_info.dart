import 'package:flutter/material.dart';
import 'package:fresh_food_ui/src/core/global/nutrition_info_entity.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NutritionInfo extends StatelessWidget {
  const NutritionInfo({Key key, @required this.entity}) : super(key: key);

  final entity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nutritional Information',
          style: Theme.of(context).textTheme.headline6.copyWith(color: AppColors.green),
        ),
        Column(
          children: List.generate(entity.nutritionInfo.length, (index) {
            List<NutritionInfoEntity> nutritionInfo = [];
            entity.nutritionInfo.forEach((key, value) =>
                nutritionInfo.add(NutritionInfoEntity(label: key, value: value)));
            var nutritionInfoElement = nutritionInfo[index];

            return _NutritionInfoItem(nutritionInfoElement);
          }),
        )
      ],
    );
  }
}

class _NutritionInfoItem extends StatelessWidget {
  const _NutritionInfoItem(
    this.nutritionInfoElement,
  );

  final NutritionInfoEntity nutritionInfoElement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nutritionInfoElement.label,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.w500,
                ),
          ),
          Text(
            nutritionInfoElement.value,
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColors.medium_grey,
                ),
          ),
        ],
      ),
    );
  }
}

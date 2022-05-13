import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_food_ui/src/core/assets/icons.dart';
import 'package:fresh_food_ui/src/core/style/colors.dart';
import 'package:fresh_food_ui/src/core/style/constants.dart';
import 'package:fresh_food_ui/src/core/widgets/button.dart';
import 'package:provider/provider.dart';

const String _standard = 'Standard';
const String _supersonic = 'Supersonic';

class DeliveryOptionsScreen extends StatefulWidget {
  const DeliveryOptionsScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryOptionsScreen> createState() => _DeliveryOptionsScreenState();
}

class _DeliveryOptionsScreenState extends State<DeliveryOptionsScreen>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider(
      create: (_) => DeliveryOptionController(),
      child: Padding(
        padding: EdgeInsets.only(top: 23.h, bottom: 30.h),
        child: Column(
          children: [
            _SelectSpeed(),
            SizedBox(height: 22.h),
            _Select(
              label: 'Date',
              widget: _SelectWidget(label: '14 Oct'),
            ),
            SizedBox(height: 22.h),
            _Select(
              label: 'Time',
              widget: _SelectWidget(label: '8:00 am'),
            ),
            SizedBox(height: 47.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: CustomButton(
                label: 'Continue',
                icon: Icons.arrow_forward,
                onTap: () {
                  DefaultTabController.of(context)!.animateTo(2);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Select extends StatelessWidget {
  const _Select({
    Key? key,
    required this.label,
    required this.widget,
  }) : super(key: key);

  final String label;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Select $label',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),
          SizedBox(height: 25.h),
          widget,
        ],
      ),
    );
  }
}

class _SelectWidget extends StatelessWidget {
  const _SelectWidget({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        itemCount: 10,
        itemBuilder: (context, index) {
          return _SelectWidgetItem(label: label);
        },
      ),
    );
  }
}

class _SelectWidgetItem extends StatefulWidget {
  const _SelectWidgetItem({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  State<_SelectWidgetItem> createState() => _SelectWidgetItemState();
}

class _SelectWidgetItemState extends State<_SelectWidgetItem> {
  bool selected = false;

  void toggle() {
    if (selected) {
      selected = false;
    } else {
      selected = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          toggle();
        });
      },
      child: Container(
        height: 60.h,
        width: 90.w,
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 15.w),
        decoration: BoxDecoration(
          color: (selected)
              ? AppColors.green
              : (isDarkMode(context))
                  ? AppColors.dark_grey
                  : AppColors.lighter_grey,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: (selected)
                  ? Colors.white
                  : Theme.of(context).textTheme.bodyText1!.color),
        ),
      ),
    );
  }
}

class _SelectSpeed extends StatelessWidget {
  const _SelectSpeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Select Speed',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          SizedBox(height: 25.h),
          Consumer<DeliveryOptionController>(
            builder: (_, controller, child) {
              return Row(
                children: [
                  _DeliveryOptionContainer(
                    value: controller.standard,
                    label: _standard,
                    img: AppIcons.delivery,
                    title: 'Standard',
                    subtitle: '2-3 days (free)',
                    onTap: controller.toggleStandard,
                  ),
                  SizedBox(width: 15.w),
                  _DeliveryOptionContainer(
                    value: controller.supersonic,
                    label: _supersonic,
                    img: AppIcons.fast_delivery,
                    title: 'Supersonic',
                    subtitle: 'Next day (£4.99)',
                    onTap: controller.toggleSupersonic,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _DeliveryOptionContainer extends StatelessWidget {
  _DeliveryOptionContainer({
    Key? key,
    required this.value,
    required this.label,
    required this.title,
    required this.subtitle,
    required this.img,
    required this.onTap,
  }) : super(key: key);

  final bool value;
  final String label;
  final String title;
  final String subtitle;
  final img;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(top: 26.h, bottom: 15.h),
          decoration: BoxDecoration(
            color: isDarkMode(context) ? AppColors.dark_grey : AppColors.lighter_grey,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            children: [
              Image.asset(img),
              SizedBox(height: 15.h),
              Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w400),
              ),
              Text(
                subtitle,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: AppColors.medium_grey),
              ),
              SizedBox(height: 12.h),
              (value == true)
                  ? Image.asset(AppIcons.delivery_selected)
                  : Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: isDarkMode(context)
                            ? AppColors.darker_grey
                            : AppColors.light_grey,
                        shape: BoxShape.circle,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class DeliveryOptionController extends ChangeNotifier {
  bool standard = false;
  bool supersonic = false;

  void toggleStandard() {
    if (standard == true) {
      standard = false;
      supersonic = true;
      notifyListeners();
    } else {
      standard = true;
      supersonic = false;
      notifyListeners();
    }
  }

  void toggleSupersonic() {
    if (supersonic == true) {
      supersonic = false;
      standard = true;
      notifyListeners();
    } else {
      supersonic = true;
      standard = false;
      notifyListeners();
    }
  }
}

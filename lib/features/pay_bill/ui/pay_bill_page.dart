import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/enums/bill_payment_method_type.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/buttons/app_dropdown_button.dart';
import 'package:mula_biz_mobile/features/pay_bill/ui/widgets/biller_avatar.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class PayBillPage extends StatefulWidget {
  const PayBillPage({super.key});

  @override
  State<PayBillPage> createState() => _PayBillPageState();
}

class _PayBillPageState extends State<PayBillPage> {
  BillPaymentMethodType _billPaymentMethodType = BillPaymentMethodType.prepaid;
  final List<String> _listCategories = [
    LocaleKeys.phoneNumber.tr(),
    LocaleKeys.accountNumber.tr(),
    LocaleKeys.creditOrDebitCard.tr(),
    LocaleKeys.idNumber.tr(),
  ];

  final List<DropdownWidgetViewModel> _listCountry = [
    DropdownWidgetViewModel(
      value: 'value 1',
      widget: Assets.images.thaiFlag.image(width: 24, height: 16),
    ),
    DropdownWidgetViewModel(
      value: 'value 1',
      widget: Assets.images.usFlag.image(width: 24, height: 16),
    ),
    DropdownWidgetViewModel(
      value: 'value 1',
      widget: Assets.images.ukFlag.image(width: 24, height: 16),
    ),
    DropdownWidgetViewModel(
      value: 'value 1',
      widget: Assets.images.euFlag.image(width: 24, height: 16),
    ),
    DropdownWidgetViewModel(
      value: 'value 1',
      widget: Assets.images.jaFlag.image(width: 24, height: 16),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: LocaleKeys.billPayment.tr(),
      ),
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _billPaymentMethodTab(),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppDropdownButton<String>(
                    items: _listCategories,
                    initValue: LocaleKeys.categories.tr(),
                    hintWidget: Text(
                      LocaleKeys.categories.tr(),
                      style: AppTypo.bodyTiny,
                    ),
                    width: 172,
                  ),
                  AppDropdownButton<DropdownWidgetViewModel>(
                    items: _listCountry,
                    initValue: _listCountry.first,
                    hintWidget: _listCountry.first.widget,
                    width: 76,
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              GridView.builder(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 24,
                    crossAxisSpacing: 64,
                    childAspectRatio: 1 / 1.25),
                itemBuilder: (_, int index) => BillerAvatar(
                  onTap: () {
                    context.push(Routes.payBillSetupInforPage,
                        extra: _billPaymentMethodType);
                  },
                  name: index.toString(),
                ),
                shrinkWrap: true,
                itemCount: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _billPaymentMethodTab() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() {
              _billPaymentMethodType = BillPaymentMethodType.prepaid;
            }),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                color: _billPaymentMethodType == BillPaymentMethodType.prepaid
                    ? AppColors.burgundy
                    : AppColors.white,
              ),
              height: 40,
              child: Center(
                child: Text(
                  LocaleKeys.prepaid.tr(),
                  style: AppTypo.bodySmall.copyWith(
                    color:
                        _billPaymentMethodType == BillPaymentMethodType.prepaid
                            ? AppColors.white
                            : AppColors.grey[500],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() {
              _billPaymentMethodType = BillPaymentMethodType.eBill;
            }),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
                color: _billPaymentMethodType == BillPaymentMethodType.eBill
                    ? AppColors.burgundy
                    : AppColors.white,
              ),
              height: 40,
              child: Center(
                child: Text(
                  "e-Bill",
                  style: AppTypo.bodySmall.copyWith(
                    color: _billPaymentMethodType == BillPaymentMethodType.eBill
                        ? AppColors.white
                        : AppColors.grey[500],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

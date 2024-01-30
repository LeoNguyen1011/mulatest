import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/widgets/powered_by_widget.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class SlipPage extends StatelessWidget {
  const SlipPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: BaseAppBar(
        title: title,
        hasBack: false,
        actions: [
          GestureDetector(
              onTap: () {
                context.go(Routes.main);
              },
              child: Assets.svg.home.svg()),
        ],
      ),
      extendBodyBehindAppBar: true,
      bottomButtonOnPressed: () {
        context.go(Routes.main);
      },
      bottomButtonTitle: LocaleKeys.confirm.tr(),
      isShowPoweredBy: true,
      customBottomWidget: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Assets.svg.saveSlip.svg(),
          Text(
            LocaleKeys.saveSlip.tr(),
            style: AppTypo.bodyTiny.copyWith(
              color: AppColors.burgundy,
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: Assets.images.transferSuccessBackground.provider(),
          fit: BoxFit.fill,
        )),
        padding: EdgeInsets.all(16.r).copyWith(bottom: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _paymentProcessHeader(),
              const Divider(),
              _transferTo(),
              const Divider(),
              _transferInfoBody(),
              const Divider(),
              _note(),
              const Divider(),
              SizedBox(
                height: 16.h,
              ),
              const PoweredByWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _note() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.note.tr(),
            style: AppTypo.bodyTiny,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            'Lorem ipsum odore mio cuore lorem ipsum odore',
            style: AppTypo.bodyTiny,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _paymentProcessHeader() {
    return Padding(
      padding: EdgeInsets.only(
        top: 16.h,
        bottom: 16.h,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            Assets.svg.alertCheck.svg(width: 48, height: 48),
            SizedBox(
              height: 8.h,
            ),
            Text(
              LocaleKeys.paymentProcessed.tr(),
              style: AppTypo.heading5.copyWith(color: AppColors.color6DA92F),
            ),
            Text(
              "01 Jan 2021, 13:45:01",
              style: AppTypo.bodyTiny,
            ),
            Text(
              "Ref ID: 0001100110101101",
              style: AppTypo.bodyTiny.copyWith(
                color: AppColors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _transferTo() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _transferAccountInfo(
              name: "Gene Sirapat MULA Wallet",
              accountNumber: "XXXXXXX4000000163"),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Assets.svg.transferToArrow.svg(),
          ),
          SizedBox(
            height: 8.h,
          ),
          _transferAccountInfo(
              name: "สิรภัทร PromptPay", accountNumber: "XXX-XXX-0001"),
        ],
      ),
    );
  }

  Widget _transferInfoBody() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoWidget(
            title: LocaleKeys.paymentType.tr(),
            data: "e-bill",
          ),
          SizedBox(
            height: 4.h,
          ),
          _infoWidget(
            title: LocaleKeys.amount.tr(),
            data: "12,500.00 THB",
          ),
          SizedBox(
            height: 4.h,
          ),
          _infoWidget(
            title: LocaleKeys.fee.tr(),
            data: "00.00 THB",
          ),
          SizedBox(
            height: 4.h,
          ),
          _infoWidget(
            title: LocaleKeys.ewaDrawFee.tr(),
            data: "00.00 THB",
          ),
          SizedBox(
            height: 4.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.total.tr(),
                style: AppTypo.heading7,
              ),
              Text(
                "12,500.00",
                style: AppTypo.heading7,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _infoWidget({
    required String title,
    required String data,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTypo.bodyTiny,
        ),
        Text(
          data,
          style: AppTypo.bodyTiny.copyWith(color: AppColors.secondary),
        ),
      ],
    );
  }

  Row _transferAccountInfo(
      {required String name, required String accountNumber}) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          color: Colors.red,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: AppTypo.heading7,
            ),
            Text(
              accountNumber,
              style: AppTypo.bodyTiny,
            ),
          ],
        ),
      ],
    );
  }
}

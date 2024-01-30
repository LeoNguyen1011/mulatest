import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mula_biz_mobile/base/bloc/index.dart';
import 'package:mula_biz_mobile/common/index.dart';
import 'package:mula_biz_mobile/common/utils/encryption_helper.dart';
import 'package:mula_biz_mobile/common/validation/email_validation.dart';
import 'package:mula_biz_mobile/common/widgets/app_dialog.dart';
import 'package:mula_biz_mobile/common/widgets/app_toast.dart';
import 'package:mula_biz_mobile/common/widgets/mula_error_widget.dart';
import 'package:mula_biz_mobile/common/widgets/not_found_widget.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/cubit/invite_user_cubit.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/data/models/requests/delete_user_request.dart';
import 'package:mula_biz_mobile/features/main_page/more/invite_user/data/models/requests/send_invites_request.dart';
import 'package:mula_biz_mobile/gen/assets.gen.dart';
import 'package:mula_biz_mobile/gen/codegen_loader.g.dart';
import 'package:mula_biz_mobile/routes/app_routes.dart';

class InviteUserScreen extends StatefulWidget {
  const InviteUserScreen({super.key});

  @override
  State<InviteUserScreen> createState() => _InviteUserScreenState();
}

class _InviteUserScreenState extends State<InviteUserScreen> {
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController surNameController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<InviteUserCubit>().getListInvitedUser();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InviteUserCubit, InviteUserState>(
      listener: (context, state) {
        if (state.addUserStatus.isLoading) {
          LoadingWidgetController.showLoadingDialog(context);
        } else {
          LoadingWidgetController.hideLoadingDialog(context);
        }

        if (state.addUserStatus.success) {
          context.pop();
        } else if (state.addUserStatus.failed ||
            state.getListUserStatus.failed ||
            state.deleteUserStatus.failed) {
          AppToast.showToast(state.errorMsg);
        }
      },
      child: BaseScaffold(
        extendBodyBehindAppBar: true,
        appBar: BaseAppBar(
          title: LocaleKeys.inviteUser.tr(),
          actions: [
            GestureDetector(
              onTap: () {
                AppDialog.showCustomDialog(
                  context,
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          LocaleKeys.inviteUser.tr(),
                          style: AppTypo.heading6,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppTextField(
                          title: LocaleKeys.auth_email.tr(),
                          hintText: LocaleKeys.enterEmail.tr(),
                          controller: emailTextController,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return Email.getError(EmailValidationError.empty)
                                  .tr();
                            } else if (Email.emailRegExp
                                .hasMatch(value ?? "")) {
                              return null;
                            } else {
                              return Email.getError(
                                      EmailValidationError.invalid)
                                  .tr();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppTextField(
                          title: LocaleKeys.name.tr(),
                          hintText: LocaleKeys.enterName.tr(),
                          controller: nameTextController,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return LocaleKeys.validators_field_empty.tr();
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        AppTextField(
                          title: LocaleKeys.surname.tr(),
                          hintText: LocaleKeys.enterSurname.tr(),
                          controller: surNameController,
                          validator: (value) {
                            if (value?.isEmpty ?? false) {
                              return LocaleKeys.validators_field_empty.tr();
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        AppAppButton(
                          title: LocaleKeys.invite.tr(),
                          width: 124,
                          height: 48,
                          onPressed: () async {
                            if (formKey.currentState?.validate() ?? false) {
                              await context.pushNamed(
                                Routes.inputPinWidget,
                                extra: {
                                  "onChanged": (String val) async {
                                    if (val.length == 6) {
                                      context.read<InviteUserCubit>().addUser(
                                            request: SendInvitesRequest(
                                              emails: [
                                                emailTextController.text
                                              ],
                                              userName: nameTextController.text,
                                              userSurName:
                                                  surNameController.text,
                                              pin: await encryptPIN(val),
                                            ),
                                            isResend: false,
                                          );
                                    }
                                  }
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Assets.svg.addUser.svg(),
            )
          ],
        ),
        body: BlocBuilder<InviteUserCubit, InviteUserState>(
            builder: (context, state) {
          if (state.getListUserStatus.success) {
            if (state.listUsers.isNotEmpty) {
              return ListView.builder(
                itemCount: state.listUsers.length,
                padding: EdgeInsets.zero,
                itemBuilder: (_, index) => Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.colorD2DAE2),
                    ),
                  ),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.grey,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            40,
                          ),
                        ),
                      ),
                      child: Assets.svg.person
                          .svg(width: 24, height: 24, fit: BoxFit.none),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.listUsers[index].attributes?.fullName ?? '',
                          style: AppTypo.bodySmall,
                        ),
                        Text(
                          state.listUsers[index].attributes?.email ?? '',
                          style: AppTypo.bodyTiny,
                        ),
                      ],
                    ),
                    trailing: GestureDetector(
                      onTap: () {
                        AppDialog.showAlertDialog(
                          context,
                          title: LocaleKeys.deleteUser.tr(),
                          desc: LocaleKeys.doYouConfirmDeleteThisUser.tr(),
                          buttonTitle: LocaleKeys.deleteUser.tr(),
                          onPressed: () async {
                            context.pop();
                            await context.pushNamed(
                              Routes.inputPinWidget,
                              extra: {
                                "onChanged": (String val) async {
                                  if (val.length == 6) {
                                    context
                                        .read<InviteUserCubit>()
                                        .deleteInvitedUser(
                                          request: DeleteUserRequest(
                                              pin: await encryptPIN(val),
                                              userID:
                                                  state.listUsers[index].id),
                                        );
                                  }
                                }
                              },
                            );
                          },
                        );
                      },
                      child: Assets.svg.bin
                          .svg(width: 20, height: 20, fit: BoxFit.none),
                    ),
                  ),
                ),
              );
            } else {
              return NotFoundWidget(
                desc: LocaleKeys.addByClickingTheIconInTheRightCorner.tr(),
                title: LocaleKeys.noUserFound.tr(),
              );
            }
          } else if (state.getListUserStatus.failed) {
            return const MulaErrorWidget(
              title: 'Error',
              desc: "Desc",
            );
          }
          return const SizedBox();
        }),
      ),
    );
  }
}

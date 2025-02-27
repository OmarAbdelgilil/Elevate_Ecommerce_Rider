import 'package:elevate_ecommerce_driver/core/di/di.dart';
import 'package:elevate_ecommerce_driver/core/providers/user_provider.dart';
import 'package:elevate_ecommerce_driver/core/routes/app_routes.dart';
import 'package:elevate_ecommerce_driver/features/auth/logout/presentation/logout_view.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/viewmodel/edit_profile_cubit.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/widgets/profile_header.dart';
import 'package:elevate_ecommerce_driver/features/auth/profile/presentation/widgets/profile_menu_item.dart';
import 'package:elevate_ecommerce_driver/features/login/domain/models/user.dart';
import 'package:elevate_ecommerce_driver/utils/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return ChangeNotifierProvider.value(
      value: userProvider,
      child: BlocProvider(
        create: (context) => getIt<EditProfileCubit>(),
        child: const ProfileScreenContent(),
      ),
    );
  }
}

class ProfileScreenContent extends StatelessWidget {
  const ProfileScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, _) {
        final User? user = userProvider.user;

        if (user == null) {
          return const Center(child: Text(StringsManager.noUserDataAvailable));
        }

        return Scaffold(
          appBar: AppBar(
            leading: const BackButton(),
            title: const Text(StringsManager.profile),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.notifications_outlined),
                    Transform.translate(
                      offset: Offset(-8.w, -8.h),
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.error,
                          shape: BoxShape.circle,
                        ),
                        constraints: BoxConstraints(
                          minWidth: 16.w,
                          minHeight: 16.h,
                        ),
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10.sp,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    ProfileHeader(
                      name: '${user.firstName} ${user.lastName}',
                      email: user.email ?? '',
                      phone: user.phone ?? '',
                    ),
                    SizedBox(height: 20.h),
                    ProfileMenuItem(
                      title: StringsManager.vehicleinfo,
                      subtitle: '${user.vehicleType}\n${user.vehicleNumber}',
                      onTap: () {
                        Navigator.of(context).pushNamed(AppRoutes.editVihcle);
                      },
                    ),
                    Divider(height: 1.h),
                    ProfileMenuItem(
                      title: StringsManager.language,
                      subtitle: StringsManager.english,
                      textColor: Theme.of(context).colorScheme.primary,
                      onTap: () {},
                    ),
                    Divider(height: 1.h),
                    LogoutWidget(),

                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.r),
                child: Text(
                  'v 6.3.0 - (446)',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

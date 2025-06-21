import 'package:wishden/navigation/route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wishden/ui/change_password_screen/change_password_view.dart';
import 'package:wishden/ui/check_email_screen/check_email_view.dart';
import 'package:wishden/ui/create_password_screen/create_password_view.dart';
import 'package:wishden/ui/dashboard_screen/dashboard_view.dart';
import 'package:wishden/ui/delete_1_screen/delete_1_view.dart';
import 'package:wishden/ui/delete_2_screen/delete_2_view.dart';
import 'package:wishden/ui/edit_profile_screen/edit_profile_view.dart';
import 'package:wishden/ui/event_detail_screen/event_detail_view.dart';
import 'package:wishden/ui/event_screen/event_view.dart';
import 'package:wishden/ui/feedback_screen/feedback_view.dart';
import 'package:wishden/ui/forgot_pwrd_screen/forgot_pwrd_view.dart';
import 'package:wishden/ui/home_detailed_screen/home_detailed_view.dart';
import 'package:wishden/ui/home_screen/home_view.dart';
import 'package:wishden/ui/login_screen/login_view.dart';
import 'package:wishden/ui/menu_screen/menu_view.dart';
import 'package:wishden/ui/message_chat_screen/message_chat_view.dart';
import 'package:wishden/ui/message_screen/message_view.dart';
import 'package:wishden/ui/otp_phone_token_screen/otp_phone_token_view.dart';
import 'package:wishden/ui/otp_token_screen/otp_token_view.dart';
import 'package:wishden/ui/permission_screen/permission_view.dart';
import 'package:wishden/ui/registration_screen/registration_view.dart';
import 'package:wishden/ui/reservation_detail_screen/reservation_detailed_view.dart';
import 'package:wishden/ui/reservation_history_screen/reservation_history_view.dart';
import 'package:wishden/ui/reservation_screen/reservation_view.dart';
import 'package:wishden/ui/reserve_room_screen/reservation_room_view.dart';
import 'package:wishden/ui/review_screen/review_view.dart';
import 'package:wishden/ui/setting_screen/setting_view.dart';
import 'package:wishden/ui/splash_screen/splash_view.dart';
import 'package:wishden/ui/welcome_screen/welcome_view.dart';

GoRouter router() {
  return GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: AppRoutes.splashScreenView,
        path: AppRoutes.splashScreenView,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashScreenView(),
      ),
      GoRoute(
        name: AppRoutes.welcomeView,
        path: AppRoutes.welcomeView,
        builder: (BuildContext context, GoRouterState state) =>
            const WelcomeView(),
      ),
      GoRoute(
        name: AppRoutes.loginView,
        path: AppRoutes.loginView,
        builder: (BuildContext context, GoRouterState state) =>
            const LoginView(),
      ),
      GoRoute(
        name: AppRoutes.checkEmailView,
        path: AppRoutes.checkEmailView,
        builder: (BuildContext context, GoRouterState state) =>
            const CheckEmailView(),
      ),
      GoRoute(
        name: AppRoutes.forgotPwrdView,
        path: AppRoutes.forgotPwrdView,
        builder: (BuildContext context, GoRouterState state) =>
            const ForgotPasswordView(),
      ),
      GoRoute(
        name: AppRoutes.permissionView,
        path: AppRoutes.permissionView,
        builder: (BuildContext context, GoRouterState state) =>
            const PermissionView(),
      ),
      GoRoute(
        name: AppRoutes.otpTokenView,
        path: AppRoutes.otpTokenView,
        builder: (BuildContext context, GoRouterState state) => OTPTokenView(
          email: state.extra as String,
        ),
      ),
      GoRoute(
        name: AppRoutes.createPasswordView,
        path: AppRoutes.createPasswordView,
        builder: (BuildContext context, GoRouterState state) =>
            CreatePasswordView(otp: state.extra as String),
      ),
      GoRoute(
        name: AppRoutes.registerView,
        path: AppRoutes.registerView,
        builder: (BuildContext context, GoRouterState state) =>
            const RegisterView(),
      ),
      GoRoute(
        name: AppRoutes.dashboardView,
        path: AppRoutes.dashboardView,
        builder: (BuildContext context, GoRouterState state) =>
            const DashboardView(),
      ),
      GoRoute(
        name: AppRoutes.homeView,
        path: AppRoutes.homeView,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeView(),
      ),
      GoRoute(
          name: AppRoutes.menuView,
          path: AppRoutes.menuView,
          builder: (BuildContext context, GoRouterState state) {
            return MenuView(
              isKitchen: state.extra as bool,
            );
          }),
      GoRoute(
        name: AppRoutes.eventView,
        path: AppRoutes.eventView,
        builder: (BuildContext context, GoRouterState state) =>
            const EventView(),
      ),
      GoRoute(
        name: AppRoutes.messageView,
        path: AppRoutes.messageView,
        builder: (BuildContext context, GoRouterState state) =>
            const MessageView(),
      ),
      GoRoute(
        name: AppRoutes.settingView,
        path: AppRoutes.settingView,
        builder: (BuildContext context, GoRouterState state) =>
            const SettingView(),
      ),
      GoRoute(
        name: AppRoutes.changePasswordView,
        path: AppRoutes.changePasswordView,
        builder: (BuildContext context, GoRouterState state) =>
            const ChangepasswordScreenView(),
      ),
      GoRoute(
        name: AppRoutes.delete1View,
        path: AppRoutes.delete1View,
        builder: (BuildContext context, GoRouterState state) =>
            const Delete1ScreenView(),
      ),
      GoRoute(
        name: AppRoutes.delete2View,
        path: AppRoutes.delete2View,
        builder: (BuildContext context, GoRouterState state) =>
            const Delete2ScreenView(),
      ),
      GoRoute(
        name: AppRoutes.editProfileView,
        path: AppRoutes.editProfileView,
        builder: (BuildContext context, GoRouterState state) =>
            const EditProfileScreenView(),
      ),
      GoRoute(
        name: AppRoutes.eventDetailScreenView,
        path: AppRoutes.eventDetailScreenView,
        builder: (BuildContext context, GoRouterState state) =>
            const EventDetailScreenView(),
      ),
      GoRoute(
        name: AppRoutes.feedBackScreenView,
        path: AppRoutes.feedBackScreenView,
        builder: (BuildContext context, GoRouterState state) =>
            const FeedBackScreenView(),
      ),
      GoRoute(
        name: AppRoutes.homeDetailedView,
        path: AppRoutes.homeDetailedView,
        builder: (BuildContext context, GoRouterState state) =>
            const HomeDetailedView(),
      ),
      GoRoute(
        name: AppRoutes.messageChatScreenView,
        path: AppRoutes.messageChatScreenView,
        builder: (BuildContext context, GoRouterState state) =>
            const MessageChatScreenView(),
      ),
      GoRoute(
        name: AppRoutes.otpPhoneTokenView,
        path: AppRoutes.otpPhoneTokenView,
        builder: (BuildContext context, GoRouterState state) =>
            OTPPhoneTokenView(
          email: state.extra as String,
        ),
      ),
      GoRoute(
        name: AppRoutes.reservationDetailedView,
        path: AppRoutes.reservationDetailedView,
        builder: (BuildContext context, GoRouterState state) =>
            const ReservationDetailedView(),
      ),
      GoRoute(
        name: AppRoutes.reservationHistoryView,
        path: AppRoutes.reservationHistoryView,
        builder: (BuildContext context, GoRouterState state) =>
            const ReservationHistoryView(),
      ),
      GoRoute(
        name: AppRoutes.reservationView,
        path: AppRoutes.reservationView,
        builder: (BuildContext context, GoRouterState state) =>
            const ReservationView(),
      ),
      GoRoute(
        name: AppRoutes.reservationRoomView,
        path: AppRoutes.reservationRoomView,
        builder: (BuildContext context, GoRouterState state) =>
            const ReservationRoomView(),
      ),
      GoRoute(
        name: AppRoutes.reviewScreenView,
        path: AppRoutes.reviewScreenView,
        builder: (BuildContext context, GoRouterState state) =>
            const ReviewScreenView(),
      ),
    ],
  );
}

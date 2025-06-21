class Endpoints {
  static const String baseURI =
      "https://Wishden-e33d9b6da1f0.herokuapp.com/api/v1/";

  static const String verifySocialTokenURI =
      "authorization/social/convert-token/";

  static const String registerURI = "authorization/register/";
  static const String verifyEmailURI = "authorization/email/verify/";
  static const String verifyPhoneURI = "authorization/phone/verify/";
  static const String listingsURI = "listing/all-listings/";
  static const String userListingsURI = "listing/user-listings/";
  static const String createListingsURI = "listing/listings/";

  static const String bookmarkContainerURI = "bookmark/bookmark-container/";
  static const String userBookmarksURI = "bookmark/user-bookmark-containers/";
  static const String bookmarkContainerAddURI =
      "bookmark/bookmark-container/add/";

  static const String messagesURI = "chat/chat/all_message/";

  static const String loginURI = "authorization/login/";
  static const String deleteURI = "authorization/delete_user/";
  static const String userURI = "authorization/user_profile/";
  static const String forgotPasswordURI = "authorization/password_reset/";
  static const String verifyOTPURI =
      "authorization/password_reset/validate_token/";
  static const String resetPasswordURI =
      "authorization/password_reset/confirm/";
}

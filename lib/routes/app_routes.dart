import 'package:flutter/material.dart';
import 'package:kiamis_app/presentation/splash_screen/splash_screen.dart';
import 'package:kiamis_app/presentation/login_screen/login_screen.dart';
import 'package:kiamis_app/presentation/forgot_password_screen/forgot_password_screen.dart';
import 'package:kiamis_app/presentation/new_password_screen/new_password_screen.dart';
import 'package:kiamis_app/presentation/otp_one_screen/otp_one_screen.dart';
import 'package:kiamis_app/presentation/recover_account_screen/recover_account_screen.dart';
import 'package:kiamis_app/presentation/home_screen/home_screen.dart';
import 'package:kiamis_app/presentation/settings_screen/settings_screen.dart';
import 'package:kiamis_app/presentation/search_farmer_found_screen/search_farmer_found_screen.dart';
import 'package:kiamis_app/presentation/farmer_registration_screen/farmer_registration_screen.dart';
import 'package:kiamis_app/presentation/draft_entries_screen/draft_entries_screen.dart';
import 'package:kiamis_app/presentation/search_farmer_not_found_screen/search_farmer_not_found_screen.dart';
import 'package:kiamis_app/presentation/otp_screen/otp_screen.dart';
import 'package:kiamis_app/presentation/farmers_identification_screen/farmers_identification_screen.dart';
import 'package:kiamis_app/presentation/farmers_identification_one_screen/farmers_identification_one_screen.dart';
import 'package:kiamis_app/presentation/farmers_identification_two_screen/farmers_identification_two_screen.dart';
import 'package:kiamis_app/presentation/farmers_identification_three_screen/farmers_identification_three_screen.dart';
import 'package:kiamis_app/presentation/farmers_identification_four_screen/farmers_identification_four_screen.dart';
import 'package:kiamis_app/presentation/search_farmer_screen/search_farmer_screen.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_screen/primary_farm_holding_screen.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_one_screen/primary_farm_holding_one_screen.dart';
import 'package:kiamis_app/presentation/primary_farm_holding_two_screen/primary_farm_holding_two_screen.dart';
import 'package:kiamis_app/presentation/map_screen/map_screen.dart';
import 'package:kiamis_app/presentation/crop_agriculture_screen/crop_agriculture_screen.dart';
import 'package:kiamis_app/presentation/add_crop_one_screen/add_crop_one_screen.dart';
import 'package:kiamis_app/presentation/add_crop_two_screen/add_crop_two_screen.dart';
import 'package:kiamis_app/presentation/livestock_one_tab_container_screen/livestock_one_tab_container_screen.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_one_screen/add_reared_livestock_one_screen.dart';
import 'package:kiamis_app/presentation/add_reared_livestock_two_screen/add_reared_livestock_two_screen.dart';
import 'package:kiamis_app/presentation/add_liverstockinput_screen/add_liverstockinput_screen.dart';
import 'package:kiamis_app/presentation/add_farm_holding_screen/add_farm_holding_screen.dart';
import 'package:kiamis_app/presentation/add_farm_holding_one_screen/add_farm_holding_one_screen.dart';
import 'package:kiamis_app/presentation/add_farm_holding_two_screen/add_farm_holding_two_screen.dart';
import 'package:kiamis_app/presentation/aquaculture_screen/aquaculture_screen.dart';
import 'package:kiamis_app/presentation/add_aquaculture_one_screen/add_aquaculture_one_screen.dart';
import 'package:kiamis_app/presentation/add_aquaculture_two_screen/add_aquaculture_two_screen.dart';
import 'package:kiamis_app/presentation/farmtechandassets_screen/farmtechandassets_screen.dart';
import 'package:kiamis_app/presentation/add_farmtechandassets_one_screen/add_farmtechandassets_one_screen.dart';
import 'package:kiamis_app/presentation/landandwatermgmt_screen/landandwatermgmt_screen.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_one_screen/add_landandwatermgmt_one_screen.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_two_screen/add_landandwatermgmt_two_screen.dart';
import 'package:kiamis_app/presentation/add_landandwatermgmt_six_screen/add_landandwatermgmt_six_screen.dart';
import 'package:kiamis_app/presentation/financialandservices_screen/financialandservices_screen.dart';
import 'package:kiamis_app/presentation/add_financialandservices_one_screen/add_financialandservices_one_screen.dart';
import 'package:kiamis_app/presentation/add_financialandservices_two_screen/add_financialandservices_two_screen.dart';
import 'package:kiamis_app/presentation/add_financialandservices_four_screen/add_financialandservices_four_screen.dart';
import 'package:kiamis_app/presentation/add_financialandservices_five_screen/add_financialandservices_five_screen.dart';
import 'package:kiamis_app/presentation/product_page_screen/product_page_screen.dart';
import 'package:kiamis_app/presentation/register_screen/register_screen.dart';
import 'package:kiamis_app/presentation/splash1_screen/splash1_screen.dart';
import 'package:kiamis_app/presentation/login_one_screen/login_one_screen.dart';
import 'package:kiamis_app/presentation/main_landing_screen/main_landing_screen.dart';
import 'package:kiamis_app/presentation/cart_screen/cart_screen.dart';
import 'package:kiamis_app/presentation/profile_profile_info_tab_container_screen/profile_profile_info_tab_container_screen.dart';
import 'package:kiamis_app/presentation/product_search_screen/product_search_screen.dart';
import 'package:kiamis_app/presentation/product_discover_screen/product_discover_screen.dart';
import 'package:kiamis_app/presentation/farmer_registration_one_screen/farmer_registration_one_screen.dart';
import 'package:kiamis_app/presentation/enable_linked_accounts_screen/enable_linked_accounts_screen.dart';
import 'package:kiamis_app/presentation/login1_screen/login1_screen.dart';
import 'package:kiamis_app/presentation/history_screen/history_screen.dart';
import 'package:kiamis_app/presentation/transfer_request_screen/transfer_request_screen.dart';
import 'package:kiamis_app/presentation/confirmation_screen/confirmation_screen.dart';
import 'package:kiamis_app/presentation/transfer_amount_screen/transfer_amount_screen.dart';
import 'package:kiamis_app/presentation/settings_one_screen/settings_one_screen.dart';
import 'package:kiamis_app/presentation/accounts_screen/accounts_screen.dart';
import 'package:kiamis_app/presentation/expense_tracking_tab_container_screen/expense_tracking_tab_container_screen.dart';
import 'package:kiamis_app/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String forgotPasswordScreen = '/forgot_password_screen';

  static const String newPasswordScreen = '/new_password_screen';

  static const String otpOneScreen = '/otp_one_screen';

  static const String recoverAccountScreen = '/recover_account_screen';

  static const String homeScreen = '/home_screen';

  static const String settingsScreen = '/settings_screen';

  static const String searchFarmerFoundScreen = '/search_farmer_found_screen';

  static const String farmerRegistrationScreen = '/farmer_registration_screen';

  static const String draftEntriesScreen = '/draft_entries_screen';

  static const String searchFarmerNotFoundScreen =
      '/search_farmer_not_found_screen';

  static const String otpScreen = '/otp_screen';

  static const String farmersIdentificationScreen =
      '/farmers_identification_screen';

  static const String farmersIdentificationOneScreen =
      '/farmers_identification_one_screen';

  static const String farmersIdentificationTwoScreen =
      '/farmers_identification_two_screen';

  static const String farmersIdentificationThreeScreen =
      '/farmers_identification_three_screen';

  static const String farmersIdentificationFourScreen =
      '/farmers_identification_four_screen';

  static const String searchFarmerScreen = '/search_farmer_screen';

  static const String primaryFarmHoldingScreen = '/primary_farm_holding_screen';

  static const String primaryFarmHoldingOneScreen =
      '/primary_farm_holding_one_screen';

  static const String primaryFarmHoldingTwoScreen =
      '/primary_farm_holding_two_screen';

  static const String mapScreen = '/map_screen';

  static const String cropAgricultureScreen = '/crop_agriculture_screen';

  static const String addCropOneScreen = '/add_crop_one_screen';

  static const String addCropTwoScreen = '/add_crop_two_screen';

  static const String livestockOnePage = '/livestock_one_page';

  static const String livestockOneTabContainerScreen =
      '/livestock_one_tab_container_screen';

  static const String livestockTwoPage = '/livestock_two_page';

  static const String addRearedLivestockOneScreen =
      '/add_reared_livestock_one_screen';

  static const String addRearedLivestockTwoScreen =
      '/add_reared_livestock_two_screen';

  static const String addLiverstockinputScreen = '/add_liverstockinput_screen';

  static const String addFarmHoldingScreen = '/add_farm_holding_screen';

  static const String addFarmHoldingOneScreen = '/add_farm_holding_one_screen';

  static const String addFarmHoldingTwoScreen = '/add_farm_holding_two_screen';

  static const String aquacultureScreen = '/aquaculture_screen';

  static const String addAquacultureOneScreen = '/add_aquaculture_one_screen';

  static const String addAquacultureTwoScreen = '/add_aquaculture_two_screen';

  static const String farmtechandassetsScreen = '/farmtechandassets_screen';

  static const String addFarmtechandassetsOneScreen =
      '/add_farmtechandassets_one_screen';

  static const String landandwatermgmtScreen = '/landandwatermgmt_screen';

  static const String addLandandwatermgmtOneScreen =
      '/add_landandwatermgmt_one_screen';

  static const String addLandandwatermgmtTwoScreen =
      '/add_landandwatermgmt_two_screen';

  static const String addLandandwatermgmtSixScreen =
      '/add_landandwatermgmt_six_screen';

  static const String financialandservicesScreen =
      '/financialandservices_screen';

  static const String addFinancialandservicesOneScreen =
      '/add_financialandservices_one_screen';

  static const String addFinancialandservicesTwoScreen =
      '/add_financialandservices_two_screen';

  static const String addFinancialandservicesFourScreen =
      '/add_financialandservices_four_screen';

  static const String addFinancialandservicesFiveScreen =
      '/add_financialandservices_five_screen';

  static const String productPageScreen = '/product_page_screen';

  static const String registerScreen = '/register_screen';

  static const String splash1Screen = '/splash1_screen';

  static const String loginOneScreen = '/login_one_screen';

  static const String mainLandingScreen = '/main_landing_screen';

  static const String cartScreen = '/cart_screen';

  static const String profileProfileInfoPage = '/profile_profile_info_page';

  static const String profileProfileInfoTabContainerScreen =
      '/profile_profile_info_tab_container_screen';

  static const String profileMyOrdersPage = '/profile_my_orders_page';

  static const String profileSecurityPage = '/profile_security_page';

  static const String profileAddressDetailsPage =
      '/profile_address_details_page';

  static const String productSearchScreen = '/product_search_screen';

  static const String productDiscoverScreen = '/product_discover_screen';

  static const String farmerRegistrationOneScreen =
      '/farmer_registration_one_screen';

  static const String enableLinkedAccountsScreen =
      '/enable_linked_accounts_screen';

  static const String login1Screen = '/login1_screen';

  static const String historyScreen = '/history_screen';

  static const String transferRequestScreen = '/transfer_request_screen';

  static const String confirmationScreen = '/confirmation_screen';

  static const String transferAmountScreen = '/transfer_amount_screen';

  static const String settingsOneScreen = '/settings_one_screen';

  static const String accountsScreen = '/accounts_screen';

  static const String expenseTrackingPage = '/expense_tracking_page';

  static const String expenseTrackingTabContainerScreen =
      '/expense_tracking_tab_container_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        loginScreen: LoginScreen.builder,
        forgotPasswordScreen: ForgotPasswordScreen.builder,
        newPasswordScreen: NewPasswordScreen.builder,
        otpOneScreen: OtpOneScreen.builder,
        recoverAccountScreen: RecoverAccountScreen.builder,
        homeScreen: HomeScreen.builder,
        settingsScreen: SettingsScreen.builder,
        searchFarmerFoundScreen: SearchFarmerFoundScreen.builder,
        farmerRegistrationScreen: FarmerRegistrationScreen.builder,
        draftEntriesScreen: DraftEntriesScreen.builder,
        searchFarmerNotFoundScreen: SearchFarmerNotFoundScreen.builder,
        otpScreen: OtpScreen.builder,
        farmersIdentificationScreen: FarmersIdentificationScreen.builder,
        farmersIdentificationOneScreen: FarmersIdentificationOneScreen.builder,
        farmersIdentificationTwoScreen: FarmersIdentificationTwoScreen.builder,
        farmersIdentificationThreeScreen:
            FarmersIdentificationThreeScreen.builder,
        farmersIdentificationFourScreen:
            FarmersIdentificationFourScreen.builder,
        searchFarmerScreen: SearchFarmerScreen.builder,
        primaryFarmHoldingScreen: PrimaryFarmHoldingScreen.builder,
        primaryFarmHoldingOneScreen: PrimaryFarmHoldingOneScreen.builder,
        primaryFarmHoldingTwoScreen: PrimaryFarmHoldingTwoScreen.builder,
        mapScreen: MapScreen.builder,
        cropAgricultureScreen: CropAgricultureScreen.builder,
        addCropOneScreen: AddCropOneScreen.builder,
        addCropTwoScreen: AddCropTwoScreen.builder,
        livestockOneTabContainerScreen: LivestockOneTabContainerScreen.builder,
        addRearedLivestockOneScreen: AddRearedLivestockOneScreen.builder,
        addRearedLivestockTwoScreen: AddRearedLivestockTwoScreen.builder,
        addLiverstockinputScreen: AddLiverstockinputScreen.builder,
        addFarmHoldingScreen: AddFarmHoldingScreen.builder,
        addFarmHoldingOneScreen: AddFarmHoldingOneScreen.builder,
        addFarmHoldingTwoScreen: AddFarmHoldingTwoScreen.builder,
        aquacultureScreen: AquacultureScreen.builder,
        addAquacultureOneScreen: AddAquacultureOneScreen.builder,
        addAquacultureTwoScreen: AddAquacultureTwoScreen.builder,
        farmtechandassetsScreen: FarmtechandassetsScreen.builder,
        addFarmtechandassetsOneScreen: AddFarmtechandassetsOneScreen.builder,
        landandwatermgmtScreen: LandandwatermgmtScreen.builder,
        addLandandwatermgmtOneScreen: AddLandandwatermgmtOneScreen.builder,
        addLandandwatermgmtTwoScreen: AddLandandwatermgmtTwoScreen.builder,
        addLandandwatermgmtSixScreen: AddLandandwatermgmtSixScreen.builder,
        financialandservicesScreen: FinancialandservicesScreen.builder,
        addFinancialandservicesOneScreen:
            AddFinancialandservicesOneScreen.builder,
        addFinancialandservicesTwoScreen:
            AddFinancialandservicesTwoScreen.builder,
        addFinancialandservicesFourScreen:
            AddFinancialandservicesFourScreen.builder,
        addFinancialandservicesFiveScreen:
            AddFinancialandservicesFiveScreen.builder,
        productPageScreen: ProductPageScreen.builder,
        registerScreen: RegisterScreen.builder,
        splash1Screen: Splash1Screen.builder,
        loginOneScreen: LoginOneScreen.builder,
        mainLandingScreen: MainLandingScreen.builder,
        cartScreen: CartScreen.builder,
        profileProfileInfoTabContainerScreen:
            ProfileProfileInfoTabContainerScreen.builder,
        productSearchScreen: ProductSearchScreen.builder,
        productDiscoverScreen: ProductDiscoverScreen.builder,
        farmerRegistrationOneScreen: FarmerRegistrationOneScreen.builder,
        enableLinkedAccountsScreen: EnableLinkedAccountsScreen.builder,
        login1Screen: Login1Screen.builder,
        historyScreen: HistoryScreen.builder,
        transferRequestScreen: TransferRequestScreen.builder,
        confirmationScreen: ConfirmationScreen.builder,
        transferAmountScreen: TransferAmountScreen.builder,
        settingsOneScreen: SettingsOneScreen.builder,
        accountsScreen: AccountsScreen.builder,
        expenseTrackingTabContainerScreen:
            ExpenseTrackingTabContainerScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}

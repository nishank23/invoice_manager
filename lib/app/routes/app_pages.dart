import 'package:get/get.dart';

import '../modules/AddNewClient/bindings/add_new_client_binding.dart';
import '../modules/AddNewClient/clt_addressInfo/bindings/clt_address_info_binding.dart';
import '../modules/AddNewClient/clt_addressInfo/views/clt_address_info_view.dart';
import '../modules/AddNewClient/clt_businessInfo/bindings/clt_business_info_binding.dart';
import '../modules/AddNewClient/clt_businessInfo/views/clt_business_info_view.dart';
import '../modules/AddNewClient/views/add_new_client_view.dart';
import '../modules/AddressInfo/bindings/address_info_binding.dart';
import '../modules/Backup/bindings/backup_binding.dart';
import '../modules/Backup/bindings/backup_binding.dart';
import '../modules/Backup/views/backup_view.dart';
import '../modules/BackupRestore/bindings/backup_restore_binding.dart';
import '../modules/BackupRestore/views/backup_restore_view.dart';
import '../modules/BankInfo/bindings/bank_info_binding.dart';
import '../modules/BankInfo/views/bank_info_view.dart';
import '../modules/BusinessInfo/bindings/business_info_binding.dart';
import '../modules/BusinessInfo/views/business_info_view.dart';
import '../modules/Clients/bindings/clients_binding.dart';
import '../modules/Clients/views/clients_view.dart';
import '../modules/ConfirmationMail/bindings/confirmation_mail_binding.dart';
import '../modules/ConfirmationMail/views/confirmation_mail_view.dart';
import '../modules/ConfirmationRegister/bindings/confirmation_register_binding.dart';
import '../modules/ConfirmationRegister/views/confirmation_register_view.dart';
import '../modules/CreateEstimated/bindings/create_estimated_binding.dart';
import '../modules/CreateEstimated/est_add_client/bindings/est_add_client_binding.dart';
import '../modules/CreateEstimated/est_add_client/views/est_add_client_view.dart';
import '../modules/CreateEstimated/est_add_items/bindings/est_add_items_binding.dart';
import '../modules/CreateEstimated/est_add_items/views/est_add_items_view.dart';
import '../modules/CreateEstimated/est_add_sign/bindings/est_add_sign_binding.dart';
import '../modules/CreateEstimated/est_add_sign/views/est_add_sign_view.dart';
import '../modules/CreateEstimated/views/create_estimated_view.dart';
import '../modules/CreateInvoice/bindings/create_invoice_binding.dart';
import '../modules/CreateInvoice/views/create_invoice_view.dart';
import '../modules/CreateProducts/bindings/create_products_binding.dart';
import '../modules/CreateProducts/views/create_products_view.dart';
import '../modules/EditAddress/bindings/edit_address_binding.dart';
import '../modules/EditAddress/views/edit_address_view.dart';
import '../modules/EstimatePreview/bindings/estimate_preview_binding.dart';
import '../modules/EstimatePreview/views/estimate_preview_view.dart';
import '../modules/Estimated/bindings/estimated_binding.dart';
import '../modules/Estimated/views/estimated_view.dart';
import '../modules/ForgotPassword/bindings/forgot_password_binding.dart';
import '../modules/ForgotPassword/views/forgot_password_view.dart';
import '../modules/Home/home_binding.dart';
import '../modules/Home/home_view.dart';
import '../modules/InvoiceAddClient/bindings/invoice_add_client_binding.dart';
import '../modules/InvoiceAddClient/views/invoice_add_client_view.dart';
import '../modules/InvoiceAddItems/bindings/invoice_add_items_binding.dart';
import '../modules/InvoiceAddItems/views/invoice_add_items_view.dart';
import '../modules/InvoiceAddSign/bindings/invoice_add_sign_binding.dart';
import '../modules/InvoiceAddSign/views/invoice_add_sign_view.dart';
import '../modules/InvoiceAddress/bindings/invoice_address_binding.dart';
import '../modules/InvoicePdf/bindings/invoice_pdf_binding.dart';
import '../modules/InvoicePdf/views/invoice_pdf_view.dart';
import '../modules/Invoices/bindings/invoices_binding.dart';
import '../modules/Invoices/views/invoices_view.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/MyProducts/bindings/my_products_binding.dart';
import '../modules/MyProducts/views/my_products_view.dart';
import '../modules/ResetPassword/bindings/reset_password_binding.dart';
import '../modules/Restore/bindings/restore_binding.dart';
import '../modules/Restore/bindings/restore_binding.dart';
import '../modules/Restore/views/restore_view.dart';
import '../modules/SignUp/bindings/sign_up_binding.dart';
import '../modules/SignUp/views/sign_up_view.dart';
import '../modules/Splash/bindings/splash_binding.dart';
import '../modules/Splash/views/splash_view.dart';
import '../modules/Tabs/ProfileAddress/bindings/profile_address_binding.dart';
import '../modules/Tabs/ProfileAddress/views/profile_address_view.dart';
import '../modules/Tabs/bindings/tabs_binding.dart';
import '../modules/Tabs/views/tabs_view.dart';
import '../modules/bottomsheet/bindings/bottomsheet_binding.dart';
import '../modules/bottomsheet/views/bottomsheet_view.dart';

/*
*/
/*
*/
/*
*/

/*
*/
import '../modules/InvoiceAddress/views/invoice_address_view.dart'; /*
import '../modules/InvoicePreview/views/invoice_preview_view.dart';*/
/*
*/

import '../modules/AddressInfo/views/address_info_view.dart'; /*
import '../modules/Backup/views/backup_view.dart';*/
/*
*/
import '../modules/ResetPassword/views/reset_password_view.dart'; /*
import '../modules/Restore/views/restore_view.dart';*/

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRMATION_MAIL,
      page: () => const ConfirmationMailView(),
      binding: ConfirmationMailBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_INFO,
      page: () => AddressInfoView(isAdded: false.obs),
      binding: AddressInfoBinding(),
    ),
    GetPage(
      name: _Paths.BANK_INFO,
      page: () =>  BankInfoView(),
      binding: BankInfoBinding(),
    ),
    GetPage(
      name: _Paths.BUSINESS_INFO,
      page: () => BusinessInfoView(false),
      binding: BusinessInfoBinding(),
    ),
    GetPage(
      name: _Paths.TABS,
      page: () => const TabsView(),
      binding: TabsBinding(),
      children: [
        GetPage(
          name: _Paths.PROFILE_ADDRESS,
          page: () => const ProfileAddressView(false),
          binding: ProfileAddressBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMSHEET,
      page: () => const BottomsheetView(),
      binding: BottomsheetBinding(),
    ),
    GetPage(
      name: _Paths.CLIENTS,
      page: () => const ClientsView(),
      binding: ClientsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_NEW_CLIENT,
      page: () => const AddNewClientView(),
      binding: AddNewClientBinding(),
      children: [
        GetPage(
          name: _Paths.CLT_BUSINESS_INFO,
          page: () => CltBusinessInfoView(),
          binding: CltBusinessInfoBinding(),
        ),
        GetPage(
          name: _Paths.CLT_ADDRESS_INFO,
          page: () => CltAddressInfoView(),
          binding: CltAddressInfoBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ESTIMATED,
      page: () => const EstimatedView(),
      binding: EstimatedBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_ESTIMATED,
      page: () => const CreateEstimatedView(),
      binding: CreateEstimatedBinding(),
      children: [
        GetPage(
          name: _Paths.EST_ADD_ITEMS,
          page: () => EstAddItemsView(),
          binding: EstAddItemsBinding(),
        ),
        GetPage(
          name: _Paths.EST_ADD_CLIENT,
          page: () => EstAddClientView(),
          binding: EstAddClientBinding(),
        ),
        GetPage(
          name: _Paths.EST_ADD_SIGN,
          page: () => const EstAddSignView(),
          binding: EstAddSignBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.MY_PRODUCTS,
      page: () => const MyProductsView(),
      binding: MyProductsBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PRODUCTS,
      page: () => CreateProductsView(),
      binding: CreateProductsBinding(),
    ),
    GetPage(
      name: _Paths.ESTIMATE_PREVIEW,
      page: () => const EstimatePreviewView(),
      binding: EstimatePreviewBinding(),
    ),
    GetPage(
        name: _Paths.CREATE_INVOICE,
        page: () => const CreateInvoiceView(),
        binding: CreateInvoiceBinding(),
        children: [
          GetPage(
            name: _Paths.INVOICE_ADD_CLIENT,
            page: () => InvoiceAddClientView(),
            binding: InvoiceAddClientBinding(),
          ),
          GetPage(
            name: _Paths.INVOICE_ADDRESS,
            page: () => const InvoiceAddressView(),
            binding: InvoiceAddressBinding(),
          ),
          GetPage(
            name: _Paths.INVOICE_ADD_ITEMS,
            page: () => const InvoiceAddItemsView(),
            binding: InvoiceAddItemsBinding(),
          ),
          GetPage(
            name: _Paths.INVOICE_ADD_SIGN,
            page: () => const InvoiceAddSignView(),
            binding: InvoiceAddSignBinding(),
          ),
        ]),
    GetPage(
      name: _Paths.INVOICES,
      page: () => const InvoicesView(),
      binding: InvoicesBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_ADDRESS,
      page: () =>   EditAddressView(),
      binding: EditAddressBinding(),
    ),
    /* GetPage(
      name: _Paths.INVOICE_PREVIEW,
      page: () => const InvoicePreviewView(),
      binding: InvoicePreviewBinding(),
    ),*/
    GetPage(
      name: _Paths.BACKUP_RESTORE,
      page: () => const BackupRestoreView(),
      binding: BackupRestoreBinding(),
    ),
    GetPage(
      name: _Paths.BACKUP,
      page: () => const BackupView(),
      binding: BackupBinding(),
    ),
    GetPage(
      name: _Paths.RESTORE,
      page: () => const RestoreView(),
      binding: RestoreBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRMATION_REGISTER,
      page: () =>  ConfirmationRegisterView(),
      binding: ConfirmationRegisterBinding(),
    ),
    GetPage(
      name: _Paths.INVOICE_PDF,
      page: () =>  InvoicePdfView(),
      binding: InvoicePdfBinding(),
    ),
  ];
}

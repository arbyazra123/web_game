import 'dart:io';

import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared.dart';

String translate(BuildContext context, String key) {
  return AppConfigProvider.of(context).lang[key];
}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

class Utils {
  static showLoadingDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ));
  }

  static String getLoginError(dynamic error) {
    print(error);
    String errorMessage;
    try {
      switch (error) {
        case "Warning: No match for E-Mail Address and\/or Password.":
          errorMessage = "Alamat Email atau Password tidak cocok";
          break;
        case "Warning: Your account has exceeded allowed number of login attempts. Please try again in 1 hour.":
          errorMessage =
              "Kamu telah melampaui batas percobaan login, coba lagi nanti.";
          break;
        case "ERROR_INVALID_EMAIL":
          errorMessage = "Email atau Password tidak cocok";
          break;
        case "ERROR_WRONG_PASSWORD":
          errorMessage = "Email atau Password tidak cocok";
          break;
        case "ERROR_USER_NOT_FOUND":
          errorMessage = "Pengguna dengan email ini tidak ada";
          break;
        case "ERROR_USER_DISABLED":
          errorMessage = "Pengguna dengan email ini dinonaktifkan";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          errorMessage = "Terlalu banyak permintaan, coba lagi nanti";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "Terjadi masalah yang tidak dikenali";
      }
    } catch (e) {
      errorMessage = "Terjadi masalah yang tidak dikenali";
    }
    return errorMessage;
  }

  static Future<void> launchWhatsApp({
    @required String phone,
    String text = "",
  }) async {
    String url() {
      if (Platform.isIOS) {
        return "whatsapp://wa.me/$phone/?text=$text";
      } else {
        return "whatsapp://send?phone=$phone&text=$text";
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'WhatsApp tidak ter-install';
    }
  }

  static String getStatusOrder(String value) {
    switch (value.toLowerCase()) {
      case "processing":
        return "Dalam Proses";
        break;
      case "refunded":
        return "Uang Kembali";
        break;
      case "complete":
        return "Selesai";
        break;
      case "shipped":
        return "Terkirim";
        break;
      case "pending":
        return "Pending";
        break;
      case "canceled":
        return "Dibatalkan";
        break;
      case "denied":
        return "Ditolak";
        break;
      case "expired":
        return "Kadaluwarsa";
        break;
      case "failed":
        return "Gagal";
        break;
      default:
        return "null";
        break;
    }
  }

  static Color getStatusColorOrder(String value) {
    switch (value.toLowerCase()) {
      case "processing":
        return Colors.green;
        break;
      case "refunded":
        return Colors.green;
        break;
      case "complete":
        return Colors.blue;
        break;
      case "shipped":
        return Colors.blue;
        break;
      case "pending":
        return Colors.orange[300];
        break;
      case "canceled":
        return Colors.red[600];
        break;
      case "denied":
        return Colors.red[600];
        break;
      case "expired":
        return Colors.red[600];
        break;
      case "failed":
        return Colors.red[600];
        break;
      default:
        return Colors.green;
        break;
    }
  }

  // static Future<bool> showLoginOrGuestDialog(BuildContext context) async {
  //   return await showDialog(
  //       barrierDismissible: true,
  //       context: context,
  //       child: SimpleDialog(
  //         contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //         children: [
  //           H2Atm(
  //             "Kamu belum login, login terlebih dahulu atau lanjutkan sebagai tamu (guest)",
  //             style: TextStyle(fontWeight: FontWeight.w600),
  //           ),
  //           SizedBox(
  //             height: 20,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             children: [
  //               DefaultButtonMol(
  //                 height: 40,
  //                 text: "Tamu",
  //                 color: AppColors.greyDark,
  //                 onClick: () => Navigator.pop(context, false),
  //               ),
  //               DefaultButtonMol(
  //                 height: 40,
  //                 text: "Login",
  //                 onClick: () => Navigator.pop(context, true),
  //               ),
  //             ],
  //           )
  //         ],
  //       ));
  // }

  // static Future<bool> showPopUpBackWebView(BuildContext context) async {
  //   return await showDialog(
  //       barrierDismissible: false,
  //       context: context,
  //       child: WillPopScope(
  //         onWillPop: () async {
  //           Navigator.pop(context);
  //           Navigator.pop(context);
  //           return false;
  //         },
  //         child: SimpleDialog(
  //           contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
  //           children: [
  //             H2Atm(
  //               "Apakah anda yakin untuk kembail?",
  //               style: TextStyle(fontWeight: FontWeight.w600),
  //             ),
  //             SizedBox(
  //               height: 20,
  //             ),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: [
  //                 DefaultButtonMol(
  //                   height: 40,
  //                   text: "Tidak",
  //                   color: AppColors.greyDark,
  //                   onClick: () => Navigator.pop(context, false),
  //                 ),
  //                 DefaultButtonMol(
  //                   height: 40,
  //                   text: "Ya, Kembali",
  //                   onClick: () => Navigator.pop(context, true),
  //                 ),
  //               ],
  //             )
  //           ],
  //         ),
  //       ));
  // }

  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return HtmlUnescape().convert(htmlText.replaceAll(exp, ''));
  }

  // static addNewStack(BuildContext context, ScreenNavigationEvent event) {
  //   AppConfigProvider.of(context)
  //       .stacks
  //       .remove(AppConfigProvider.of(context).stacks.lookup(event));
  //   AppConfigProvider.of(context).stacks.add(event);
  // }

  // static showLoadingDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       child: Container(
  //         child: Center(
  //           child: CircularProgressIndicator(),
  //         ),
  //       ));
  // }

  // static removeLastStacks(BuildContext context) {
  //   AppConfigProvider.of(context)
  //       .stacks
  //       .remove(AppConfigProvider.of(context).stacks.last);
  // }

  // static removeStacksAndRenewMainPage(BuildContext context) {
  //   final stacks = AppConfigProvider.of(context).stacks;
  //   AppConfigProvider.of(context).stacks.toSet().toList();
  //   try {
  //     AppConfigProvider.of(context).stacks.remove(stacks.last);
  //     BlocProvider.of<ScreenNavigationBloc>(context).add(stacks.last);
  //   } catch (e) {
  //     print("forcely to home");
  //     BlocProvider.of<ScreenNavigationBloc>(context)..add(NavigateToProduct());
  //   }
  // }

  // static String addressFormatter(Placemark placemark) {
  //   return '${placemark.name ?? ''} ${placemark.locality ?? ''}, ${placemark.subAdministrativeArea ?? ''}, ${placemark.administrativeArea ?? ''}, ${placemark.postalCode ?? ''}, ${placemark.country ?? ''}';
  // }
}

final formatCurrency = NumberFormat.simpleCurrency(
  locale: 'IDR',
  decimalDigits: 0,
);

String parseImageUrl(String initialUrl) {
  return Config.baseEndpoint + "/image/$initialUrl";
}

String priceFormat(double price) {
  var atoms = formatCurrency.format(price).split("Rp");
  return "Rp " + atoms[1];
}

String format(double n) {
  return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
}

extension CapExtension on String {
  String get inCaps => '${this[0].toUpperCase()}${this.substring(1)}';
  String get allInCaps => this.toUpperCase();
  String get capitalizeFirstofEach =>
      this.split(" ").map((str) => str.capitalize()).join(" ");
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}

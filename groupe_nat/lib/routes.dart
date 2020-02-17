import 'package:groupe_nat/model/documentModel.dart';
import 'package:groupe_nat/page/DocumentsPage.dart';
import 'package:groupe_nat/page/SecurePage.dart';
import 'package:groupe_nat/page/SignaturePage.dart';
import 'package:groupe_nat/page/UploadDocumentPage.dart';
import 'package:groupe_nat/page/documentPage.dart';
import 'package:groupe_nat/page/geolocationPage.dart';
import 'package:groupe_nat/page/homePage.dart';

class DocumentArguments {
  final DocumentModel document;

  DocumentArguments(this.document);
}

class Routes {
  static const String home = HomePage.routeName;
  static const String geolocation = GeolocationPage.routeName;
  static const String secure = SecurePage.routeName;
  static const String signature = SignaturePage.routeName;
  static const String upload = UploadDocumentPage.routeName;
  static const String documents = DocumentsPage.routeName;
  static const String document = DocumentPage.routeName;
}

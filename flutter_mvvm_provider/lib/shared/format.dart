part of 'shared.dart';

final currencyFormat = NumberFormat("#,##0", "id_ID");
final tanggalFormat = DateFormat("HH:mm, d MMMM yyyy", "id_ID");

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

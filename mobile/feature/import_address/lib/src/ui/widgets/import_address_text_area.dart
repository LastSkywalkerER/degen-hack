import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_formatters.dart';

class ImportAddressTextArea extends StatelessWidget {
  final String? errorText;
  final Function(String) onValueChanged;
  final TextEditingController seedPhraseController;

  const ImportAddressTextArea({
    required this.errorText,
    required this.onValueChanged,
    required this.seedPhraseController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null,
      onChanged: onValueChanged,
      minLines: AppDimensions.intSize5,
      controller: seedPhraseController,
      cursorColor: AppColors.porcelain,
      style: AppFonts.regular16dmsSans.copyWith(
        color: Colors.blueGrey,
      ),
      inputFormatters: <TextInputFormatter>[
        UpperCaseTextFormatter(),
        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z_ ]+')),
      ],
      decoration: InputDecoration(
        errorText: errorText,
        suffix: TextButton(
          onPressed: () async {
            final ClipboardData? clipBoardData = await Clipboard.getData(Clipboard.kTextPlain);
            final String? clipBoardText = clipBoardData?.text;
            if (clipBoardText != null) {
              onValueChanged(clipBoardText.toLowerCase());
              seedPhraseController.text = clipBoardText.toLowerCase();
              seedPhraseController.selection = TextSelection.fromPosition(
                TextPosition(
                  offset: seedPhraseController.text.length,
                ),
              );
            }
          },
          child: Text(
            "Paste",
            style: AppFonts.regular16dmsSans.copyWith(
              color: Colors.blueGrey,
            ),
          ),
        ),
        filled: true,
        fillColor: AppColors.porcelain,
      ),
    );
  }
}

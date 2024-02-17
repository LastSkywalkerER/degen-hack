import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../../bloc/import_address_bloc.dart';

class ImportAddressForm extends StatefulWidget {
  const ImportAddressForm({
    super.key,
  });

  @override
  State<ImportAddressForm> createState() => _ImportAddressFormState();
}

class _ImportAddressFormState extends State<ImportAddressForm> {
  String seedValue = '';
  final TextEditingController seedPhraseController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(
        isNeedDefaultLeading: true,
        title: LocaleKeys.importAddress_header.watchTr(context).toUpperCase(),
      ),
      backgroundColor: AppColors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: BlocBuilder<ImportAddressBloc, ImportAddressState>(
                    builder: (BuildContext context, ImportAddressState state) {
                      if (state is ContentState) {
                        return Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 100), // Верхний отступ перед блоком
                            child: Container(
                              padding: const EdgeInsets.all(16), // Отступ внутри контейнера
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.orange, width: 2), // Оранжевая рамка
                                borderRadius: BorderRadius.circular(12), // Скругление углов
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    "Input your seed phrase",
                                    style: AppFonts.bold25dmsSans.copyWith(
                                      color: Colors.blueGrey,
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(
                                        primaryColor:
                                            Colors.blueGrey, // Цвет курсора и границы при фокусе
                                        inputDecorationTheme: InputDecorationTheme(
                                          focusedBorder: UnderlineInputBorder(
                                            // Граница при фокусе
                                            borderSide: BorderSide(color: Colors.blueGrey),
                                          ),
                                          labelStyle: TextStyle(
                                            color:
                                                Colors.blueGrey, // Цвет текста подсказки при фокусе
                                          ),
                                        ),
                                      ),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: UnderlineInputBorder(),
                                          labelText: 'Enter your seed phrase',
                                          // Для изменения цвета текста подсказки при ненаведении, если нужно
                                          // Это будет работать только для веба или платформ, поддерживающих наведение
                                          hoverColor: Colors.blueGrey,
                                        ),
                                        cursorColor: Colors.blueGrey, // Цвет курсора
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 50),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      style: buttonPrimary,
                                      onPressed: () {},
                                      child: Text(
                                        "Input seed phrase".toUpperCase(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

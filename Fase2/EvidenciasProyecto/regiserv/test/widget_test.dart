import 'package:flutter_test/flutter_test.dart';

import 'package:regiserv/main.dart';

void main() {
  testWidgets('RegiServ inicia correctamente', (WidgetTester tester) async {
    // Construir la aplicación
    await tester.pumpWidget(const RegiServApp());

    // Verificar que aparece el indicador de carga inicial
    expect(
      find.text('Comprobando sesión de RegiServ...'),
      findsOneWidget,
    );
  });
}
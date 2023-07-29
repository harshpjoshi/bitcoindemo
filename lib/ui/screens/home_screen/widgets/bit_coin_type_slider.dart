import 'package:bitcoin_demo/infrastructure/models/response/common/currency.dart';
import 'package:flutter/cupertino.dart';

class BitCoinTypeSlider extends StatelessWidget {
  final List<Currency?> currencies;
  final ValueChanged<int>? onSelectedItemChanged;

  const BitCoinTypeSlider(
      {super.key,
      required this.currencies,
      required this.onSelectedItemChanged});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CupertinoPicker(
        magnification: 1.22,
        squeeze: 1.2,
        useMagnifier: true,
        itemExtent: 32.0,
        // This sets the initial item.
        scrollController: FixedExtentScrollController(
          initialItem: 1,
        ),
        onSelectedItemChanged: onSelectedItemChanged,
        children: List<Widget>.generate(currencies.length, (int index) {
          Currency? item = currencies[index];
          return Center(
            child: Text(item?.code ?? ""),
          );
        }),
      ),
    );
  }
}

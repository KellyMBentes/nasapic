import 'package:flutter/material.dart';
import 'package:nasapic/core/utils/date_helpers.dart';
import 'package:nasapic/design_system/resources/strings.dart';

enum FilterType { string, date }

class CustomSearchBar extends StatefulWidget {
  final Function(String?, DateTime?) onSearch;

  const CustomSearchBar({super.key, required this.onSearch});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  FilterType _filterType = FilterType.string;
  DateTime? _selectedDate;
  late TextEditingController _editingController;

  @override
  void initState() {
    _editingController = TextEditingController();
    super.initState();
  }

  void _onSearch(String query) {
    widget.onSearch(query, null);
  }

  void _onDateSelected(DateTime? date) {
    setState(() {
      _selectedDate = date;
      _editingController.text = _selectedDate?.toStringRemote() ?? '';
    });
    widget.onSearch(null, date);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: _filterType == FilterType.string
                ? null
                : () async {
                    _onDateSelected(await showDatePicker(
                        context: context, initialDate: DateTime.now(), firstDate: DateTime(1995, 6, 16), lastDate: DateTime.now()));
                  },
            child: AbsorbPointer(
              absorbing: _filterType == FilterType.date,
              child: TextField(
                controller: _editingController,
                readOnly: _filterType == FilterType.date,
                decoration: InputDecoration(
                  hintText: _filterType == FilterType.string ? Strings.searchByTextHint : Strings.searchByDateHint,
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black),
                ),
                onChanged: _onSearch,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black),
                cursorColor: Colors.black,
              ),
            ),
          ),
        ),
        Opacity(
          opacity: _filterType == FilterType.date ? 0.5 : 1.0,
          child: AbsorbPointer(
            absorbing: _filterType == FilterType.date,
            child: IconButton(
              icon: const Icon(Icons.calendar_today),
              color: Colors.black,
              onPressed: () async {
                setState(() {
                  _editingController.text = '';
                  _filterType = FilterType.date;
                });
              },
            ),
          ),
        ),
        Opacity(
          opacity: _filterType == FilterType.string ? 0.5 : 1.0,
          child: AbsorbPointer(
            absorbing: _filterType == FilterType.string,
            child: IconButton(
              icon: const Icon(Icons.text_fields),
              color: Colors.black,
              onPressed: () async {
                setState(
                  () {
                    _editingController.text = '';
                    _filterType = FilterType.string;
                    _onSearch('');
                  },
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

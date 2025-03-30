import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sncf_disconnect/constants/colors.dart';

class TripSearchInput extends StatefulWidget {
  const TripSearchInput({
    super.key,
    this.size = 56,
    this.showMic = false,
    this.controller,
    this.onChanged,
  });

  final double size;
  final bool showMic;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  State<TripSearchInput> createState() => _TripSearchInputState();
}

class _TripSearchInputState extends State<TripSearchInput> {

  late final TextEditingController _controller = widget.controller ?? TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    _controller.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: SizedBox(
        height: widget.size,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Theme(
                data: Theme.of(context).copyWith(
                  textSelectionTheme: const TextSelectionThemeData(
                    cursorColor: sncfBlue,
                    selectionColor: sncfLightBlue,
                    selectionHandleColor: sncfLightBlue,
                  ),
                ),
                child: TextFormField(
                  controller: _controller,
                  focusNode: _focusNode,
                  textInputAction: TextInputAction.search,
                  onChanged: widget.onChanged,
                  decoration: const InputDecoration(
                    hintText: "Où Voulez-vous partir ?",
                    hintStyle: TextStyle(
                      color: sncfGreyBlue,
                      fontFamily: "Avenir",
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  onTapOutside: (_) => _focusNode.unfocus(),

                ),
              ),
            ),

            Builder(
              builder: (context) {
                if (_controller.text.isEmpty) {
                  return SizedBox.square(
                    dimension: widget.size,
                    child: MaterialButton(
                      onPressed: () {},
                      color: sncfLightBlue,
                      elevation: 0,
                      hoverElevation: 0,
                      focusElevation: 0,
                      highlightElevation: 0,
                      shape: const CircleBorder(),
                      padding: EdgeInsets.zero,
                      child: widget.showMic ? Icon(
                          const IconData(0xF10B, fontFamily: "Communication"),
                          size: widget.size * 0.5
                      ) : SvgPicture.asset(
                        "assets/icons/search.svg",
                        height: widget.size * 0.45,
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: SizedBox.square(
                      dimension: widget.size,
                      child: MaterialButton(
                        onPressed: () {_controller.clear();},
                        color: Colors.transparent,
                        shape: const CircleBorder(),
                        elevation: 0,
                        hoverElevation: 0,
                        focusElevation: 0,
                        highlightElevation: 0,
                        padding: EdgeInsets.zero,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: sncfGreyBlue,
                                  border: Border.all(color: Colors.transparent, width: 5),
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: SizedBox.square(dimension: widget.size * 0.4),
                              ),
                            ),

                            Align(
                              alignment: Alignment.center,
                              child: Icon(
                                const IconData(0xF142, fontFamily: "NavigationAndAction"),
                                size: widget.size * 0.6,
                                color: sncfLightGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

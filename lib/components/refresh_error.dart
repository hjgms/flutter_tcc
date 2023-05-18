import 'package:flutter/material.dart';

class RefreshError extends StatefulWidget {
  final void Function(bool value) onTapRefresh;
  final String titleError;
  
  const RefreshError({super.key, required this.onTapRefresh, required this.titleError});

  @override
  State<RefreshError> createState() => _RefreshErrorState();
}

class _RefreshErrorState extends State<RefreshError> {

  void tapped(){
    widget.onTapRefresh(true);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black12,
      height: double.maxFinite,
      width: double.maxFinite,
      child: Center(
        child: Column(
          children: [
            Text(
              widget.titleError,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black54
              ),
            ),
            const SizedBox(
              height: 20,
              width: double.maxFinite,
            ),
            GestureDetector(
              onTap: () => tapped(),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26
                ),
                child: const Text(
                  "refresh",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black54
                  ),
                ),
              )
            ),
          ],
        )
      ),
    );
  }
}

// ======
// |* *|
// |><|
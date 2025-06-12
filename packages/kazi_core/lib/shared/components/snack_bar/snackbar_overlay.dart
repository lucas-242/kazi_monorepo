part of 'kazi_snackbar.dart';

OverlayEntry _getSnackbarOverlay(String message) => OverlayEntry(
      builder: (BuildContext context) => Positioned(
        bottom: MediaQuery.viewInsetsOf(context).bottom + 50,
        child: Material(
          color: const Color(0x00000000),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Container(
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width,
              child: Container(
                decoration: BoxDecoration(
                  color: KaziColors.black,
                  borderRadius: BorderRadius.circular(KaziInsets.xs),
                ),
                margin: const EdgeInsets.symmetric(horizontal: KaziInsets.lg),
                padding: const EdgeInsets.symmetric(
                  horizontal: KaziInsets.md,
                  vertical: KaziInsets.xxs,
                ),
                child: Text(
                  message,
                  softWrap: true,
                  style: KaziTextStyles.md,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
      ),
    );

# Emulator recipes

## Lock

One shared emulator: ask the PO, wait for "yes", announce "free". Leave it clean.

## adb basics

```
adb devices
adb uninstall <package>                          # fresh install
adb install -r app-debug.apk
adb shell am start -a android.intent.action.VIEW -d "app://task/<id>?seed=1" <package>
adb shell settings put system font_scale 2.0     # 200 % (reset with 1.0)
adb shell settings put system accelerometer_rotation 0 && adb shell settings put system user_rotation 1
adb shell input keyevent 61                      # Tab (66 = Enter) for keyboard checks
adb exec-out screencap -p > shot.png
adb emu kill                                      # stop; if adb hangs, kill the emulator by PID
```

- `date -s` needs root on emulator images; use the app's debug clock offset instead.
- Live TalkBack may not bind on some images; check the accessibility tree and verify on a phone.

## Device MCP

- Prefer reading the element list over screenshots; tap by element reference.
- Screenshot coordinates may be scaled relative to device pixels; convert before tapping by coordinates.
- Opening URLs with `&` through the MCP can break; use `adb shell am start` with the URL in single quotes.

## Windows + Git Bash quirks

- `adb` and `gh` may not be on PATH; call them by full path.
- Prefix with `MSYS_NO_PATHCONV=1` when passing device paths (`/sdcard/...`) to avoid path rewriting.
- Write scripts with quotes or non-ASCII text to files instead of heredocs; set `PYTHONIOENCODING=utf-8`.
- Do not chain validate/commit/merge in one command line where a failure could let the next step run on the wrong branch.
- Browser on the emulator (for checking web prototypes) slows down with many tabs; close them.

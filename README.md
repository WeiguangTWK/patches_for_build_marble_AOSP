# patches_for_build_marble_AOSP_like_ROM

## Features

1. solve shared library confliction error like

>error: hardware/qcom-caf/sm8450/audio/agm/ipc/HwBinders/agm_ipc_service: MODULE.TARGET.SHARED_LIBRARIES.vendor.qti.hardware.AGMIPC@1.0-impl already defined by vendor/xiaomi/sm8450-common.

what these patches done to make it work:
>libagm => libagm_c

2. solve SELinux rule confliction
3. Switch from EXT4 to EROFS
4. \[for Chinese Users] Change NTP server
5. \[for Chinese Users] Change captive portal detection URL
6. \[for Chinese Users] Change default search engine of builtin browser
7. AVB & DM-verity Enabled

## How to use

First of all, use device and vendor from [Chaitanyakm](https://github.com/Chaitanyakm), it is newer and better

1. clone this repo under your LineageOS source root

```
git clone --depth=1 https://github.com/WeiguangTWK/patches_for_build_marble_AOSP .
```

*1. (if you need Chaitanyakm's device&vendor&miui-camera) copy folder local_mainfest into .repo then sync

```
repo sync -c
```

**1. also to build with miui camera, you need to extract blob from your phone first

```
cd device/xiaomi/miuicamera-marble
./extract-files.py
```

2. apply them according to your need

```
chmod +x ./patch_diff.sh
patch_diff.sh <diff file>
```

*3. To enable GMS, ont only you need to patch Enable GMS patch but also need to clone Mind The Gapps repo

```
git clone --depth=1 https://gitlab.com/MindTheGapps/vendor_gapps vendor/gapps
```

Enjoy!

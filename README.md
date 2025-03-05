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

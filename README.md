# patches_for_build_marble_AOSP_like_ROM

When I am trying to build AOSPA/LineageOS/InfinityX for marble, there's always errors like

>error: hardware/qcom-caf/sm8450/audio/agm/ipc/HwBinders/agm_ipc_service: MODULE.TARGET.SHARED_LIBRARIES.vendor.qti.hardware.AGMIPC@1.0-impl already defined by vendor/xiaomi/sm8450-common.

I solve the error through a non-elegant way: change name

>libagm => libagm_c

That basicly what these patches done to make it work

Also error about confliction on SELinux Context solved

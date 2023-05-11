@@ -0,0 +1,62 @@
/*
 * Copyright (C) 2021-2022 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <libinit_dalvik_heap.h>
#include <libinit_variant.h>

#include "vendor_init.h"

#define FINGERPRINT "Samsung/a71/a71:a71naxx-user 11 RP1A.200720.012 A715FXXU3BUB5 release-keys"

static const variant_info_t a71_global_info = {
    .hwc_value = "",
    .sku_value = "",

    .brand = "Samsung",
    .device = "a71",
    .marketname = "",
    .model = "SM-A715F",
    .build_fingerprint = FINGERPRINT,

    .nfc = NFC_TYPE_NFC_ESE,
};

static const variant_info_t a71_info = {
    .hwc_value = "",
    .sku_value = "",

    .brand = "Samsung",
    .device = "a71",
    .marketname = "",
    .model = "A715F",
    .build_fingerprint = FINGERPRINT,

    .nfc = NFC_TYPE_NFC_ESE,
};

static const std::vector<variant_info_t> variants = {
    a71_global_info,
    a71_info,
};

void vendor_load_properties() {
    set_dalvik_heap();
    search_variant(variants);
}
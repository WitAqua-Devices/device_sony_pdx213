#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#
# device/sony/pdx213/extract-files.py
#
# Usage, from inside the build tree:
#   ./extract-files.py <path to an extracted stock XQ-BT44 firmware>

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'hardware/sony',
    'vendor/sony/sm6350-common',
]

def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'vendor' else None


# The Egistec fingerprint HAL needs gBnConstructorMap and gBsConstructorMap,
# which libhidlbase no longer exports, so it fails to dlopen.  Pull in
# libhidlbase_shim by rewriting the NEEDED libhidltransport.so, an empty stub
# these days whose name happens to be exactly as long.
blob_fixups: blob_fixups_user_type = {
    (
        'vendor/lib64/hw/fingerprint.default.so',
    ): blob_fixup()
        .binary_regex_replace(b'libhidltransport.so', b'libhidlbase_shim.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'pdx213',
    'sony',
    namespace_imports=namespace_imports,
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'sm6350-common', module.vendor
    )
    utils.run()

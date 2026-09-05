#!/bin/bash
# Apply iPad-Unofficial branding + a proper iOS app icon to a built Blender.app, in place.
#
# Why this exists: the iOS build references the icon via CFBundleIconFile -> a .icns file,
# but iOS ignores .icns for the home-screen icon — it needs PNG icons declared under
# CFBundleIcons. So after the build we inject PNG icons (from a 1024px source) and the
# CFBundleIcons keys, and force the bundle id / display name (in case an incremental build
# didn't refresh Info.plist).
#
# Usage: bash apply_branding.sh <path-to-Blender.app> <path-to-icon-1024.png>
set -euo pipefail

APP="${1:?usage: apply_branding.sh <Blender.app> <icon-1024.png>}"
ICON="${2:?usage: apply_branding.sh <Blender.app> <icon-1024.png>}"
PL="$APP/Info.plist"
PB=/usr/libexec/PlistBuddy

# iOS PNG app icons (sizes for iPad: 76@1x, 76@2x=152, 83.5@2x=167; plus 60@2x=120 fallback).
sips -z 120 120 "$ICON" --out "$APP/AppIcon60x60@2x.png"          >/dev/null
sips -z 76  76  "$ICON" --out "$APP/AppIcon76x76~ipad.png"        >/dev/null
sips -z 152 152 "$ICON" --out "$APP/AppIcon76x76@2x~ipad.png"     >/dev/null
sips -z 167 167 "$ICON" --out "$APP/AppIcon83.5x83.5@2x~ipad.png" >/dev/null

# Verify Info.plist exists
test -f "$PL" || { echo "::error::$PL does not exist!"; exit 1; }

# Branding & bundle metadata (force — belt and suspenders).
$PB -c "Set :CFBundleIdentifier com.unofficial.blenderipad" "$PL" 2>/dev/null \
  || $PB -c "Add :CFBundleIdentifier string com.unofficial.blenderipad" "$PL"
$PB -c "Set :CFBundleDisplayName Blender iPad" "$PL" 2>/dev/null \
  || $PB -c "Add :CFBundleDisplayName string Blender iPad" "$PL"
$PB -c "Set :CFBundleName Blender" "$PL" 2>/dev/null \
  || $PB -c "Add :CFBundleName string Blender" "$PL"
$PB -c "Set :CFBundleExecutable Blender" "$PL" 2>/dev/null \
  || $PB -c "Add :CFBundleExecutable string Blender" "$PL"
$PB -c "Set :CFBundlePackageType APPL" "$PL" 2>/dev/null \
  || $PB -c "Add :CFBundlePackageType string APPL" "$PL"

# Fix any unexpanded CMake version strings
CURRENT_VER=$($PB -c "Print :CFBundleShortVersionString" "$PL" 2>/dev/null || echo "")
if [[ "$CURRENT_VER" == *"\$"* || -z "$CURRENT_VER" ]]; then
  $PB -c "Set :CFBundleShortVersionString 5.0.0" "$PL" 2>/dev/null \
    || $PB -c "Add :CFBundleShortVersionString string 5.0.0" "$PL"
fi
CURRENT_BVER=$($PB -c "Print :CFBundleVersion" "$PL" 2>/dev/null || echo "")
if [[ "$CURRENT_BVER" == *"\$"* || -z "$CURRENT_BVER" ]]; then
  $PB -c "Set :CFBundleVersion 5.0.0" "$PL" 2>/dev/null \
    || $PB -c "Add :CFBundleVersion string 5.0.0" "$PL"
fi

# iOS platform & device requirements for sideloading tools (Sideloadly, AltStore, etc.)
$PB -c "Delete :CFBundleSupportedPlatforms" "$PL" 2>/dev/null || true
$PB -c "Add :CFBundleSupportedPlatforms array" "$PL"
$PB -c "Add :CFBundleSupportedPlatforms: string iPhoneOS" "$PL"
$PB -c "Delete :UIDeviceFamily" "$PL" 2>/dev/null || true
$PB -c "Add :UIDeviceFamily array" "$PL"
$PB -c "Add :UIDeviceFamily: integer 2" "$PL"
$PB -c "Set :MinimumOSVersion 16.0" "$PL" 2>/dev/null \
  || $PB -c "Add :MinimumOSVersion string 16.0" "$PL"
$PB -c "Set :DTPlatformName iphoneos" "$PL" 2>/dev/null \
  || $PB -c "Add :DTPlatformName string iphoneos" "$PL"

# iOS icon keys (replace any existing).
$PB -c "Delete :CFBundleIcons" "$PL" 2>/dev/null || true
$PB -c "Delete :CFBundleIcons~ipad" "$PL" 2>/dev/null || true
$PB -c "Add :CFBundleIcons dict" "$PL"
$PB -c "Add :CFBundleIcons:CFBundlePrimaryIcon dict" "$PL"
$PB -c "Add :CFBundleIcons:CFBundlePrimaryIcon:CFBundleIconFiles array" "$PL"
$PB -c "Add :CFBundleIcons:CFBundlePrimaryIcon:CFBundleIconFiles: string AppIcon60x60" "$PL"
$PB -c "Add :CFBundleIcons~ipad dict" "$PL"
$PB -c "Add :CFBundleIcons~ipad:CFBundlePrimaryIcon dict" "$PL"
$PB -c "Add :CFBundleIcons~ipad:CFBundlePrimaryIcon:CFBundleIconFiles array" "$PL"
$PB -c "Add :CFBundleIcons~ipad:CFBundlePrimaryIcon:CFBundleIconFiles: string AppIcon60x60" "$PL"
$PB -c "Add :CFBundleIcons~ipad:CFBundlePrimaryIcon:CFBundleIconFiles: string AppIcon76x76" "$PL"
$PB -c "Add :CFBundleIcons~ipad:CFBundlePrimaryIcon:CFBundleIconFiles: string AppIcon83.5x83.5" "$PL"

# Clean up official identifiers the build may not have picked up from the source plist.
$PB -c "Set :CFBundleGetInfoString 5.0.0, Unofficial iPad build (not affiliated with the Blender Foundation)" "$PL" 2>/dev/null || true
$PB -c "Set :CFBundleDocumentTypes:0:LSItemContentTypes:0 com.unofficial.blenderipad.file" "$PL" 2>/dev/null || true
$PB -c "Set :UTExportedTypeDeclarations:0:UTTypeIdentifier com.unofficial.blenderipad.file" "$PL" 2>/dev/null || true

# File sharing & Documents access for iOS Files app ("On My iPad").
$PB -c "Delete :UISupportsDocumentBrowser" "$PL" 2>/dev/null || true
$PB -c "Set :UIFileSharingEnabled true" "$PL" 2>/dev/null \
  || $PB -c "Add :UIFileSharingEnabled bool true" "$PL"
$PB -c "Set :LSSupportsOpeningDocumentsInPlace true" "$PL" 2>/dev/null \
  || $PB -c "Add :LSSupportsOpeningDocumentsInPlace bool true" "$PL"

# Lint and convert to binary
plutil -lint "$PL"
plutil -convert binary1 "$PL"

echo "    branding + iOS icons applied to $APP"


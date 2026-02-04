#!/bin/bash

set -e

echo "Installing YDP.app..."

APP_NAME="YDP.app"
APP_PATH="$HOME/Applications/$APP_NAME"
SOURCE_DIR="$HOME/dotfiles/apps/ydp"

if [[ ! -d "$SOURCE_DIR" ]]; then
  echo "Error: Source directory not found at $SOURCE_DIR"
  exit 1
fi

echo "Creating app bundle structure..."
mkdir -p "$APP_PATH/Contents/MacOS"

echo "Copying Info.plist..."
cp "$SOURCE_DIR/Info.plist" "$APP_PATH/Contents/Info.plist"

echo "Copying launcher script..."
cp "$SOURCE_DIR/YDP" "$APP_PATH/Contents/MacOS/YDP"

echo "Setting executable permissions..."
chmod +x "$APP_PATH/Contents/MacOS/YDP"

echo "Registering with Spotlight..."
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister \
  -f "$APP_PATH"

echo ""
echo "✓ YDP.app installed successfully at $APP_PATH"
echo ""
echo "Usage:"
echo "  1. Copy a video URL to clipboard"
echo "  2. Press Cmd+Space and type 'YDP'"
echo "  3. Press Enter to start download"
echo ""

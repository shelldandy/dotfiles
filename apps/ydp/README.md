# YDP Spotlight Launcher

A macOS application that launches the ydp (YouTube Download Plus) script from Spotlight.

## What It Does

YDP.app provides a convenient way to download videos without opening a terminal first:

1. Copy a video URL to your clipboard
2. Press Cmd+Space and type "YDP"
3. Press Enter
4. A Kitty terminal window opens and starts the download
5. The window stays open after completion so you can see the results

## Installation

Run the installer script from the dotfiles directory:

```bash
cd ~/dotfiles/scripts
./install-ydp-app.sh
```

This will:
- Create `~/Applications/YDP.app` with the proper bundle structure
- Register the app with Spotlight
- Make it immediately searchable

The installer is also run automatically during the main dotfiles installation.

## Usage

### Basic Download

1. Copy a video URL to clipboard (Cmd+C)
2. Press Cmd+Space (Spotlight)
3. Type "YDP"
4. Press Enter
5. Wait for download to complete

The download will be saved to `~/Downloads/` with the format: `Video Title [video_id].mp4`

### Audio-Only Download

The standard Spotlight launch does not support the `--audio` flag. For audio downloads, open a terminal and run:

```bash
ydp --audio
```

## Requirements

- **Kitty terminal**: Must be installed at `/opt/homebrew/bin/kitty`
- **ydp script**: Must be installed at `~/.bin/ydp`
- **yt-dlp**: Must be installed and in PATH

All dependencies are installed via the main dotfiles installation script.

## Reinstalling

To reinstall after updates to the launcher script:

```bash
cd ~/dotfiles/scripts
./install-ydp-app.sh
```

This will overwrite the existing installation.

## Uninstalling

```bash
rm -rf ~/Applications/YDP.app
```

## Troubleshooting

### App doesn't appear in Spotlight

Wait a few minutes for Spotlight to index, or force reindexing:

```bash
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister \
  -f ~/Applications/YDP.app
```

### "Kitty terminal not found" notification

Install Kitty via Homebrew:

```bash
brew install --cask kitty
```

### "ydp script not found" notification

Ensure the dotfiles are properly installed and rcup has been run:

```bash
cd ~/dotfiles
rcup -v
```

### Download fails or shows errors

This is usually a yt-dlp issue. Check:
- URL is copied to clipboard correctly
- yt-dlp is up to date: `brew upgrade yt-dlp`
- URL is supported by yt-dlp

## Technical Details

YDP.app is a shell script wrapped in a macOS application bundle:

- **Bundle location**: `~/Applications/YDP.app`
- **Launcher script**: `~/Applications/YDP.app/Contents/MacOS/YDP`
- **Metadata**: `~/Applications/YDP.app/Contents/Info.plist`
- **Source files**: `~/dotfiles/apps/ydp/`

The launcher script spawns Kitty with the `--hold` flag to keep the window open after the download completes.

# WindowHighlight
A lightweight [AutoHotkey](https://www.autohotkey.com/) script that draws a **thin red border around the active window** on [Windows](https://www.microsoft.com/windows) to make it easier to see which window is focused.

## Features
- Automatically highlights the currently active window
- Border updates instantly as you switch focus
- Lightweight and flicker-free
- Customizable border color, thickness, and offset

## Run on Startup
To make the script run automatically every time you log in:

1. Press `Win + R`
2. Type `shell:startup` and press Enter  
   *(This opens your Startup folder)*
3. Go to the folder where your `.ahk` script is saved
4. Right-click your `.ahk` file → **Copy**
5. Go back to the Startup folder → Right-click → **Paste shortcut**

## Notes
- This script uses `WinMinimize` instead of `WinHide` so windows remain visible in task switchers

## License

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions or feedback, reach out via email:
- **Email**: jred8069@gmail.com


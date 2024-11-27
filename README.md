
# Input Alarm

**Tagline:**  
*A simple command-line alarm tool for Linux featuring sound clips inspired by Johnny 5 from my favorite 80s movie Short Circuit.*

---

## Overview

Input Alarm is a lightweight and flexible alarm tool for Linux. It allows you to set alarms directly from the command line, with optional custom messages and sound notifications. The alarm sounds include iconic clips inspired by Johnny 5 from the movie *Short Circuit*. 



---

## Features

- **Easy Command-Line Usage:** Set alarms quickly with simple commands.
- **Johnny 5-Themed Sounds:** Randomly plays a sound clip (MP3) from the *Short Circuit* theme.
- **Pop-Up Notifications:** Displays a visual alarm message using `zenity`.
- **Alarm Management:** Clear all active alarms with a single command.
- **Cross-Distribution Compatibility:** Works on most Linux distributions with `bash`, `zenity`, and `mpg123`.

---

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/fufroom/input-alarm.git
   cd input-alarm
   ```

2. Make the script executable:
   ```bash
   chmod +x input-alarm.sh
   ```

3. (Optional) Add it to your PATH:
   ```bash
   sudo ln -s "$(pwd)/input-alarm.sh" /usr/local/bin/input-alarm
   ```

4. Install required dependencies:
   - `zenity` (for notifications)
   - `mpg123` (for playing sounds)

   Install these tools if they’re not already available:
   ```bash
   sudo apt update
   sudo apt install -y zenity mpg123
   ```

---

## Usage

### Set an Alarm
To set an alarm for a specific time:
```bash
input-alarm 10:45am "Wake up, Number Five!"
```

- The time can be in various formats, such as `10:45am`, `14:00`, or `+5 minutes`.
- The message is optional. If omitted, a default message will be displayed.

### Clear All Active Alarms
To clear all currently active alarms:
```bash
input-alarm clear
```

---

## Sounds Directory

Sound clips should be stored in the `sounds` folder within the same directory as the script. Ensure the folder contains `.mp3` files.

- **Default Folder:** `./sounds/`
- Add sound clips inspired by *Short Circuit* or any custom `.mp3` files you like.

---

## License

### Code
Input Alarm is licensed under the **Mozilla Public License 2.0**. You are free to use, modify, and distribute the code under the terms of this license.

### Sounds
The included sound clips are copyrighted by the respective owners of the movie *Short Circuit*. They are not included in this repository and must be sourced separately, respecting all copyright laws.

---

## Disclaimer

This tool is for personal use and is not officially affiliated with or endorsed by the owners of *Short Circuit*. Be sure to respect copyright laws when adding sound clips.

---

## Contributing

Contributions are welcome! Feel free to submit pull requests or open issues on the [GitHub repository](https://github.com/fufroom/input-alarm).

---

## Author

Created by **fufroom**.  
GitHub: [https://github.com/fufroom](https://github.com/fufroom)


## License

This tool is open-source under the Mozilla Public License 2.0, with sound clips used under copyright of their respective owners.

Sound clips © Sony Pictures Entertainment. All rights reserved.
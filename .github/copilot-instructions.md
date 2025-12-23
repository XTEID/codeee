# Copilot Instructions for Scrcpy Launcher Project

## Architecture Overview
This project is a Windows batch script launcher for the Scrcpy Android screen mirroring tool. It provides an interactive menu-driven interface to configure and launch Scrcpy with optimized settings for different use cases.

**Key Components:**
- Interactive menu system with 4 modes: Full (video+audio), Audio-only, Video-only, Exit
- Dynamic option building based on user input
- Error handling and user feedback

**Data Flow:**
User selections → Batch variables → Scrcpy command-line execution

**Structural Decisions:**
- Uses `goto` for flow control (standard for batch scripts)
- Indonesian language for UI elements to match target audience
- Assumes `scrcpy.exe` is colocated with the script in the same directory

## Developer Workflows
- **Running:** Double-click `LAUNCHER VAIZ STREAM.CMD` or execute in Command Prompt
- **Debugging:** Add `echo` statements to inspect variables; run with `cmd /k` to keep window open
- **Testing:** Manually test each menu option; verify Scrcpy launches correctly with options
- **No build process:** Direct script execution

## Project Conventions
- **Language:** Indonesian for all user-facing text and comments
- **Path Handling:** Use `%~dp0` for script directory (handles spaces in paths)
- **Option Building:** Accumulate options in `opts` variable, e.g., `set opts=%opts% --max-size=%m_size%`
- **Input Validation:** Check for empty strings with `if not "%var%"==""`
- **Error Checking:** Use `%errorlevel%` after command execution

## Integration Points
- **External Dependency:** Scrcpy executable (not included; user must provide)
- **Android Device:** Requires USB debugging enabled and device connected
- **Communication:** Command-line arguments passed directly to Scrcpy

**Example Command Construction:**
```
set opts=
set /p m_size="Resolution: "
if not "%m_size%"=="" set opts=%opts% --max-size=%m_size%
"%SC_PATH%" %opts%
```

## Key Files
- [LAUNCHER VAIZ STREAM.CMD](LAUNCHER VAIZ STREAM.CMD) - Main launcher script
- [README.md](README.md) - Feature documentation and usage guide
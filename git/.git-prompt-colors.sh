# This is the custom theme template for gitprompt.sh

# These are the defaults from the "Default" theme 
# You just need to override what you want to have changed
override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Custom"

  PathShort="\W" # Display only the current folder

  # Display the current folder first
  GIT_PROMPT_START_USER="\[\033[0;33m\]\u\[\033[0m\]@\[\033[0;96m\]\h\[\033[0m\]"
  GIT_PROMPT_START_ROOT="\[\033[0;33m\]\u\[\033[0m\]@\[\033[0;96m\]\h\[\033[0m\]"
  GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=1

  # Skip the default prefix
  GIT_PROMPT_PREFIX="${ResetColor}"

  # Use whitespace as separator
  GIT_PROMPT_SEPARATOR=" "

  # Skip remote branch
  GIT_PROMPT_REMOTE="${ResetColor}"
  GIT_PROMPT_UPSTREAM="${ResetColor}"

  # Use yellow for the current branch
  GIT_PROMPT_BRANCH="\n${Red}"

  # Use red and green for behind and ahead origin
  GIT_PROMPT_SYMBOLS_BEHIND="${Red} ↓"
  GIT_PROMPT_SYMBOLS_AHEAD="${Green} ↑"

  # Add a few emojis to make it fun!
  GIT_PROMPT_STAGED="${Yellow}👍 "
  GIT_PROMPT_CONFLICTS="${Red}❌ "
  GIT_PROMPT_CHANGED="${Yellow}✏️ "
  GIT_PROMPT_UNTRACKED="❔ "
  GIT_PROMPT_STASHED="${Yellow}📦 " # A lot nicer than the default flag
  GIT_PROMPT_CLEAN="${ResetColor}✅ "  
  GIT_PROMPT_SYMBOLS_NO_REMOTE_TRACKING=" 🔒 " # Displayed for untracked brances

  # Skip the default suffix
  GIT_PROMPT_SUFFIX=" "

  # Skip the default ending
  GIT_PROMPT_END_USER="\[\033[0m\]\n\[\033[1;96m\]\w>\[\033[0m\]${ResetColor}"
  GIT_PROMPT_END_ROOT="\[\033[0m\]\n\[\033[1;96m\]\w>\[\033[0m\]${ResetColor}"
}

reload_git_prompt_colors "Custom"

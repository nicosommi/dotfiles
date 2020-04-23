# https://developer.mozilla.org/en-US/docs/Mozilla/Command_Line_Options
fn firefox() {
  /Applications/Firefox.app/Contents/MacOS/firefox $@ &
}

fn firefox-dev() {
  /Applications/Firefox\ Developer\ Edition.app/Contents/MacOS/firefox $@ &
}

alias ff=firefox
alias ff-enhaced='firefox -P "enhaced"'
alias ff-anonymous='firefox -P "anonymous"'
alias ff-banking='firefox -P "banking"'
alias ffd=firefox-dev
alias fd=firefox-dev
alias ff-dev=firefox-dev
alias ff-profilemanager='firefox -profilemanager'
alias ffd-profilemanager='firefox-dev -profilemanager'

fn ff-create-profile() {
  ff -CreateProfile $1
}

fn ff-create-profiles() {
  ff-create-profile enhaced
  ff-create-profile anonymous
  ff-create-profile banking
}

PATH=$PATH:$HOME/bin

# Show date, time, user, host, and last exit code ($?). If root, user is bold
# and yellow. If exit code non-zero, it is displayed in bold red, otherwise in
# normal green. Prompt character is # if root, % otherwise.
PROMPT="[%D{%F %T}] %(!,%F{yellow}%B%n%b%f,%n)@%m [%(?,%F{green}%?%f,%F{red}%B%?%b%f)] %# "

# xterms get a title bar message
case $TERM in
  *xterm*|rxvt|(dt|k|E)term)
    function set_title_bar () {
      local title="`print -P $*`"
      print -n "\e]0;${title}\a"
    }
    function set_xt () { set_title_bar "%n@%m:%~" }
    function chpwd ()  { set_xt }
    function sudo ()   { set_title_bar "sudo";      command sudo $*;   set_xt; }
    function ssh ()    { set_title_bar "ssh $*";    command ssh $*;    set_xt; }
    function telnet () { set_title_bar "telnet $*"; command telnet $*; set_xt; }
    set_xt
    ;;
esac

# Use Emacs in windowless mode and Emacs standard key bindings
export EDITOR="emacs -nw"
bindkey -e

alias chrome="open /Applications/Google\ Chrome.app"

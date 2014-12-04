PATH=$PATH:$HOME/bin

# Show the exit code of the last command ($?) in green if zero, bold red otherwise
PROMPT="[%(?,%F{green}%?%f,%F{red}%B%?%b%f)]%% "

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

alias chrome="open /Applications/Google\ Chrome.app"

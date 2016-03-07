# ~/.bash_aliases : sourced by ~/.bashrc

# kill everything, goddammit
alias killx='sudo pkill -9 Xorg'

# omg just go away
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
alias bye='sudo /sbin/poweroff'

# managing .bashrc & .bash_aliases
alias edrc='nvim ~/.bashrc'
alias brc='nvim ~/.bashrc'
alias edal='nvim ~/.bash_aliases'
alias reload='source ~/.bashrc'
alias fn='cd ~/.bash_functions'

# development package managers
alias ni='npm i'
alias npmi='npm init -y && packy'
alias newnpm='npmi'
alias ns='npm start'
alias ninit='cp ~/.package.json ./package.json'
alias npms='npm start'
alias nig='npm install -g'
alias nid='npm install --save-dev'
alias nis='npm install --save'
alias npmu='npm update -g'
alias npmupd='npm update -g'
alias bupd='bower update'
alias bi='bower install'
alias pipupd='pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U'

# apt/dpkg stuff
alias upd='sudo apt-get update'
alias upg='sudo apt-get update && sudo apt-get upgrade'
alias prg='sudo apt-get purge'
alias search='apt-cache search'
alias policy='apt-cache policy'
alias depends='apt-cache depends'
alias ins='sudo apt-get install'
alias insd='dpkg -l | ag ii | less'
alias isit='dpkg -l | ag ii | ag'
alias rdepends='apt-cache rdepends'
alias show='apt-cache show'
alias dupg='sudo apt-get update && sudo apt-get dist-upgrade'
alias arm='sudo apt-get autoremove'
alias what-gives='apt-cache show "$1" | grep "^Filename:" | sed -e "s:\(.*\)/\(.*\)/\(.*\)/\(.*\)/.*:\4:"'
alias what-repo='apt-cache show "$1" | grep ^Filename: | head -n1 | col2 /'
alias what-source='apt-cache show "$1" | grep "^Filename:" | sed -e "s:\(.*\)/\(.*\)/\(.*\)/\(.*\)/.*:\4:"'

# git, etc.
alias gcl='git clone'
alias gst='git st'
alias branches='git branches'
alias publish='git publish'
alias sprout='git sprout'
alias switch='git switch'
alias gimme='git pull origin master'
alias gg='git go'
alias git='git-feats'
alias hc='hub clone'
alias hl='hub clone'
alias hcl='hub clone'
alias gp='git push'
alias com='commemoji'
alias ae='git add -A && commemoji'

# navigation
alias Cd='cd'
alias CD='cd'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../../"
alias ......="cd ../../../../.."
alias ,,='..'
alias ,,,='...'
alias ,,,,='....'
alias ,,,,,='.....'
alias ,,,,,,='......'
alias fonts="cd /usr/share/fonts"
alias cs='cd $OLDPWD'
alias ..a='.. && a'
alias ...a='... && a'
alias ....a='.... && a'

# safety, etc.
# alias rm='rm -Iv --preserve-root'
# gh:sindresorhus/trash,empty-trash
alias rm='trash'
alias erm='empty-trash'
alias mv='mv -iv'
alias cp='cp -iv'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'
# alias shred='shred -n 100 -z -v -u'
alias shred='echo NOPE, WE LIKE '
alias unl='unlink'
alias rml='unlink'

# ls things
alias ls='ls -F --color=auto --group-directories-first'
alias k='ls'
alias l='ls -oshS'
alias la='ls -A'
alias ll='ls -lh --author'
alias lo='ls -lghtr'
alias lT='ls -rtH'
alias ld='ls -d */'
alias lr='ls -aR'
alias lc='ls -ltcr'
alias lH='ls -hHsorA'
alias lS='ls -AosSh'
alias a='ls -A'

# ~~ag~~ _grep_ things
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# browsers rock.
alias ch='chromium'
alias ff='firefox'
alias ffs='firefox --safe-mode'
alias ffm='firefox --ProfileManager'
alias ffmps='firefox --ProfileManager --safe-mode'
alias ot='otter-browser'
alias qu='qutebrowser'
alias lk='luakit'
alias sm='seamonkey'
alias ice='iceweasel'

# browsers suck.
alias kk='kill-tabs'
alias kch='pkill -15 chromium'
alias kice='pkill -15 iceweasel'
alias kff='pkill -15 firefox'
alias ksm='pkill -15 seamonkey'
alias kqu='pkill -15 qutebrowser'
alias klk='pkill -15 luakit'

# dropbox, aka ~/
alias dbup='dropbox start'
alias dbdn='dropbox stop'
alias dbst='dropbox status'
alias dbls='dropbox filestatus ~/Dropbox/*'

# twatter
alias tweet='twidge update'
alias feed='twidge lsrecent'
alias mytw='twidge lsarchive'

# https://github.com/nvbn/thefuck (correct me, please)
alias fuck='eval $(thefuck $(fc -ln -1))'
alias please='fuck'

# this serves as a replacement for the script from http://motd.sh/
# for your config, change the zip code, degrees (to c, if needed), stocks (to y, if needed),
# and quotes (to '' if needed).
alias motd='curl -fsH "Accept: text/plain" "http://motd.sh/?v=0.01&weather=84601&degrees=f&stocks=&quotes=y" && echo " "'

# this requires sox, and is for CGCFGC. change to E2-E4 (etc) for standard.
alias tuner='for n in C2 G2 C3 F3 G3 C4;do play -n synth 4 pluck $n repeat 2;done'

# using gh:ruyadorno/ipt
alias irm="ls | ipt -m | xargs rm -rf"
alias irebase="git --no-pager log --oneline | ipt | cut -d ' ' -f 1 | xargs -o git rebase -i"
alias icheckout="git --no-pager log --oneline | ipt | cut -d ' ' -f 1 | xargs git checkout"

# editor things
alias atom='atom-beta -d'
alias ab='atom-beta -d'
alias ad='atom-beta -d'
alias abd='atom-beta -d'
alias apmupd='apm update --no-confirm'
alias li='light'
alias ta='textadept'
alias v='v.sh'
alias ex='nvim'
alias vi='nvim'
alias vib='nvim -b'
alias vim='nvim'
alias vir='nvim -R'
alias virb='nvim -R -b'
alias view='vim -R'
alias vl='v -l'

# all the rest
alias 4444='4444.js'
alias q='exit'
alias q!='q'
alias :WQ='q'
alias :Wq='q'
alias :Q='q'
alias :q='q'
alias :wQ='q'
alias :wq='q'
alias A='la'
alias Cat='cat'
alias Q!='q'
alias Q='q'
alias ZZ='q'
alias aag='a | ag'
alias alarm='alarm --config'
alias all='compgen -c | sort -u'
alias apr="apropos"
alias bbp='./bb.sh post'
alias bofhexcuse='telnet towel.blinkenlights.nl 666'
alias bs='bs.sh'
alias c2f='ctof.sh'
alias c='clear'
alias cat='ccat'
alias cheatsheet='less ~/doc/cheatsheet.md'
alias cl='clone'
alias cn='cn.sh'
alias co='xclip -selection clipboard'
alias ctimg='ctimg.sh'
alias ctof='ctof.sh'
alias cuip='curl ifconfig\.me/ip'
alias cx='chmod +x'
alias dashes='dashes.sh'
alias dayofyear='date +%j'
alias dfm='dmenu-fm'
alias di='diff'
alias dif='diff'
alias diffdir='diffdirs.sh'
alias diffdirs='diffdirs.sh'
alias dirsize='dirsize.sh'
alias disk='du -S | sort -n -r | less'
alias dmenfm='dmenfm.sh'
alias dmenu-fm='dmenu-fm.sh'
alias dmenu_wrapper='dmenu_wrapper.sh'
alias ds.='dirsize.sh .'
alias ds='dirsize.sh'
alias dt="dvtm -m ^"
alias dugigs='du -h . | grep ^[0-9.][0-9.]G'
alias dumegs='du -h . | grep ^[5-9][0-9][0-9.]M'
alias es='evilscan 127.0.0.1 --port=1024-29000'
alias explain='explain.sh'
alias feh='viewnior'
alias ffind='ffind.py'
alias fontlist='fc-list | cut -d : -f 2 | sort -u | uniq'
alias fs='ranger'
alias fv='fervor -dark'
alias fz='filezilla'
alias glance='glance -p 9876 -v'
alias gui='startxfce4'
alias gv='gpicview'
alias h='history'
alias hackurls='w3m hackurls.com'
alias halp='lo -R ~/doc/'
alias hkurlist='wget -O - hackurls.com/ascii | less'
alias hr='hr.sh'
alias ix='ix.sh'
alias k9='pkill -9'
alias kafe='coffee -c'
alias kat='ccat'
alias kmdb='mdb --shutdown'
alias kn='killall node'
alias le='less'
alias les='less'
alias lh='laenza.sh'
alias lilnote='lilnote.js'
alias localbin='zerobin && lt -p 8000'
alias locate='locate -ie'
alias lv='luvi'
alias makelist="make -rpn | sed -n -e '/^$/ { n ; /^[^ .#][^ ]*:/p ; }' | egrep --color '^[^ ]*:'"
alias manb='man -H'
alias mc='msee'
alias md='mkdir -p -v'
alias mdb='mongod --dbpath=db/ --fork --nojournal --syslog'
alias mp='mplayer2'
alias mpad='mousepad'
alias ms='msee'
alias mu='mocp -y -T moc_theme'
alias names='names.sh'
alias nodi='nodei'
alias nr='repl.history'
alias pa='xclip -o'
alias pb='pinboard'
alias pc='pin-cushion'
alias phps='php -S 127.0.0.1:5555'
alias pip='pip3.5'
alias random8chars='dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | sed -ne 2p | cut -c-8'
alias rbs='rainbowstream'
alias rep='repl-it'
alias reph='repl-here'
alias replface='replface.js'
alias rf='replface'
alias screencast='ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -sameq ~/.tmp/screencast.mpg'
alias sd.='dirsize.sh .'
alias sd='dirsize.sh'
alias sf='standard-format -w'
alias sfm='spacefm'
alias sl='slack-desktop'
alias slh='slackhist'
alias sprunge='sprunge.sh'
alias stopwatch='time read -N 1'
alias sw='time cat'
alias timestamp='date -d "$date" +%s'
alias undo='undo.sh -i'
alias vn.='viewnior .'
alias vn='viewnior'
alias vp='vtop'
alias wfn='wait-for-net.sh'
alias wgetmir='wget --random-wait -r -e robots=off '
alias words="shuf -n 1000 /usr/share/dict/words | sed s/\'s// | tr '[:upper:]' '[:lower:]' | sort"
alias wtf='wtf.sh'
alias xfds='xfce4-display-settings'
alias yt2mp3='youtube-dl --extract-audio --audio-format mp3'
alias zh='zathura'


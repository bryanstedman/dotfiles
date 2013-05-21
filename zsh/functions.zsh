PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin:/Users/bstedman/Dropbox/bin
PATH=$HOME/code/lre/tools/lre:$PATH

# FUNCTIONS
bstack() { open "http://www.browserstack.com/start#os=Windows&os_version=$1&browser=IE&browser_version=$2.0&url=http%3A%2F%2F$3" ; }
gifify() {
  if [[ -n "$1" ]]; then
    if [[ $2 == '--good' ]]; then
      ffmpeg -i $1 -r 10 -vcodec png out-static-%05d.png
      time convert -verbose +dither -layers Optimize -resize 600x600\> out-static*.png  GIF:- | gifsicle --colors 128 --delay=5 --loop --optimize=3 --multifile - > $1.gif
      rm out-static*.png
    else
      ffmpeg -i $1 -s 600x400 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $1.gif
    fi
  else
    echo "proper usage: gifify <input_movie.mov>. You DO need to include extension."
  fi
}

svnuserlog() {
  svn log | sed -n "/$1/,/-----$/ p"
}

mkdircd() {
  command mkdir $1 && cd $1
}

mkcd() {
  command mkdir $1 && cd $1
}

cdf() {  # short for cdfinder
  cd "`osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)'`"
}

# keep this line near the end of your bash_profile
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi 
eval "$(rbenv init - zsh)"
sc() {
  cur_dir="$HOME/scratch"
  new_dir="$HOME/.tmp/scr-`date +'%s'`"
  mkdir -p $new_dir
  ln -nfs $new_dir $cur_dir
  cd $cur_dir
  echo "get to work!"
}


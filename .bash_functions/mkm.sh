mkm() {
  dirname=$1
  if [ -z "${dirname}" ]; then
    echo "Need a dirname" >&2
  else
    mkdir -p $dirname
    cd $dirname
  fi
}


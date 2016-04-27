addali() {
  desc="ADD DESCRIPTION..."

  if [ -n "$3" ]; then
    desc="$3"
  fi

  echo "" >> ~/.bash_aliases
  echo "###" >> ~/.bash_aliases
  echo "##

  $desc" >> ~/.bash_aliases
  echo "#" >> ~/.bash_aliases
  echo "" >> ~/.bash_aliases
  echo "alias '$1'='$2'" >> ~/.bash_aliases
  source ~/.bash_aliases
  echo "" && echo "- Alias added -" && echo ""
}


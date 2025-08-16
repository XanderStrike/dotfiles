serve() {
  podman run -p 1234:80 \
    -h web \
    -v $(pwd):/usr/share/nginx/html \
    jorgeandrada/nginx-autoindex
}

trim() {
  local var="$*"
  # remove leading whitespace characters
  var="${var#"${var%%[![:space:]]*}"}"
  # remove trailing whitespace characters
  var="${var%"${var##*[![:space:]]}"}"
  printf '%s' "$var"
}

forever() {
  while [ 1 ]; do
    echo
    $@
    sleep 0.25
  done
}
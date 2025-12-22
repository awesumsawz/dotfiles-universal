dssh() {
  if [ -z "$1" ]; then
    echo "Usage: dssh <container_name_or_id>"
    return 1
  fi

  docker exec -it "$1" /bin/bash 2>/dev/null || docker exec -it "$1" /bin/sh
}

gdisk_command() {
  local device=$1
  local cmd=$2

  debug gdisk_command "running gdisk command '${cmd}' on device ${device}"
  spawn "echo -en '${cmd}\nw\ny\n' | gdisk ${device}"
  local ret=$?

  debug gdisk_command "sleeping 3 seconds after gdisk to prevent EBUSY from previous run"
  sleep 3

  return ${ret}
}

create_disklabel() {
  echo "o\ny\nn\n128\n-32M\n\nef02\n"
}

add_partition() {
  local minor=$1
  local type=$2
  local size=$3
  echo "n\n${minor}\n\n+${size}\n${type}\n"
}

convert_to_mbr() {
  local device=$1
  gdisk_command ${device} "r\ng"

  partprobe

  debug convert_to_mbr "sleeping 3 seconds after partprobe"
  sleep 3
}

vimgolf() {
    local ID=$1
    local key=$2
    if [ -z $2 ]; then
        key=$VIM_GOLF_KEY
    fi
    docker run --rm  --net=host -it -e "key=[$VIM_GOLF_KEY]" kramos/vimgolf "$ID"
}

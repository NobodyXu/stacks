# mkdir and cd ~/.local/src
cd_local_src() {
    mkdir -p ~/.local/src
    cd ~/.local/src
}

clone_or_update() {
    local_repo="$1"
    remote_url="$2"

    if [ ! -d $local_repo ]; then
        git clone $remote_url $local_repo
    else
        cd $local_repo
        git fetch --all --tags --progress
        cd - # cd back to previous dir
    fi
}

# get_vesion accepts optional arguments for filtering tags
get_version() {
    [ -n "$1" ] && filter_command="$1" || filter_command=cat
    git tag -l | $filter_command | sort -V | tail -n 1
}

# checkout_latest_rel accepts optional arguments for filtering tags
checkout_latest_rel() {
    git checkout tags/$(get_version "$1")
}

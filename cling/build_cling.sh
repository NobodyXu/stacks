#!/bin/bash
#
# axel@cern.ch, 2014-02-07
# adapted from https://raw.githubusercontent.com/Axel-Naumann/cling-all-in-one/master/clone.sh

function detect_python() {
    # which is not ideal, see http://stackoverflow.com/a/677212/1392758
    
    python=`which python`
    if type python2 > /dev/null 2>&1; then
        python=`which python2`
    fi
}

function update {
    cd src || exit 1
    echo '++ Updating llvm...'
    git pull || exit 1
    cd tools/clang || exit 1
    echo '++ Updating clang...'
    git pull || exit 1
    echo '++ Updating cling...'
    cd ../cling || exit 1
    git pull || exit 1
    echo '++ Update done.'
    cd ../../..
}

function clone {
    # clone what branch where
    where=$3
    if [ "$where" = "" ]; then
        where=$1
    fi
    echo '>> Cloning '$1'...'
    git clone http://root.cern.ch/git/${1}.git $where || exit 1
    ( cd $where && git checkout $2 )
}

function initial {
    if [ -d inst ]; then
        echo '!! Directory inst/ exists; refusing to build / install!'
        exit 1
    fi

    clone llvm cling-patches src
    cd src/tools || exit 1
    clone clang cling-patches
    clone cling master
    cd ../..
}

function configure {
    mkdir -p obj || exit 1
    cd obj || exit 1
    echo '>> Configuring...'
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$1 -DPYTHON_EXECUTABLE=$python ../src || exit 1
    cd ..
}

function build {
    cd obj
    echo ':: Building...'
    make -j$cores || exit 1
    rm -rf ../inst
    echo ':: Installing...'
    make -j$cores install || exit 1
    echo ':: SUCCESS.'
    cd ..
}

function mk_prefix() {
    mkdir -p $1
    cd $1

    mkdir -p bin/ etc/ lib/ sbin/ share/ src/
}

main() {
    if [ "$USER" != "root" ]; then
        prefix=~/.local
        mk_prefix $prefix
    else
        prefix=/usr/local
    fi

    detect_python
    
    cores=$(nproc)
    #cores=`$python <(cat <<EOF
    #import multiprocessing
    #print (multiprocessing.cpu_count())
    #EOF
    #)`
    echo Using $cores cores.

    cd ${prefix}/src/
    mkdir cling
    cd cling

    if [ -d src ]; then
        # update mode
        update
    else
        initial
    fi
    
    if ! [ -e obj/Makefile ]; then
        configure $prefix
    fi
    
    build
    
    echo 'Run ./inst/bin/cling'
}

main

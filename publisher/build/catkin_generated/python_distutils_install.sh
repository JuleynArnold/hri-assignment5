#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/juleynarnold/hri/src"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/juleynarnold/hri/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/juleynarnold/hri/install/lib/python2.7/dist-packages:/home/juleynarnold/hri/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/juleynarnold/hri/build" \
    "/usr/bin/python" \
    "/home/juleynarnold/hri/src/setup.py" \
    build --build-base "/home/juleynarnold/hri/build" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/juleynarnold/hri/install" --install-scripts="/home/juleynarnold/hri/install/bin"

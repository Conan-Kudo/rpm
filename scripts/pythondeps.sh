#!/@unixroot/usr/bin/sh

[ $# -ge 1 ] || {
    #cat > /dev/null
    exit 0
}

case $1 in
-P|--provides)
    shift
    # Match buildroot/payload paths of the form
    #    /PATH/OF/BUILDROOT/usr/bin/pythonMAJOR.MINOR
    # generating a line of the form
    #    python(abi) = MAJOR.MINOR
    # (Don't match against -config tools e.g. /usr/bin/python2.6-config)
    sed -n -e "s|.*/usr/bin/python\(.\..\).*|python(abi) = \1|p"
    ;;
-R|--requires)
    shift
    # Match buildroot paths of the form
    #    /PATH/OF/BUILDROOT/usr/lib/pythonMAJOR.MINOR/  and
    #    /PATH/OF/BUILDROOT/usr/lib64/pythonMAJOR.MINOR/
    # generating a line of the form:
    #    python(abi) = MAJOR.MINOR
    sed -n -e "s|.*/usr/lib[^/]*/python\(.\..\)/.*|python(abi) = \1|p"
    ;;
esac

exit 0

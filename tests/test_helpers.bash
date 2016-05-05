TEST_FILE=$(basename $BATS_TEST_FILENAME .bats)

function launch {
    docker run --rm -it -v $(pwd):/files mbodenhamer/emacs:bats "$@"
}

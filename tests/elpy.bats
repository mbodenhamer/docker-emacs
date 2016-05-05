#!/usr/bin/env bats
load test_helpers

ELPY_IMAGE=emacs-onbuild-test-elpy

@test "[$TEST_FILE] Build Elpy image" {
    run docker build -t ${ELPY_IMAGE}:latest ${TEST_DIR}/elpy
    [ $status = 0 ]
}

@test "[$TEST_FILE] Check if Elpy is installed" {
    run docker run --rm -it -v ${TEST_DIR}/elpy:/files $ELPY_IMAGE \
        --batch test1.py -u root -f elpy-version
    [[ ${lines[2]} =~ "Elpy 1." ]]
}

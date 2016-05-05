#!/usr/bin/env bats
load test_helpers

TEST1_IMAGE=emacs-onbuild-test1

@test "[$TEST_FILE] Build Elpy image" {
    run docker build -t ${TEST1_IMAGE}:latest ${TEST_DIR}/test1
    [ $status = 0 ]
}

@test "[$TEST_FILE] Check if Elpy is installed" {
    run docker run --rm -it -v ${TEST_DIR}/test1:/files $TEST1_IMAGE \
        --batch test1.py -u root -f elpy-version
    [[ ${lines[2]} =~ "Elpy 1." ]]
}

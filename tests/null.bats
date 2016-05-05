#!/usr/bin/env bats
load test_helpers

NULL_IMAGE=emacs-onbuild-test-null

@test "[$TEST_FILE] Build null image" {
    run docker build -t ${NULL_IMAGE}:latest ${TEST_DIR}/null
    [ $status = 0 ]
}

@test "[$TEST_FILE] Check Emacs version" {
    run docker run --rm -it -v ${TEST_DIR}/null:/files $NULL_IMAGE \
        --version
    [[ ${lines[0]} =~ "GNU Emacs 24" ]]
}

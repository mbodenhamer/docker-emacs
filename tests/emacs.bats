#!/usr/bin/env bats
load test_helpers

@test "[$TEST_FILE] Check Emacs version" {
    run launch --version
    [[ ${lines[0]} =~ "GNU Emacs 24" ]]
}

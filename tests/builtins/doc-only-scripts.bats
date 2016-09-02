#! /usr/bin/env bats
#
# These scripts exist to provide help documentation and a uniform means of
# listing all builtin commands via a glob (to aid with 'go help builtins' and
# tab completion), but should never be executed, as their corresponding commands
# are implemented in the @go and environment functions.
#
# Though these scripts should never get executed, these tests ensure they fail
# loudly in case something goes wrong and they are.

load ../environment
load ../assertions
load ../script_helper

teardown() {
  remove_test_go_rootdir
}

@test "$SUITE: 'edit' script should exit with an error" {
  local expected="ERROR: \"$TEST_GO_SCRIPT edit\" "
  expected+='is implemented directly within the @go function.'

  create_test_go_script "_@go.source_builtin 'edit'"
  run "$BASH" "$TEST_GO_SCRIPT"
  assert_failure "$expected"
}

@test "$SUITE: 'run' script should exit with an error" {
  local expected="ERROR: \"$TEST_GO_SCRIPT run\" "
  expected+='is implemented directly within the @go function.'

  create_test_go_script "_@go.source_builtin 'run'"
  run "$BASH" "$TEST_GO_SCRIPT"
  assert_failure "$expected"
}

@test "$SUITE: 'unenv' script should exit with an error" {
  local expected="ERROR: \"$TEST_GO_SCRIPT unenv\" "
  expected+='is implemented in the function generated by '
  expected+="\"$TEST_GO_SCRIPT env\"."

  create_test_go_script "_@go.source_builtin 'unenv'"
  run "$BASH" "$TEST_GO_SCRIPT"
  assert_failure "$expected"
}

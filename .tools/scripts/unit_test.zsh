#!/usr/bin/env zsh
set -e


# regular prompt
pushd ~
got=$(git_prompt_info)
expected=""
popd

if [ "$got" != "$expected" ]; then
    echo "failed regular prompt"
    echo "\"$got\" <> \"$expected\""
    exit 1
fi


# git prompt
mkdir -p .git-prompt
pushd .git-prompt
git init >/dev/null 2>&1
git checkout -b master >/dev/null 2>&1
touch foo
git add foo
git config user.email "ci@localhost"
git config user.name "ci"
git commit -m "bar" >/dev/null 2>&1
got=$(git_prompt_info)
expected=" %{$fg[green]%}[%{$fg[cyan]%}master%{$fg[green]%}]"
popd
rm -rf .git-prompt

if [ "$got" != "$expected" ]; then
    echo "failed git prompt"
    echo "\"$got\" <> \"$expected\""
    git status
    exit 1
fi


# dirty git prompt
mkdir -p .git-prompt
pushd .git-prompt
git init >/dev/null 2>&1
git checkout -b master >/dev/null 2>&1
touch foo
git add foo
git config user.email "ci@localhost"
git config user.name "ci"
git commit -m "bar" >/dev/null 2>&1
touch bar
got=$(git_prompt_info)
expected=" %{$fg[green]%}[%{$fg[cyan]%}master%{$fg[green]%}]%{$fg[red]%}**"
popd
rm -rf .git-prompt

if [ "$got" != "$expected" ]; then
    echo "failed dirty git prompt"
    echo "\"$got\" <> \"$expected\""
    git status
    exit 1
fi


echo passed all tests!

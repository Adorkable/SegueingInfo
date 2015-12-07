#!/bin/sh

github_changelog_generator --no-verbose

checkFileUncommitted() {
	if git status --porcelain | grep -q $1; then
		echo "* $1 is dirty"
	    return 1
	else
		return 0
	fi
}

checkFileUncommitted "CHANGELOG.md"
result=$?

exit $result
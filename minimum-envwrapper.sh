#! /bin/sh -
#
# Copyright (c) 2020, Michael Monsivais
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
# 
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

lsvirtualenv() {
	if ! ls -1 "${WORKON_HOME:-${HOME}/.virtualenvs}"; then
		printf 'No virtualenvs found.' >&2
		return 1
	fi
}

mkvirtualenv() {
	if [ "$#" -lt 1 ]; then
		echo "Argument Required"
		return 1
	fi

	# Grab the last argument, which should be the virtualenv to create.
	i=1
	while [ "$i" -lt "$#" ]; do
		arg="$1"
		shift
		set -- "$@" "$arg"
		i=$((i=i+1))
	done
	VENV="$1"
	shift
	
	mkdir -p "${WORKON_HOME:-${HOME}/.virtualenvs}"
	python3 -m venv "$@" "${WORKON_HOME:-${HOME}/.virtualenvs}/$VENV"
	unset i VENV
}

rmvirtualenv() {
	if [ "$#" -lt 1 ]; then
		echo "Argument Required"
		return 1
	elif [ "$#" -gt 1 ]; then
		echo "Single argument Required"
		return 1
	fi
	VENV="$(basename "$1")"
	rm -rf "${WORKON_HOME:-${HOME}/.virtualenvs}/$VENV"
	unset VENV
}

workon() {
	if [ "$#" -lt 1 ]; then
		echo "Argument Required"
		return 1
	elif [ "$#" -gt 1 ]; then
		echo "Single argument Required"
		return 1
	fi
	. "${WORKON_HOME:-${HOME}/.virtualenvs}/$1/bin/activate"
}

#!/usr/bin/env bash
set -e

cd $(dirname $0)

if [ -z $1 ]; then
    echo "Usage: $(basename $0) <testname>"
    exit 1
fi

if [[ $1 == *.test ]]; then
    name=$1
else
    name="$1.test"
fi

cat << EOF > $name
/% TEST %/

function ${name%.*}() {
}

/% OUTPUT %/

[
    ("${name%.*}", [], Empty)
]

/% END %/
EOF
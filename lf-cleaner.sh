#!/bin/bash

cat <<EOF | paste -s -d '' > "$LF_FIFO_UEBERZUG"
{
"action": "remove",
"identifier": "lf-preview"
}
EOF

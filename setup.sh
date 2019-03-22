#!/usr/bin/bash
set -x
set -e

# pre setup for demos

makeDemo=$1

if [[ $makeDemo == "y" ]]; then
    # FIND DEMO
    echo "Setting up finding demo..."
    mkdir finding
    cd finding
    for newDir in {0..200}; do mkdir secretDir_$newDir; done
    for sd in ./secretDir_*/; do for i in {0..100}; do touch ${sd}awpogeijaspe$i;done ;done
    touch ./secretDir_42/secretfile.txt
    cd ../

    # AWK and SED demos
fi




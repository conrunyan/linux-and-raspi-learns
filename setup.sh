#!/usr/bin/bash
set -e

# pre setup for demos

makeDemo=$1

if [[ $makeDemo == "y" ]]; then
    # FIND DEMO
    echo "Setting up finding demo..."
    mkdir -p finding
    cd finding
    for newDir in {0..200}; do mkdir secretDir_$newDir; done
    for sd in ./secretDir_*/; do for i in {0..100}; do touch ${sd}awpogeijaspe$i;done ;done
    touch ./secretDir_42/secretfile.txt
    cd ../

    # AWK and SED demos
    echo "Pulling data for awk and sed demos"
    mkdir -p awksed && cd awksed
    pwd
    mkdir -p alice
    mkdir -p crimes
    wget https://www.gutenberg.org/files/11/11.txt -O ./alice/alice_in_wonderland.txt
    wget http://samplecsvs.s3.amazonaws.com/SacramentocrimeJanuary2006.csv -O ./crimes/cali_crimes.txt
    # fix crime data
    sed -i 's/\r/\n/g' ./crimes/cali_crimes.txt
    cd ..
    pwd
fi

# Normal user setup

# setup basic structure of challenge one
echo "Setting up challenge one"
mkdir challenge_one
cd challenge_one
for newDir in {0..4}; do mkdir directory_$newDir; done
for d in ./directory_*/; do for f in a b c d e f g h; do touch ${d}${f}.txt; done ;done
echo "th3s3cr3tp4ssw0rd" > directory_3/secretFile.txt
cd ..

# setup structure for challenge two
echo "Setting up challenge two"
mkdir challenge_two

# setup structure for challenge three 
echo "Setting up challenge three"
mkdir challenge_three
cd challenge_three
wget http://samplecsvs.s3.amazonaws.com/SacramentocrimeJanuary2006.csv -O ./cali_crimes.txt
echo "Making challenge three dirs..."
for newDir in {0..200}; do mkdir secretDir_$newDir; done
echo "Copying datasets..."
for sd in ./secretDir_*/; do echo "In dir: ${sd}" && for i in {0..20}; do cp ./cali_crimes.txt ${sd}cali_crimes_$i.txt;done ;done

echo "th3s3cr3tp4ssw0rd" >> secretDir_42/cali_crimes7.txt
cd ..



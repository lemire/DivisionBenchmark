cc --version

cd code

echo "codesize"
cd codesize
make
cd .. 

cd benches
echo "simplified_primes_benches.sh"
./simplified_primes_benches.sh
cd ..

cd collatzbenches
echo "collatzbenches"
./timerun.sh
cd ..

echo "hashbenches"
cd hashbenches
./time_hash_benches.sh
cd ..

echo "dynhashbenches"
cd dynhashbenches
./time_dynhash_benches.sh
cd ..

echo "signeddynhashbenches"
cd signeddynhashbenches
./time_dynhash_benches.sh
cd ..


echo "signedhashbenches"
cd signedhashbenches
./time_hash_benches.sh
cd ..

for file in `find . -type f -name \*.s` ;  do echo $file; cat $file ; done

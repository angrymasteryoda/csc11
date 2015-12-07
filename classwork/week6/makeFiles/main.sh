echo "Hello $USER. we are going to run main"
echo "Today is $(date)"
echo "current working directory : $(pwd)"
rm -vf *.o
./main; echo $?

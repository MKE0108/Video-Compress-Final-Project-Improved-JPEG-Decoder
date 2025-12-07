#test testing speed

start_time=$(date +%s%N)
#without output in terminal
taskset -c 0 time ./jpeg_decoder/build/jpeg_decoder test.jpg > /dev/null
end_time=$(date +%s%N)
elapsed=$((end_time - start_time))
echo "Elapsed time: $((elapsed / 1000000)) ms"


start_time=$(date +%s%N)
taskset -c 0 time ./jpeg_decoder_old/build/jpeg_decoder test.jpg > /dev/null
end_time=$(date +%s%N)
elapsed=$((end_time - start_time))
echo "Elapsed time: $((elapsed / 1000000)) ms"

#ffmpeg -vframes 1 -i test.jpg /dev/null
start_time=$(date +%s%N)
taskset -c 0 time ffmpeg -vframes 1 -i test.jpg -f bmp test.bmp > /dev/null 2>&1
end_time=$(date +%s%N)
elapsed=$((end_time - start_time))
echo "Elapsed time: $((elapsed / 1000000)) ms"
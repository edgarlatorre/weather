cmd="bin/unicorn"

if [ ! -f tmp/unicorn.pid ]; then
  echo "Staring weather"
  $cmd -p 3000 -E production -D -c config/unicorn.rb
else
  echo "Restaring weather"
  pid=`cat tmp/unicorn.pid`
  echo "PID: $pid"
  kill $pid
  $cmd -p 3000 -E production -D -c config/unicorn.rb
fi

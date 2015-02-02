if ENV["RAILS_ENV"] == "development"
  #Worker processes
  worker_processes 1
else
  #Set the working application directory
  #working_directory "/home/app/alpha_outlet"
  ## Unicorn PID file location
  #pid "/home/app/alpha_outlet/pids/unicorn.pid"
  ##Logs
  #stderr_path "/home/app/alpha_outlet/log/unicorn.log"
  #stdout_path "/home/app/alpha_outlet/log/unicorn.log"
  ##Sockets
  #listen "/tmp/unicorn.alpha_outlet.sock"
  #listen "/tmp/unicorn.alpha_outlet.sock"
  #Worker processes
  worker_processes 4
end

# Time-out
timeout 30

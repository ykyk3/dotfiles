function rclone
  for repo in $argv
    git clone https://github.com/Nikkei/$repo
  end
end
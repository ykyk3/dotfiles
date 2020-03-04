function rlink
  for repository in $argv
    yarn link @nikkei/$repository
  end
end
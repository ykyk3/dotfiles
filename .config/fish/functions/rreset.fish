function rreset
  rm -rf node_modules
  yarn
  rlink (cat link-repos)
  yarn start-dev
end
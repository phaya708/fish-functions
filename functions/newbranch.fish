function newbranch
  set branch_name (git branch |  grep '*' | sed 's/* //')
  echo $branch_name
  if test "$branch_name" = "main"; or test "$branch_name" = "master"
    git switch -c $argv[1]
    return 0
  else
    echo -e "\033[1;31mYou are not in main or master branch\033[0m"
    set confirm (read -P "Do you want to create a new branch from $branch_name? (y/n)" -l -n 1)
    if [ "$confirm" = "y" ]
      git switch -c $argv[1]
    else
      return 1
    end
  end
end
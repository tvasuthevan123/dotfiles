function __fish_repos_completions
    set -l repos_dir ~/Documents/Zoe/
    if test -d "$repos_dir"
        for i in $repos_dir*
            if test -d "$i"
                basename "$i"
            end
        end
    end
end

complete -c repos -f -a "(__fish_repos_completions)"

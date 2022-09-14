function mkdd -d "Make data directory for today and change to it"
    if test (count $argv) -ne 1
        echo "Specify a name" >&2
    else
        set -l today (date +"%Y-%m-%d")
        set -l dir ~/Data/$today-$argv[1]
        mkdir --parents $dir
        cd $dir
    end
end


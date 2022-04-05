function venv -d "Activate Python virtual environment"
    if test (count $argv) -eq 1
        source "$argv[1]/venv/bin/activate.fish"
    else
        source "venv/bin/activate.fish"
    end
end


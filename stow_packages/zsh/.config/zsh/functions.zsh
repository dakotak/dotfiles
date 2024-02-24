
# TODO: Display a shorter path in FZF instead of the full path
function repo() {
    # Verify the local REPO_DIRS array exists
    if [[ -z $REPO_DIRS ]]; then
        echo "REPO_DIRS array is not defined"
        return 1
    fi

    REPO=$(find ${REPO_DIRS[@]} \
        -maxdepth ${REPO_SEARCH_MAXDEPTH:-3} \
        -mindepth 1 \
        -type d \
        -execdir test -d {}/.git \; \
        -prune \
        -print \
        | xargs grealpath --relative-to=$HOME \
        | fzf --preview='cat ~/{}/README.md | gum format --type=markdown'
    )

    if [[ -z $REPO ]]; then
        echo "No repo selected"
        return 1
    fi

    # Run the comamnd with the selected repo
    $1 $REPO
}


# https://stackoverflow.com/questions/46721797/how-to-change-the-terminal-title
function title() {
    # Set the terminal title
    echo -ne "\033]0;$1\007"
}

# Activate a vitual environment in the current directory
# If the virtual environment does not exist it will be created then activated
# First argument is the name of the virtual environment, default is .venv
function venv {
    VENV=${1:-.venv}
    # Create the venv if it does not exist
    if [[ ! -d $VENV ]]; then
        echo "Creating new Python virtual environment ($VENV)"
        python3 -m venv $VENV
    fi
    # Activate the virtual env
    echo "Activating Python virtual environement ($VENV)"
    source $VENV/bin/activate
}


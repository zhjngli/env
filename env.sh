#!/bin/zsh

usage() {
    GIT_OPTION="[g|git]"
    VIMRC_OPTION="[vrc|vimrc]"
    ZSHTHEME_OPTION="[zth|zsh-theme]"
    ZSHRC_OPTION="[zrc|zshrc]"
    ENV_OPTIONS="$GIT_OPTION $VIMRC_OPTION $ZSHRC_OPTION $ZSHTHEME_OPTION"

    echo "Installs env files by creating symlinks"
    echo "\t-h|--help"
    echo "\t-i|--install $ENV_OPTIONS"
}

smart_link() {
    echo "Trying to create symlink: \"$2\" -> \"$1\""

    if [ -e "$2" ]; then
        if [ -L "$2" ]; then
            echo "Skipping: \"$2\" is already a symlink."
        else
            echo "Skipping: \"$2\" already exists."
        fi
        echo "  To override, run: ln -sf \"$1\" \"$2\""
        return
    fi

    mkdir -p "$(dirname "$2")"
    ln -s "$1" "$2"
    echo "Created symlink: \"$2\" -> \"$1\""
}

run_installers() {
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
    INSTALLERS_DIR="$SCRIPT_DIR/installers"

    echo "Running installer scripts..."
    for installer in $(ls "$INSTALLERS_DIR"/*.sh 2>/dev/null | sort); do
        if [ -f "$installer" ]; then
            echo "Running $(basename "$installer")..."
            "$installer"
        fi
    done
}

link_dotfiles() {
    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

    while [ "$1" != "" ]; do
        case $1 in
            g | git)
                smart_link "$SCRIPT_DIR/gitconfig" "$HOME/.gitconfig"
                ;;
            vrc | vimrc)
                smart_link "$SCRIPT_DIR/vimrc" "$HOME/.vimrc"
                ;;
            zth | zsh-theme)
                smart_link "$SCRIPT_DIR/zli.zsh-theme" "$HOME/.oh-my-zsh/themes/zli.zsh-theme"
                ;;
            zrc | zshrc)
                smart_link "$SCRIPT_DIR/zshrc" "$HOME/.zshrc"
                ;;
            *)
                echo "WARNING: Skipping unknown installation option \"$1\""
                ;;
        esac
        shift
    done
}

if [ "$1" != "" ]; then
    case $1 in
        -h | --help)
            usage
            exit
            ;;
        -i | --install)
            run_installers
            link_dotfiles ${@:2}
            exit
            ;;
        *)
            echo "ERROR: unknown parameter \"$1\""
            usage
            exit 1
            ;;
    esac
fi


#!/bin/zsh

usage() {
    GIT_OPTION="[g|git]"
    VIMRC_OPTION="[vrc|vimrc]"
    ZSHTHEME_OPTION="[zth|zsh-theme]"

    ENV_OPTIONS="$GIT_OPTION $VIMRC_OPTION $ZSHTHEME_OPTION"

    echo "Installs or retrieves some env files"
    echo "./$0 -h|--help"
    echo "./$0 -i|--install $ENV_OPTIONS"
    echo "./$0 -r|--retrieve $ENV_OPTIONS"
}

smart_cp() {
    case $ENV_SETUP in
        install)
            CURRENT_INSTALL_BAK="$PWD/$(basename $1).install.bak"
            echo "Saving \"$2\" to \"$CURRENT_INSTALL_BAK\" before overwriting with \"$1\"."
            cp "$2" "$CURRENT_INSTALL_BAK"
            cp "$1" "$2"
            ;;
        retrieve)
            CURRENT_ENV_BAK="$1.bak"
            echo "Saving \"$1\" to \"$CURRENT_ENV_BAK\" before overwriting with \"$2\"."
            echo "You have git though, you don't have to be afraid here."
            cp "$1" "$CURRENT_ENV_BAK"
            cp "$2" "$1"
            set +x
            ;;
        *)
            echo ERROR: I expected "install" or "retrieve". Failing
            exit 1
            ;;
    esac
}

env_setup() {
   while [ "$1" != "" ]; do
        case $1 in
            g | git)
                smart_cp $PWD/gitconfig $HOME/.gitconfig
                ;;
            vrc | vimrc)
                smart_cp $PWD/vimrc $HOME/.vimrc
                ;;
            zth | zsh-theme)
                smart_cp $PWD/zli.zsh-theme $HOME/.oh-my-zsh/themes/zli.zsh-theme
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
            ENV_SETUP="install"
            env_setup ${@:2}
            exit
            ;;
        -r | --retrieve)
            ENV_SETUP="retrieve"
            env_setup ${@:2}
            exit
            ;;
        *)
            echo "ERROR: unknown parameter \"$1\""
            usage
            exit 1
            ;;
    esac
fi


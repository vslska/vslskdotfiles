if status is-interactive

    ####################### Init #################################
    # --------- Fzf ---------------------
    if type -q fzf
        fzf --fish | source
    end
    
    fzf_configure_bindings --directory=ctrl-f --processes=ctrl-alt-p --git_log=ctrl-alt-g --git_status=ctrl-g

    # ---------- Atuin ------------------
    if type -q atuin
        atuin init fish | source
    end

    # --------- zoxide ------------------
    zoxide init fish | source

    ###################### Function #############################
    # ------------ yazi ----------------------------------------
    function y
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        command yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end

    # --------- ЗАЩИТА АВТОДОПОЛНЕНИЯ KUBECTL ------------------------
    function kubectl
        if string match -q "*__kubecompletions*" (status stack-trace)
            command kubectl $argv
        else if type -q kubecolor
            kubecolor $argv
        else
            command kubectl $argv
        end
    end

    ##################### aliases #################################
    alias cl="clear"

    # ------------ bat --------------------------------------------
    if type -q bat
        alias cat="bat"
    end

    # -------------- ripgrep --------------------------------------
    if type -q rg
        alias grep="rg --smart-case"
    end

    #-------------- EZA -------------------------------------------
    if type -q eza
        alias ls="eza --icons=always --color=always --group-directories-first"
        alias ll="eza -lah --icons=always --color=always --group-directories-first --git --header"
        alias lt="eza --tree --level=2 -a --icons=always --color=always --group-directories-first"
        alias tree="eza --tree --level=4 -a --icons=always --color=always --group-directories-first"
    end

    # ------------ zoxide -----------------------------------------
    abbr -a cd 'z'

    # --- nvim ---
    abbr -a nv 'nvim'
    abbr -a vim 'nvim'

    # ---------- pomodoro -----------------------------------------
    abbr -a pomo 'pomo start -d 50m -p 2 "концентрация"'

    # ---------- kubectl / kubecolor --------------------------------
    abbr -a k "kubectl"
    abbr -a kapp "kubectl apply"
    abbr -a kget "kubectl get"
    abbr -a kdes "kubectl describe"

    # автодополнения: kubectl определён как функция → complete работает
    complete -c kubectl -w kubectl
    if type -q kubecolor
        complete -c kubecolor -w kubectl
    end

end

## ====================== Themes ====================================
# -------- FZF (Catppuccin Macchiato) -----
set -gx FZF_DEFAULT_OPTS "\
--color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5"

# -------- BAT (Catppuccin Macchiato) --------
set -gx BAT_THEME "Catppuccin Macchiato"

# -------- Fish theme: Catppuccin Macchiato --------
set -g fish_color_autosuggestion 6e738d
set -g fish_color_cancel ed8796
set -g fish_color_command 8aadf4
set -g fish_color_comment 8087a2
set -g fish_color_cwd eed49f
set -g fish_color_cwd_root
set -g fish_color_end f5a97f
set -g fish_color_error ed8796
set -g fish_color_escape ee99a0
set -g fish_color_gray 6e738d
set -g fish_color_history_current
set -g fish_color_host 8aadf4
set -g fish_color_host_remote a6da95
set -g fish_color_keyword c6a0f6
set -g fish_color_normal cad3f5
set -g fish_color_operator f5bde6
set -g fish_color_option a6da95
set -g fish_color_param f0c6c6
set -g fish_color_quote a6da95
set -g fish_color_redirection f5bde6
set -g fish_color_search_match --background=363a4f
set -g fish_color_selection --background=363a4f
set -g fish_color_status ed8796
set -g fish_color_user 8bd5ca
set -g fish_color_valid_path
set -g fish_pager_color_completion cad3f5
set -g fish_pager_color_description 6e738d
set -g fish_pager_color_prefix f5bde6
set -g fish_pager_color_progress 6e738d
set -g fish_pager_color_selected_background --background=363a4f

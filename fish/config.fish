if status is-interactive

    # --- ТЕМА ОФОРМЛЕНИЯ ---
    fish_config theme choose "Catppuccin Macchiato"

    # --- ЗАЩИТА АВТОДОПОЛНЕНИЯ KUBECTL ---
    # Перенаправляем вывод в kubecolor, 
    # но отдаем чистый бинарник, если запрос идет от скрипта автодополнения.
    function kubectl
        if string match -q "*__kubecompletions*" (status stack-trace)
            command kubectl $argv
        else if type -q kubecolor
            kubecolor $argv
        else
            command kubectl $argv
        end
    end

    # --- ПОИСК И ИСТОРИЯ (fzf + Atuin) ---
    # fzf инициализируется первым
    if type -q fzf
        fzf --fish | source
    end

    # Atuin инициализируется вторым, чтобы гарантированно перехватить Ctrl+R и стрелку Вверх
    if type -q atuin
        atuin init fish | source
    end

    # --- ОБЩИЕ АЛИАСЫ, EZA, TREE, RIPGREP И BAT ---
    alias cl="clear"
    
    # Замена cat на bat для красивого вывода файлов с подсветкой
    if type -q bat
        alias cat="bat"
    end

    # Замена grep на ripgrep (rg) для сверхбыстрого поиска
    if type -q rg
        alias grep="rg --smart-case"
    end
    # Замена ls и lt на eza 
    if type -q eza
        alias ls="eza --icons=always --color=always --group-directories-first"
        alias ll="eza -lah --icons=always --color=always --group-directories-first --git --header"
        alias lt="eza --tree --level=2 -a --icons=always --color=always --group-directories-first"
        alias tree="eza --tree --level=4 -a --icons=always --color=always --group-directories-first"
    else
        # Запасной вариант без eza
        alias ll="ls -lah"
        if type -q tree
            alias lt="tree -a -L 2"
        end
    end
    # --- zoxide ---
    abbr -a cd 'z'
    # --- УТИЛИТА ПОМОДОРО ---
    abbr -a pomo 'pomo start -d 50m -p 2 -t my-project "концентрация"'

    # --- СОКРАЩЕНИЯ KUBECTL & KUBCOLOR ---
    # Разворачиваем сокращения в "kubectl", чтобы плагин автодополнения (fish-kubecompletions)
    # всегда понимал контекст и выдавал подсказки для подов/ресурсов.
    if type -q kubecolor
        abbr -a k "kubectl"
        abbr -a kubapp "kubectl apply"
        abbr -a kubget "kubectl get"
        abbr -a kubdes "kubectl describe"
        
        # На всякий случай копируем логику автодополнения для самого слова kubecolor
        complete -c kubecolor -w kubectl
    else
        # Запасной вариант, если kubecolor не установлен в системе
        abbr -a k "kubectl"
        abbr -a kubapp "kubectl apply"
        abbr -a kubget "kubectl get"
        abbr -a kubdes "kubectl describe"
    end

    # Принудительно связываем букву 'k' с автодополнением от kubectl, 
    # чтобы Tab работал мгновенно (еще до раскрытия аббревиатуры пробелом)
    complete -c k -w kubectl

end

# --- ГЛОБАЛЬНЫЕ ПЕРЕМЕННЫЕ ОКРУЖЕНИЯ И ПУТИ ---
set -g CDPATH . /home/vslska/my

# Тема для FZF (Catppuccin Macchiato)
set -gx FZF_DEFAULT_OPTS "\
--color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5"

# Тема для BAT (Catppuccin Macchiato)
set -gx BAT_THEME "Catppuccin Macchiato"

# --- ФУНКЦИЯ ДЛЯ ФАЙЛОВОГО МЕНЕДЖЕРА YAZI ---
function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    command yazi $argv --cwd-file="$tmp"
    if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

zoxide init fish | source

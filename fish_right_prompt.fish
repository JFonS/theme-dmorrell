
function get_git_status -d "Gets the current git status"
  if command git rev-parse --is-inside-work-tree >/dev/null 2>&1
    set -l ref (command git describe --tags --exact-match ^/dev/null ; or command git symbolic-ref --short HEAD 2> /dev/null ; or command git rev-parse --short HEAD 2> /dev/null)

    set -l new (command git status --porcelain=v1 --ignore-submodules=dirty \
                | grep -e '^ \?A' | wc -l)
    set -l mod (command git status --porcelain=v1 --ignore-submodules=dirty \
                | grep -e '^ \?M' | wc -l)
    set -l del (command git status --porcelain=v1 --ignore-submodules=dirty \
                | grep -e '^ \?D' | wc -l)
    set -l stashed (command git stash list --no-decorate \
                | wc -l)

    # set -g fish_emoji_width 2
    set light 555

    set_color -b normal

    set_color $light
    if [ "$new" != "0" ]
      set_color 0a0
    end
    echo "$new⚹  "

    set_color $light
    if [ "$mod" != "0" ]
      set_color ddc203
    end
    echo "$mod↺  "

    set_color $light
    if [ "$del" != "0" ]
      set_color a00
    end
    echo "$mod""🗴 "

    set_color $light
    if [ "$stashed" != "0" ]
      set_color white
    end
    echo "$stashed🗄 "

    set_color -b $light
    # TODO: make red if merging/rebasing/detached
    set_color white
    echo " $ref "
    set_color normal
   end
end

function fish_right_prompt -d "Prints right prompt"
  get_git_status
end

# robbyrussel
function _git_branch_name
    echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function _is_git_dirty
    echo (command git status -s --ignore-submodules=dirty ^/dev/null)
end

function fish_prompt --description 'Write out the prompt'

    set -l last_status $status
    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -l red (set_color -o red)
    set -l blue (set_color -o blue)
    set -l green (set_color -o green)
    set -l normal (set_color normal)

    if [ (_git_branch_name) ]
        set -l git_branch $red(_git_branch_name)
        set git_info "$blue git:($git_branch$blue)"

        if [ (_is_git_dirty) ]
           set -l dirty "$yellow ✗"
           set git_info "$git_info$dirty"
        end
    end

	# Just calculate these once, to save a few cycles when displaying the prompt
	if not set -q __fish_prompt_normal
		set -g __fish_prompt_normal (set_color normal)
	end
	
    switch $USER
        case root
            if not set -q __fish_prompt_cwd
                if set -q fish_color_cwd_root
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
                else
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
                end
            end

        case '*'
            if not set -q __fish_prompt_cwd
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end
    end

     set -l delim " $green➜"
     set -l prompt_status
	if test $last_status -ne 0
		if not set -q __fish_prompt_status
			set -g __fish_prompt_status (set_color $fish_color_status)
		end
		set prompt_status "$__fish_prompt_status [$last_status]$__fish_prompt_normal"
	     set delim " $red➜"
	end

	echo -n -s "$__fish_prompt_cwd" (prompt_pwd) "$git_info" "$prompt_status" "$delim" ' '
end

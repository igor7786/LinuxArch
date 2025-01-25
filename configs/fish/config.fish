if status is-interactive
	# Commands to run in interactive sessions can go here
	#Dracula theme
	fish_config theme choose "Dracula Official"

	#Show hidden files
	set fzf_fd_opts --hidden --max-depth 5
    function rfish
        source ~/.config/fish/config.fish
    end
    # Extract archives
	function unpack
		if test -z "$argv[1]"
			echo "Usage: unpack <file>"
			return 1
		end

		switch "$argv[1]"
			case '*.tar.bz2'
				tar xjf "$argv[1]"  # Extract tar.bz2
			case '*.tar.gz'
				tar xzf "$argv[1]"  # Extract tar.gz
			case '*.tar.xz'
				tar xJf "$argv[1]"  # Extract tar.xz
			case '*.bz2'
				bunzip2 "$argv[1]"  # Extract bz2
			case '*.rar'
				unrar x "$argv[1]"  # Extract rar
			case '*.gz'
				gunzip "$argv[1]"   # Extract gz
			case '*.tar'
				tar xf "$argv[1]"   # Extract tar
			case '*.tbz2'
				tar xjf "$argv[1]"  # Extract tbz2
			case '*.tgz'
				tar xzf "$argv[1]"  # Extract tgz
			case '*.zip'
				unzip "$argv[1]"    # Extract zip
			case '*.Z'
				uncompress "$argv[1]" # Extract Z
			case '*.7z'
				7z x "$argv[1]"     # Extract 7z
			case '*.xz'
				unxz "$argv[1]"     # Extract xz
			case '*'
				echo "'$argv[1]' cannot be extracted via unpack()"
		end
	end
	# List files
	function ll
		exa --icons -abghHliS
	end
	function cc
		clear
	end
	# Remove a file or directory
	function rr
		if test (count $argv) -eq 0
			echo "Usage: rr <file-or-directory>"
			return 1
		end

    # Check if the file or directory exists
		if test -e $argv[1]
			sudo rm -rf $argv[1]
			echo "$argv[1] has been successfully deleted"
		else
			echo "Error: $argv[1] does not exist"
			return 1
		end

	end
	#Git
	function g
    git $argv
    end

    function gbs
        git switch $argv
    end

    function gbm
        git branch -M $argv
    end

    function gc
        git commit -v $argv
    end

    function gca
        git commit -v -a $argv
    end

    function gd
        git diff | mate
    end

    function gl
        git pull $argv
    end

    function gp
        git push $argv
    end
    function gm
        git merge $argv
    end

    function gss
        git status --short
    end
    function gl
        git log --oneline --graph --decorate --all
    end
end

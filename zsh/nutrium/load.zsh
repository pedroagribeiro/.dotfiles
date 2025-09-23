function manage_nutrium_aliases() {
    if [[ "$PWD" == "$HOME/Code/healthium/nutrium" ]]; then
        alias rspec="docker exec -ti nutrium-web bundle exec rspec" 
	alias feature="docker exec -ti nutrium-web xvfb-run -a bundle exec rspec"
    else
	unalias rspec 2>/dev/null
	unalias feature 2>/dev/null
    fi
}

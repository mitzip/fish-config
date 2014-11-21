function catch -d "fish for domains from the command line"
	if test ! -x /tmp/JSON.sh
		curl -s -S -L https://raw.githubusercontent.com/dominictarr/JSON.sh/master/JSON.sh > /tmp/JSON.sh
		chmod +x /tmp/JSON.sh
	end
	curl -s -S -L "https://domainr.com/api/json/search?client_id=domain_fisher&q=$argv" | /tmp/JSON.sh -b | grep --color -B 2 -A 1 '"available"'
end


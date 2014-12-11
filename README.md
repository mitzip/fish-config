fish-config
==============

### config.fish

1. Run byobu, if found
2. Add ~/.local/bin to path, if found
3. Update self, if needed

### functions/

* autofish.fish - Update self from whatever branch it's on, runs on login
 * USAGE: `autofish`
* catch.fish - Check domain name availability with domai.nr from the command line
 * USAGE: catch <domain w/ or w/o tld>
 * EXAMPLE: `catch example`
 * EXAMPLE: `catch example.com`
* dpaste.fish - Pipe STDIN to dpaste.com
 * USAGE: dpaste <expire in days> <syntax to hilight>
 * EXAMPLE: `cat /etc/passwd | dpaste 1 bash`
* findfun.fish - Search for a Funtoo Linux package in all repos Funtoo pulls from
 * USAGE: findfun <package or ebuild>
 * EXAMPLE: `findfun dev-db/mongodb`
 * EXAMPLE: `findfun dev-db/mongodb/mongodb-2.4.6-r1.ebuild`
* fish_prompt.fish - Custom fish prompt, run automatically by fish
* funtooize.fish - Sanitize Gentoo ebuilds and Manifests to Funtoo spec, recursively
 * USAGE: funtooize <path>
 * EXAMPLE: `funtooize # uses current directory`
 * EXAMPLE: `funtooize /path/to/overlay`
* getgen.fish - Grab latest Gentoo-x86 ebuilds from Gentoo CVS
 * USAGE: getgen <package or ebuild>
 * EXAMPLE: `getgen dev-db/mongodb`
 * EXAMPLE: `getgen dev-db/mongodb/mongodb-2.4.6-r1.ebuild`
* gittyup.fish - Perform a `git up` in every git repo with remotes in a directory
 * USAGE: gittyup <path>
 * EXAMPLE: `gittyup # uses current directory`
 * EXAMPLE: `gittyup /path/to/lots/of/git/repos`
* lf.fish - List all available repos at git.funtoo.org
 * USAGE: `lf`
* showcert.fish - Show SSL certificate of remote host
 * USAGE: `showcert google.com`
* uniqwords.fish - Get a list of unique words from STDIN to STDOUT
 * USAGE: `cat <text data> | uniqwords`
 * EXAMPLE: `cat AV1611Bible.txt | uniqwords > allthewords.txt`
* upapt.fish - Fully update a box using the APT package manager (Ubuntu, Debian, etc)
 * USAGE: `upapt`
* upworld.fish - Fully update a box using the Portage package manager (Funtoo, Gentoo, etc)
 * USAGE: `upworld`

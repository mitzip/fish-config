function getgen -a ebuild -d 'Get ebuild(s) from gentoo-x86 csv'
    cvs -d :pserver:anonymous@anoncvs.gentoo.org:/var/cvsroot export -D(date '+%Y-%m-%d')" gentoo-x86/$ebuild
end


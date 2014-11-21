function findfun -a ebuild -d 'Find which repo a funtoo package comes fom.'
    if test -z $ebuild
        echo "USAGE: findfun dev-db/mongodb"
        echo "Cannot search for individual ebuilds"
        return 1
    end

    echo "\n=== Gentoo CVS ===" # Probably need cvs 1.12+
    cvs -d :pserver:anonymous@anoncvs.gentoo.org:/var/cvsroot rls gentoo-x86/$ebuild

    echo "\n=== funtoo-overlay ==="
    svn ls https://github.com/funtoo/funtoo-overlay/trunk/$ebuild

    echo "\n=== foo-overlay ==="
    svn ls https://github.com/slashbeast/foo-overlay/trunk/$ebuild

    echo "\n=== bar-overlay ==="
    svn ls https://github.com/adessemond/bar-overlay/trunk/$ebuild

    echo "\n=== funtoo-media ==="
    svn ls https://github.com/funtoo/funtoo-media/trunk/$ebuild

    echo "\n=== causelay ==="
    svn ls https://github.com/causes-/causelay/trunk/$ebuild

    echo "\n=== bliss-overlay ==="
    svn ls https://github.com/fearedbliss/bliss-overlay/trunk/$ebuild

    echo "\n=== squeezebox ==="
    rm -Rf /tmp/findfun_squeezebox
    git clone --quiet --depth 1 --branch master git://git.overlays.gentoo.org/user/squeezebox.git /tmp/findfun_squeezebox
    ls -w 1 /tmp/findfun_squeezebox/$ebuild
    rm -Rf /tmp/findfun_squeezebox

    echo "\n=== Gentoo Progress ==="
    svn ls https://gentoo-progress.googlecode.com/svn/overlays/progress/$ebuild

    echo "\n=== funtoo-plex ==="
    svn ls https://github.com/Ghent/funtoo-plex/trunk/$ebuild

    echo "\n=== Sabayon ==="
    svn ls https://github.com/Sabayon/for-gentoo/trunk/$ebuild

    echo "\n=== funtoo-gnome-overlay ==="
    svn ls https://github.com/funtoo/funtoo-gnome-overlay/trunk/$ebuild

    echo "\n=== funtoo-toolchain-overlay ==="
    svn ls https://github.com/funtoo/funtoo-toolchain-overlay/trunk/$ebuild

    echo "\n=== funtoo-mysql ==="
    svn ls https://github.com/funtoo/funtoo-mysql/trunk/$ebuild

    echo "\n=== funtoo-ldap-overlay ==="
    svn ls https://github.com/funtoo/funtoo-ldap-overlay/trunk/$ebuild

    echo "\n=== funtoo-deadbeef ==="
    svn ls https://github.com/damex/funtoo-deadbeef/trunk/$ebuild

    echo "\n=== funtoo-redhat ==="
    svn ls https://github.com/damex/funtoo-redhat/trunk/$ebuild

    echo "\n=== funtoo-wmfs ==="
    svn ls https://github.com/damex/funtoo-wmfs/trunk/$ebuild

    echo "\n=== faustoo ==="
    svn ls https://github.com/fmoro/faustoo/trunk/$ebuild

    echo "\n=== sera ==="
    rm -Rf /tmp/findfun_sera
    git clone --quiet --depth 1 --branch master git://git.overlays.gentoo.org/dev/sera.git /tmp/findfun_sera
    ls -w 1 /tmp/findfun_sera/$ebuild
    rm -Rf /tmp/findfun_sera
end

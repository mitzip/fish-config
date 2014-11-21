function funtooize -a search_path -d 'Funtooize all ebuilds'
    if test -z $search_path
       set search_path '.'
    end

    find $search_path -type f -exec sed -i -e '/^# Copyright\|^# \$Header/d' \{\} +
    find $search_path -type f -name "ChangeLog*" -delete
    find $search_path -type f -name '*.ebuild' -exec env DISTDIR=/tmp ebuild \{\} manifest \;
end

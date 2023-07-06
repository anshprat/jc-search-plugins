set -x
basepath=~/tmp
today=$(date +%Y.%m%d.%H%M.%S|sed -e 's/\.0/\./g')
basefolder="$basepath/${today}"
srcfolder="$basefolder/jc-search-plugin"
files="content_script.js icon.png manifest.json styles.css"


update_tmpl() {
    sed -e "s/APPVERSION/${today}/" \
    -e "s/BROWSER_SPECIFIC_SETTINGS/$BROWSER_SPECIFIC_SETTINGS/" \
    -e "s/BROWSER_MANIFEST_VERSION/$BROWSER_MANIFEST_VERSION/" \
    manifest.json.tpl |jq > manifest.json
}


mkdir -p $srcfolder
BROWSER_MANIFEST_VERSION=3
update_tmpl $BROWSER_SPECIFIC_SETTINGS

cp $files $srcfolder

zip -r ${srcfolder}-chrome.zip $files


BROWSER_MANIFEST_VERSION=2
BROWSER_SPECIFIC_SETTINGS=',"browser_specific_settings": {"gecko": {"id": "jcsearch.amo@anshuprateek.com","strict_min_version": "109.0"}}'

update_tmpl $BROWSER_SPECIFIC_SETTINGS

zip -r -FS ${srcfolder}-firefox.zip $files

open ${basefolder}


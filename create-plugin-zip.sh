set -x
basepath=~/tmp
today=$(date +%Y.%M%d.%H%m.%S)
srcfolder="$basepath/${today}/jc-search-plugin"
files="content_script.js icon.png manifest.json styles.css"


update_tmpl() {
    sed -e "s/APPVERSION/${today}/" -e "s/BROWSER_SPECIFIC_SETTINGS/$BROWSER_SPECIFIC_SETTINGS/" manifest.json.tpl |jq > manifest.json
}


mkdir -p $srcfolder

update_tmpl $BROWSER_SPECIFIC_SETTINGS

cp $files $srcfolder

zip -r ${srcfolder}-chrome.zip $files


BROWSER_SPECIFIC_SETTINGS=',"browser_specific_settings": {"gecko": {"id": "jcsearch.amo@anshuprateek.com","strict_min_version": "109.0"}}'

update_tmpl $BROWSER_SPECIFIC_SETTINGS

zip -r -FS ${srcfolder}-firefox.zip $files



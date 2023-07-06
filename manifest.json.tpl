{
  "manifest_version": BROWSER_MANIFEST_VERSION,
  "name": "JumpCloud Search Plugin",
  "version": "APPVERSION",
  "description": "Adds a search box to filter applications on console.jumpcloud.com",
  "icons": {
    "48": "icon.png"
  },
  "content_scripts": [
    {
      "matches": ["https://console.jumpcloud.com/*"],
      "js": ["content_script.js"],
      "css": ["styles.css"]
    }
  ]
  BROWSER_SPECIFIC_SETTINGS

}
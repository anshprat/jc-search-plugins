{
  "manifest_version": 3,
  "name": "JumpCloud Search Plugin",
  "version": "APPVERSION",
  "description": "Adds a search box to filter applications on console.jumpcloud.com",
  "icons": {
    "48": "icon.png"
  },
  "content_scripts": [
    {
      "matches": ["*://console.jumpcloud.com/*"],
      "js": ["content_script.js"],
      "css": ["styles.css"]
    }
  ]
  BROWSER_SPECIFIC_SETTINGS

}
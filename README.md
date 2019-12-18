# Introducing the phrase_browser gem

    require 'phrase_browser'


    s="
    tell me the time
    What day is it?
    play BBC Radio 4
    play Sleep 365 #radio
    what's the weather forecast for tomorrow?
    "

    html = PhraseBrowser.new(s, target_url: 'http://somewebsite/?q').to_html
    File.write '/tmp/accordion.html', 

    `chromium /tmp/accordion.html`


## Resources

* phrase_browser https://rubygems.org/gems/phrase_browser

browser phrasebrowser phrases phrase lookup

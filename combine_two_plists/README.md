# Combine Two Plist Files

You can use the following script to combine or merge two different plist files.

## Usage

Just run the following commands
<pre><code>
(sudo) gem install plist
git clone git@github.com:icapps/icapps_scripts.git
cd icapps_scripts
ruby combine.rb file_one.plist file_two.plist
</code></pre>

### Example

#### File One
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>TITLE_BUTTON_ONE</key>
    <string>Click Here</string>
    <key>MESSAGE_LABEL_ONE</key>
    <string>Hello World</string>
    <key>MESSAGE_LABEL_ONE</key>
    <string>Clear Text</string>
    <key>MESSAGE_LABEL_THREE</key>
    <string>Prepare for launch</string>
  </dict>
</plist>
```

#### File Two
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>MESSAGE_LABEL_THREE</key>
    <string>Terms and conditions</string>
  </dict>
</plist>
```

#### Output
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>TITLE_BUTTON_ONE</key>
    <string>Click Here</string>
    <key>MESSAGE_LABEL_ONE</key>
    <string>Hello World</string>
    <key>MESSAGE_LABEL_ONE</key>
    <string>Clear Text</string>
    <key>MESSAGE_LABEL_THREE</key>
    <string>Terms and conditions</string>
  </dict>
</plist>
```

## Contributors

[Dylan Gyesbreghs](https://github.com/dylangyesbreghs)

## License

The MIT License (MIT)

Copyright (c) 2015 iCapps

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

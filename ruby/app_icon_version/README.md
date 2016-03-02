# App Icon Version

You can use the following script to add info to your App Icon.

## Usage

### Installation

You need to install the following gem's.
<pre><code>(sudo) gem install imagemagick
(sudo) gem install gs
</code></pre>

First you need to drag the following script into your project, and make sure it's in the root of your folder.
Then you have to add a new "Run Script Phase", complete it with the following command.

<pre><code>"${SRCROOT}/Script/app_icon_version.rb"</code></pre>

### Arguments

You can supply the following arguments:

 * Background Color -> First argument
 * Fill Color (Text) -> Second argument

(If you don't supply any arguments the defaults are being used.)

#### Example

<pre><code>"${SRCROOT}/app_icon_version.rb" 717D8C black </code></pre>

## Contributors

[Jelle Vandebeeck](https://github.com/fousa)
</br>
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
# Redmine Checkstyle Plugin

Version 0.1 Beta

Display a checkstyle report (e.g.: PHP_CodeSniffer) as a redmine tab.

## Project Details

### Use case

If you use a code quality analyser, you can display a report of the code quality in redmine using this module.

### Dependencies

* Developed with Redmine 1.3

### Setup

* Clone the git repository to your redmine vendor/plugins/ directory
* Open file app/controllers/checkstyle_controller.rb
* Edit get_checkstyle_project_file to point to the location your Checkstyle report is output to (you can have different report locations depending on your project)
* Generate your report (see example for PHP_CodeSniffer below)
* Enable the module for your project in redmine via the project Settings/Modules tab 

If you are using PHP_CodeSniffer, you can run the following command to generate a report

        phpcs --standard=PEAR --extensions=php --report=checkstyle --report-file=checkstyle.xml *

## Licence

Copyright (C) 2013, [Bashkim Isai](http://www.bashkim.com.au)

This script is distributed under the MIT licence.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

## Contributors

* @bashaus -- [Bashkim Isai](http://www.bashkim.com.au/)

If you fork this project and create a pull request add your GitHub username, your full name and website to the end of list above.
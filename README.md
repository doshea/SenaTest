# RailJumper

Setting up Rails apps can get tedious -- repeating the same steps and downloading the same packages. This pre-packaged repository aims to reduce setup time and aid in getting off the ground quickly.

### Setup
1. Clone the repo down: <tt>git clone https://github.com/doshea/rail_jumper.git</tt>
2. Rename the cloned directory: <tt>mv rail_jumper your_app_name</tt>
3. Delete the .git folder inside the repo: <tt>rm -rf .git</tt>
4. Use Replace All (Command + Shift + F in Sublime) within your project to replace the following case-sensitive placeholders with the appropriate names for your application:

  | Placeholder         |          |           Replacement         |
  | :------------: |:-----:|:--------------------:|
  | change_me         |   --> |        your_app_name       |
  | ChangeMe          |   --> |         YourAppName        |
  | your_name_here |   --> | your_postgres_username |

5. Rename change_me.js and .css.scss to your_app_name.js and .css.scss
6. Create the database: <tt>rake db:create</tt>
7. Party down!

### Frameworks/Libraries
RailJumper comes bundled with a number of front-end frameworks to minimize time you spend downloading and setting up.

#### HTML/CSS
  * Foundation 4

#### Javascript
  * Jquery (Rails Default)
  * Underscore.js (Default)
  * Moment.js (Default)
  * Morris.js (Default)

=====
This README written in [Github Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
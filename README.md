# SmartBlocks

Generators and helpers written by <i class='icon-provider-github'></i> [verybigman](https://github.com/verybigman)</i> for convenient views, css and js organization.

## Installation

Add this line to your application's Gemfile:

    gem 'smart_blocks'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install smart_blocks

By default you should good to go to switch to the next section: **Usage**. However, if you don't have in `application.css` this:

```css
*= require_tree .
```

And/or you don't have in `application.js` this:

```css
//= require_tree .
```
    
*Then* you need to include new folder to your manifests. Add to css manifest (`application.css`):

    *= require_tree ./_blocks
    
And add to js manifest (`application.js`):

    //= require_tree ./_blocks
    
After that restart your rails server, it's important (if you are on Rails).    

## Usage

#### Create block
``` bash
$ rails g smart_blocks:block header_main
  # create -> app/views/_blocks/headers/_header_main.html.haml
  # create -> app/assets/stylesheets/_blocks/headers/header_main.css.sass
  # create -> app/assets/javascripts/_blocks/headers/header_main.js.coffee
```

#### Create element (parts of block)

``` bash
$ rails g smart_blocks:element header_logged_in
  # create -> app/views/_blocks/headers/elements/_header_logged_in.html.haml
  # create -> app/assets/stylesheets/_blocks/headers/elements/header_logged_in.css.sass
  # create -> app/assets/javascripts/_blocks/headers/elements/header_logged_in.js.coffee
```

#### Views

(layout/application.html.haml):
``` ruby
= block 'header_main'
```
Show in this block elements depends on logged in user or not
``` ruby
- if current_user
  = element 'header_logged_in'
- else
  = element 'header_guest'
```

Also you can pass variables:
``` ruby
= block 'menu_main', some_var: value
= element 'button_submit', other_var: value
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

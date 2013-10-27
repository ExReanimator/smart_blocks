module SmartBlocks
  class ElementGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    class_option :no_js, type: :boolean, default: false, desc: 'Without coffee script file'
    class_option :no_css, type: :boolean, default: false, desc: 'Without sass file'

    def create_element_files
      haml = 'app/views/_blocks/'
      sass = 'app/assets/stylesheets/_blocks/'
      coffee = 'app/assets/javascripts/_blocks/'

      directory = file_name.split('_')[0].pluralize + '/elements/'

      block_haml_name = '_' + file_name + '.html.haml'

      @css_class_name = "." + file_name.gsub('_', '-')

      template "haml_template.tt", haml + directory + block_haml_name
      unless options.no_css
        block_sass_name = file_name + '.css.sass'
        template "sass_template.tt", sass + directory + block_sass_name
      end
      unless options.no_js
        block_coffee_name = file_name + '.js.coffee'
        template "coffee_template.tt", coffee + directory + block_coffee_name
      end
    end
  end
end
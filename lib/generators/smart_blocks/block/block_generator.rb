module SmartBlocks
  class BlockGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../templates', __FILE__)

    class_option :slim, type: :boolean, default: false, desc: 'Generate slim template'
    class_option :no_js, type: :boolean, default: false, desc: 'Without coffee script file'
    class_option :no_css, type: :boolean, default: false, desc: 'Without sass file'

    def create_block_files
      html   = 'app/views/_blocks/'
      sass   = 'app/assets/stylesheets/_blocks/'
      coffee = 'app/assets/javascripts/_blocks/'

      directory = file_name.split('_')[0].pluralize + '/'

      block_name_extension = (options.slim ? '.slim' : '.haml')
      block_name = '_' + file_name + '.html' + block_name_extension

      @css_class_name = "." + file_name.gsub('_', '-')

      if File.exist?(html + directory + block_name)
        puts "\e[0;31m Block with this name is already exists. Try 'thor blocks:list' or 'thor blocks:usage #{file_name}'\e[0m"
      else
        if options.slim
          template "slim_template.tt", html + directory + block_name
        else
          template "haml_template.tt", html + directory + block_name
        end

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
end

require 'smart_blocks/view_helpers'

module SmartBlocks
  class Railtie < Rails::Railtie
    initializer "smart_blocks.view_helpers" do
      ActionView::Base.send :include, SmartBlocks::ViewHelpers
    end
  end
end

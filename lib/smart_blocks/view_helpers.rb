module SmartBlocks
  module ViewHelpers
    def block(block_name, options={})
      render "_blocks/#{block_name.split('_')[0].pluralize}/#{block_name}", options
    end
    alias :b :block

    def element(block_element_name, options={})
      render "_blocks/#{block_element_name.split('_')[0].pluralize}/elements/#{block_element_name}", options
    end
    alias :e :element
  end
end
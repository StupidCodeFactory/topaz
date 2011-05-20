module Topaz
  
  class Tempo
    
    extend Forwardable
    
    attr_reader :source
    
    def_delegators :source, :tempo
  
    def initialize(*a, &event)
      @source = case a.first
        when Numeric then InternalTempo.new(a.first)
        when Hash then ExternalMIDITempo.new(a.first[:midi])
      end
      @on_step = event
    end
    
    # this will change the tempo
    # in the case that you are using external midi tempo, this will switch to internal tempo
    # at the desired rate
    def tempo=(val)
      # if @source.respond_to?(:tempo=)
      # etc 
    end
    
    # this will start the generator
    # in the case that you plan on using external midi tempo, this will wait for a start message
    def start(options = {})
      
    end
    
    # this will stop everything
    def stop
      
    end
    
  end
  
end
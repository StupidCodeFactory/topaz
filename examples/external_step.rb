#!/usr/bin/env ruby
$:.unshift File.join( File.dirname( __FILE__ ), '../lib')

require 'topaz'

# first, initialize the MIDI input port
@input = UniMIDI::Input.first.open

# a fake little sequencer for demonstration
class Sequencer
  
  def step
    @i ||= 0
    p "step #{i+=1}"
  end
  
end

@tempo = Topaz::Tempo.new(:midi => @input) { Sequencer.step }
@tempo.start

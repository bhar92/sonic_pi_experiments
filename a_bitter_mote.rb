live_loop :chord do
  my_amp=1.5
  use_synth :pretty_bell
  play :C2, attack: 2, release: 5, cutoff: 130, amp: my_amp
  play :G2, attack: 1, release: 5, cutoff: 130, amp: my_amp
  play :F2, attack: 3, release: 5, cutoff: 130, amp: my_amp
  sleep 1
end

secondMy_amp=0.0

live_loop :beeps do
  use_synth :sine
  with_fx :slicer, wave: 0 do
    4.times do
      play_pattern_timed [:A4, :C4, :B4, :D4], [0.25, 0.15, 0.35, 0.25], amp: 0.0
    end
    4.times do
      play_pattern_timed [:F4, :C4, :D4, :G4], [0.25, 0.15, 0.35, 0.25], amp: secondMy_amp
    end
  end
end

live_loop :sample do
  #  sync :beeps
  #with_fx :ring_mod do
  sample :loop_breakbeat, rate: 1, attack: 0.1, sustain: 0.3, release: 0.1, amp: secondMy_amp, cutoff: 110
  #end
  sleep 0.5
end

live_loop :boom do
  with_fx :reverb, room: 1 do
    sample :bd_boom, amp: 10, rate: 1
  end
  sleep 8
end

# Welcome to Sonic Pi 2.6.0-dev

#synth_notes = [:c1, :f1, :g1]
#synth_notes = scale(:f4, :minor_pentatonic)
#synth_notes =  (ring 65, 68, 70, 72, 75, 77)
synth_notes =  (ring 68, 70, 77, 72)
#print(synth_notes)

kick_trig = [1, 0, 1, 0, 1, 0, 1, 0]
cymb_trig = [0, 1, 0, 1, 0, 1, 0, 1]
snar_trig = [0, 0, 0, 1, 0, 0, 0, 1]

live_loop :bass do
  use_synth :mod_sine
  #synth_notes.each do |note|
  with_fx :ring_mod do
    play chord(:f3, :major7), attack: 0.1, release: 2, mod_phase_offset: 0.2, cutoff: 80 , amp: 0.5
  end
  sleep 1
  #end
end

live_loop :kick do
  sync :bass
  kick_trig.each do |trig|
    if trig == 1
      sample :bd_haus, rate: 1.5, amp: 0.75
    end
  sleep 0.25
  end
end

live_loop :cymbal do
  sync :bass
  cymb_trig.each do |trig|
    if trig == 1
      sample :drum_cymbal_soft, rate: 1, amp: 0.2
    end
  sleep 0.25
  end
end

live_loop :snare do
  sync :bass
  snar_trig.each do |trig|
    if trig == 1
      sample :drum_snare_soft, rate: 0.2, cutoff: 80, amp: 1
    end
  sleep 0.25
  end
end


live_loop :synth2 do
  sync :bass
  use_synth :mod_beep
  #play_pattern synth_notes, release: 0.5, cutoff: rrand(60, 120), attack: 0.3, amp: 0.5
  with_fx :reverb do
    play choose(scale(:f3, :minor_pentatonic)), release: 0.5, cutoff: rrand(60, 120), attack: 0.3, amp: 0.1 end
  sleep 0.125
end 

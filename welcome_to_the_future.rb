in_thread do
  use_synth :fm

  loop do
    play :C4, release: 0.1, cutoff: rrand(60, 120), pan: rrand(-0.5, 0.5)
    sleep 0.125
  end
end

in_thread do
  sleep 5
  50.times do
    sample :bd_haus
    sleep 0.5
  end
end

in_thread do
  sleep 10
  use_synth :subpulse
  50.times do
    play choose(chord(:C4, :maj11)), release: 0.3, cutoff: rrand(60, 120)
    sleep 0.25
  end
end

in_thread do
  sleep 10
  use_synth :dark_ambience
  50.times do
    play choose(chord(:C4, :minor7)), release: 0.3, cutoff: rrand(60, 120)
    sleep 0.25
  end
end

in_thread do
  sleep 10
  loop do
    with_fx :reverb do
      if one_in(2)
        sample :bd_808, amp: 1
        sleep 0.25
      else
        sample :elec_beep, amp: rrand(0, 0.5)
        sleep 0.25
      end
    end
  end
end

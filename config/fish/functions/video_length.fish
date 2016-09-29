function video_length
  set -l total 0

  for vid in $argv
    set -l length (ffprobe -i $vid -show_format -v quiet | sed -n 's/duration=//p')
    set total (math $total+$length)
  end

  set -l total (printf \%.0f $total);
  set -l seconds (math $total%60)
  set -l minutes (math $total/60%60)
  set -l hours (math $total/3600%60)

  echo (printf "%d:%02d:%02d" $hours $seconds $minutes)
end


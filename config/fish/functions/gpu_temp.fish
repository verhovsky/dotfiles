function gpu_temp
    set old_temp 0
    while true
        set temp (nvidia-smi -q -d TEMPERATURE | awk '/GPU Current Temp/ {print $5}')
        if math $temp \> $old_temp+2 > /dev/null; or math $temp \< $old_temp-2 > /dev/null
            set old_temp $temp
            echo $temp
            sleep 1
        end
    end
end

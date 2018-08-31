if [ "$1" -eq "0" ]; then
	destination="alsa_output.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.analog-stereo"
elif [ "$1" -eq "1" ]; then
	destination="alsa_output.pci-0000_00_1f.3.analog-stereo"
else
	echo "invalid input"
fi

pactl list short sink-inputs|while read stream; do
    streamId=$(echo $stream|cut '-d ' -f1)
    echo "moving stream $streamId"
    pactl move-sink-input "$streamId" $destination
done


#!/bin/bash -x
#mkdfa sample

if [ "x$1" == "x" ]; then
	echo "USAGE: $0 \"string\""
	exit 1
fi

TMPWAV="myWaveFile.wav"

echo "$1" | RHVoice -W Elena > test.wav

rm ${TMPWAV}
ffmpeg -i test.wav -acodec pcm_s16le -ar 16000 ${TMPWAV}
echo "$PWD/${TMPWAV}" > filelist.txt

RESULT=`julius -quiet -input rawfile -filelist filelist.txt -C julian.jconf | grep "sentence1:"`
RESULT=${RESULT/sentence1: <s> /}
RESULT=${RESULT/<\/s>/}
echo $RESULT

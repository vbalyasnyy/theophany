theophany
=========

Electronic assistant systems built on speech recognition and synthesis.

raw file manipulating

echo "текст" | RHVoice > test.wav
sox test.wav --bits 16 --encoding signed-integer --endian little test.raw
play -t raw -r 16k -e signed -b 16 -c 1 test.raw

SIMPLE TETS RHVoice - Julius

echo "j,,,,,,,,,,,,,.... Do play       " | RHVoice > test.wav
ffmpeg -i test.wav  -acodec pcm_s16le -ar 16000 myWaveFile.wav
echo "$PWD/myWaveFile.wav" > filelist.txt
julius -input rawfile -filelist filelist.txt -C julian.jconf

SIMPLE TETS RHVoice - sphinx
(http://habrahabr.ru/post/167479/)

pocketsphinx_batch -argfile argfile_ru 2>./error

**argfile_ru**
-hmm /home/user/workdir/github/theophany/distr/voxforge-ru-0.2/model_parameters/msu_ru_nsh.cd_cont_1000_8gau_16000/
-lm /home/user/workdir/github/theophany/distr/lmbase.lm.DMP
-dict /home/user/workdir/github/theophany/distr/voxforge-ru-0.2/etc/msu_ru_nsh.dic
-cepdir /home/user/workdir/github/theophany/distr/pocketsphinx-0.8/test/data/
-ctl ctlfile
-cepext .raw
-adcin true
-hyp outname

**ctlfile**
test

**lmbase.txt**

<s> сделай тише </s>
<s> делай громче </s>
<s> закрыть все окна </s>
<s> разверни окно </s>
...

text2wfreq <lmbase.txt | wfreq2vocab> lmbase.tmp.vocab
cp lmbase.tmp.vocab  lmbase.vocab
text2idngram -vocab lmbase.vocab -idngram lmbase.idngram < lmbase.txt
idngram2lm -vocab_type 0 -idngram lmbase.idngram -vocab lmbase.vocab -arpa lmbase.arpa
sphinx_lm_convert -i lmbase.arpa -o lmbase.lm.DMP



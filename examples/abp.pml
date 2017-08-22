//Simple Alternate Bit Protocol Model
mtype = {msg, ack};
chan tosndr = [2] of {mtype, bit};
chan torcvr = [2] of {mtype, bit};
active proctype sender()
{
  bool seqout, seqin;
  do
   :: torcvr!msg,seqout ->tosndr?ack,seqin;
   :: timeout -> skip;
  if
   :: seqin == seqout ->
      seqout = 1- seqout ;
   ::timeout->skip
 fi
 od
}

active proctype receiver()
{
 bool seqin;
 do
  :: torcvr?msg,seqin ->tosndr!ack,seqin;
  :: torcvr?msg,seqin ->skip;
od
} 	

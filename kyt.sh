#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY���v  ��� }���oޮ����    P����wn��<%d�OQ��L�4�S�4� ޤ=@z�� D��OD�'�6P@ � h�  �$� 4�6�M4z�=L�2 2 4h ~��  @      $�d2M�Ҟ����M 4��A���H���SQ<�|�'sV��ݞ20<���u�@�4�j�Q�<��Jj��K���/o5�``!I<yfM�GnE��b�ѝ���'A7jEgf�e�#u��жޤA,l/;?�i�k�v�Twќ����J=
[��q���G�}�T��,���pAQf`j$�m�;�X��HÐ��E}�*���f`���s��s;��z*k�<<l(~�Qk�B�����x �C�Gh����`�w}� (,6��s�楒~���m�]}�o�N��Q�/�L~�+���z�@���^C]�T��\���aye��sF��e  ].��J�gPQ�ʶ��� !ߤ�Ns �<�ɯ�j�[~��CLPPn��W��Ɨ#�[� &?��#J�JtA�܋�^�v�N	=�+$�AH�2���ZF�	�/9*��j~\Ƃ��Җ.I��[}óN��ت�#Ds��$���:pQ7����\;�DX�����B�V�cS0,�5���ç�����K7MK�fBLn��t��7-:����4�WTO�21��˲���vʡEEH���^�d��	;k��F��7�8u~�Ս5K��(M�0��y�<�M�c����0�]{ɍ+g(;��U��U���o�_�s�6�߱�%���|Q���VjX��6i5�������Р�PVrI���@9�
d���KxB�`���n<�E6���$l�Obsl�H�C����Td�2�eD�i���'b2�xnrC:�Z�0ϖ6��%pyV:���t}Y$th�L�(0�`"�sѝZ]N3c����F��J8 +R/C�]A(r}@� `@���H�
��
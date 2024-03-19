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
BZh91AY&SY���  ���E����?�ޮ����    @�d�S$CD�4�2O�COSFjbi�4G�Ѧ��6��LO(D&�4�2d&2� h    � 24h���M d41 h�h`��	"#S�&S�&�G��CMM=&F��hbhȈ�`������_C������iL��,x�ٙ�-��\Đ
�$��Iq^FJv/?9n&k�Γ���y�G=!�_S�(��0�W��A��)U�TS�(��[U[B�1��hh��Mk}�I�7���-���;^�2ͪ�Q�{i���)p1�6�����$5;��G
e�.�@�mH����'U�*;�c��7�o��+di�c�be@M����8�D(Nz�I�`c�[0"
�%�K_h���j2B��-��Ĩ$$0�JLA�p��M�D`�8�KKqnzȗa3P˗'�"K��٪��Y�ZG@:0v�E�o�r���]={$)<)b`d�q�t�Ź���T�?Jq�@�r�"a�VH�c�fc��E���F���}�hTNc����5��;�4���+V*�|�l�i���Y����H���˫P���)3f{L�7C�E2��L�B(�Ǎ�XD�0D��x��� �(Q(� �mX�j<�!�I.yk��S^#AA|�;]s@�v��0����`��@v*Ǳء�n]��K�������E�-Y�-V��\�d֫�ו��ˢT`PU����5�J3U����!�eX�:��@��TDiӂ֭������P���][�lb�@U�Q4J+���"�� �g��K�WLJ*��FZ���I��\i	*��]��BC�.@\
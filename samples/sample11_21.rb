dictionary = {
  "dog"      => "��",
  "cat"      => "�L",
  "rabbit"   => "������",
  "horse"    => "�n",
  "lion"     => "���C�I��",
  "tiger"    => "��",
  "elephant" => "��",
}

puts "�����̖��O���p��œ��͂��Ă�������"
english = gets.chomp
japanese = dictionary[english]
if japanese 
  puts "#{english}�͓��{���#{japanese}�Ƃ����܂�"
else
  puts "���̎�����#{english}�͂���܂���"
end

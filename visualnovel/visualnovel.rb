 require "guiutil.rb"
 require "scenario.rb"
 
 #--------------------------------------
 #    ����������
 #--------------------------------------
 def init
   # �E�B���h�E�̍쐬
   create_screen "Visual Novel", 480, 360
   # GUI �V�X�e���J�n
   start_gui
 
   # �O���[�o���ϐ��̏�����
   $font_size = 12    # �t�H���g�̕\���T�C�Y
   $scene = 'opening' # ��� ID
   $fonts = []        # �t�H���g�I�u�W�F�N�g�i�[�p�̔z��
   $bg_image = nil    # �w�i�I�u�W�F�N�g��������ϐ�
   $quit_button = nil # �I���{�^���I�u�W�F�N�g��������ϐ�
 end
 
 #--------------------------------------
 #    ���C�����[�v
 #--------------------------------------
 def mainloop(tbl)
   while true
     # �V�[���f�[�^���o��
     scene_data = tbl[$scene]
 
     # �w�i�摜���w�肳��Ă���Ε\������
     bg_fname = scene_data[0][0]
     if bg_fname
       $bg_image = create_img 0, 0, bg_fname
     end

     # �I���{�^���̕\��
     $quit_button = create_img_button 0, 438, 180, "quiticon0.gif", "quiticon1.gif"
 
     # ���b�Z�[�W�̕\��
     message = scene_data[0][1]
     font = create_font message, 24,218, $font_size
     $fonts.push font
 
     # �I�������b�Z�[�W�̕\��
     (scene_data.size-1).times do |i|
       sleep 0.2
       idx = i+1
       ch_msg = "#{idx}. #{scene_data[idx][1]}"
       font = create_font_button idx, ch_msg, 24, 270+i*24, $font_size
       $fonts.push font
     end

     # �{�^���̓��͑҂�
     input_value = get_button_id
     # �{�^�� ID �� 0 �Ȃ�I��
     if input_value == 0
       finish
     end
     # �I�����ꂽ�t�H���g�𐅐F�ɂ���
     $fonts[input_value].color "#88FFFF"
 
     # ���̃V�[�� ID �����o��
     $scene = scene_data[input_value][0]
     # nil �Ȃ�I��
     if $scene == nil
       finish
     end

     # ��ʂ������l�p�œh��Ԃ�
     block_mask

     # �\�������폜
     delete_items
   end
 end
 
 #--------------------------------------
 #    �\�����̍폜
 #--------------------------------------
 def delete_items2()
   # �\�����̏I���{�^�����폜
   if $quit_button
     $quit_button.delete
     $quit_button = nil
   end
 end

 #--------------------------------------
 #    �\�����̍폜
 #--------------------------------------
 def delete_items
   # �\�����̃t�H���g���폜
   $fonts.size.times do |idx|
     $fonts[idx].delete
   end
   $fonts = []

   # �\�����̔w�i�摜���폜
   if $bg_image
     $bg_image.delete
     $bg_image = nil
   end
 end
 
 #--------------------------------------
 #    �I������
 #--------------------------------------
 def finish
   # �\����������΍폜
   delete_items
   # GUI �V�X�e���I��
   stop_gui
   # �v���O�����̏I��
   exit
 end
 
 #======================================
 #    ���ۂ̏����͂�������X�^�[�g
 #======================================
 init # ����������
 mainloop ScenarioTbl # ���C�����[�v

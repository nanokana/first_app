str = "abcdefg"
p str.sub("cde", "CDE")      #=> "abCDEfg"
p str.sub("cde", "!")        #=> "ab!fg"
p str.sub("cde", "!!!!!")    #=> "ab!!!!!fg"

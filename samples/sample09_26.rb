str = "abcdefg"
str.sub!("cde", "XYZ")
p str    #=> "abXYZfg"

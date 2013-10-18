a = {
  "tomato" => 120,
  "potato" =>  50,
  "carrot" =>  30,
}
p a    #=> {"tomato"=>120, "potato"=>50, "carrot"=>30}
a.delete("tomato")
p a    #=> {"potato"=>50, "carrot"=>30}

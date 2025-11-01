pitagóricas :: [(Integer, Integer, Integer)]
pitagóricas = [(a, b, c) |  c <- [1..],a <- [1..(c^2)], b <-[1..(c^2)], a^2 + b^2 == c^2]
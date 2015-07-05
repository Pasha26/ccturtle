turtle.select(1)
turtle.refuel()
 
while true do
    turtle.forward()
    while turtle.dig() do end
    while turtle.digUp() do end
    turtle.digDown()
    end
    if turtle.getItemCount(16)>0 then
        exit()
    end

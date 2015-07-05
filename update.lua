-- updater script
 
local target = turtle and "/" or "/disk"
local url = "https://github.com/Pasha26/ccturtle"
 
 
function SaveFile(url, directory, name)
        print("    ", name)
        local c = http.get(url .. directory .. name .. ".lua").readAll()
        local f = fs.open(target .. directory .. name, "w")
        f.write(c)
        f.close()
end
 
 
function UpdateDir(directory)
        local index = http.get(url .. directory .. "/index.txt")
        print("  ", directory)
        for n in index.readLine do
                if string.sub(n,-1) == "/" then
                        if not fs.isDir(target .. directory .. n) then
                                fs.makeDir(target .. directory .. n)
                        end
                        UpdateDir(directory .. n)
                else
                        SaveFile(url, directory, n)
                end
        end
        index.close()
end
 
UpdateDir("/")

    qrencode = dofile("d:\\qrencode.lua")
    local ok, tab_or_message = qrencode.qrcode("http://www.bing.com")
    if not ok then
        Log.i(tab_or_message)
    end
    Log.i(json.encode(tab_or_message));
    drawNode = cc.DrawNode:create()
    local gridWidth = 8;
    local offsetX = 448;
    local offsetY = 180;
    for i,row in pairs(tab_or_message) do
        for j,v in pairs(row) do
            if(v > 0) then
                drawNode:drawSolidRect(cc.p(i * gridWidth + offsetX, j * gridWidth + offsetY), 
                    cc.p(i * gridWidth + gridWidth + offsetX, j * gridWidth + gridWidth + offsetY), 
                    cc.c4f(0,0,0,1))
            else
                drawNode:drawSolidRect(cc.p(i * gridWidth + offsetX, j * gridWidth + offsetY), 
                    cc.p(i * gridWidth + gridWidth + offsetX, j * gridWidth + gridWidth + offsetY), 
                    cc.c4f(1,1,1,1))
            end
        end
    end
    btn_login:addChild(drawNode);
local API = require("api")
local atchest = false
local outend =false
local i = 0




local function gotochest()
    if not atchest then
        API.DoAction_Object1(0x39, 0, { 114764 }, 50)
        bankingreq = false
        print('RUNNING TO PORTAL')
        RandomSleep2(4500, 4500, 4500)
        API.WaitUntilMovingEnds()
        RandomSleep2(2000, 2000, 2500)
        API.DoAction_Object1(0X31, 0, { 122065 }, 50)
        print('RUNNING TO CHEST')
        RandomSleep2(1700, 1700, 1900)
        RandomSleep2(7500, 7500, 7500)
        atchest = true
        print('atchest')
    end
end


local function bank()
    print('banking func')
    API.DoAction_Ability("War's Retreat Teleport", 1, 5392)
    RandomSleep2(5900, 5900, 5900)
    API.DoAction_Object1(0x2e, 0, { 114750 }, 50)
    API.RandomSleep2(2500, 2500, 2500)
    function newCounter()
        return function()
            i = i + 28
            return i
        end
    end

    c1 = newCounter()
    print(c1()) --> 1

    API.DoAction_Interface(0x24, 0xffffffff, 1, 517, 119, 1, 5392);
    RandomSleep2(170, 1000, 1700) atchest = false 
        

    if API.InvItemcount_1(52498) < 1 then
         outend= true
         print("ending script")
    end

   
end

local function looting()
    print('looting')
    if atchest then
    if API.Compare2874Status(18, true) then
        RandomSleep2(100, 200, 200)
        API.DoAction_Interface(0x24, 0xFFFFFFFF, 1, 168, 27, -1, 5392)


    elseif API.Compare2874Status(12, true) then
        RandomSleep2(10, 200, 200)
        API.KeyboardPress2(0x20, 20, 60)
        API.DoAction_Interface(0x24, 0xFFFFFFFF, 1, 168, 27, -1, 5392)
    else
        RandomSleep2(700, 800, 800)
        API.DoAction_Object1(0x31, 0, { 122065 }, 50)
    end
end
end



while API.Read_LoopyLoop() do

if outend == true
then end

    if atchest == false and API.InvItemcount_1(52498) > 1 then
        gotochest()
    else
        API.RandomSleep2(900, 900, 1000)
        if API.InvItemcount_1(52498) > 0 then
            looting()
        else
            if API.InvItemcount_1(52498) < 1 then 
         if API.Compare2874Status(18,true) then
        RandomSleep2(500, 600, 700)
        API.DoAction_Interface(0x24, 0xFFFFFFFF, 1, 168, 27, -1, 5392)
        RandomSleep2(300,400,400)
         elseif API.Compare2874Status(12,true) then
            API.KeyboardPress2(0x20,20,60)
         end
    if API.Compare2874Status(0,true) then
     bank()
     if API.InvItemcount_1(52498) > 1 then
     gotochest()
        end
           
            end
        end
    
        end
    end
end

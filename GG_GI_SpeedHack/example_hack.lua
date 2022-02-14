-- Solution using pointers from here:
-- https://www.youtube.com/watch?v=F2urjslN_Qc&t=1s&ab_channel=Mr.DragonStar

function main()
    gg.clearResults()
    -- Set region Other.
    gg.setRanges(gg.REGION_OTHER)

    -- Search "AnimatorAttackSpeed". Refind "At", "A".
    gg.searchNumber(":AnimatorAttackSpeed", gg.TYPE_BYTE)
    gg.refineNumber(":At", gg.TYPE_BYTE)
    gg.refineNumber(":A", gg.TYPE_BYTE)
    local letters = gg.getResults(100)
    gg.clearResults()

    -- Get address of "A".
    -- Find QWORDs with value: 000000{address-16}h~000000{address+16}h
    -- Offset +16. Copy it's value.
    local results = {}
    for _, v in ipairs(letters) do
        local range2find = string.format("%016Xh~%016Xh", v.address - 16, v.address + 16)
        gg.searchNumber(range2find, gg.TYPE_QWORD)
        local vars = gg.getResults(100)
        gg.clearResults()

        for _, var in ipairs(vars) do
            var = {
                address = var.address + 16,
                flags = gg.TYPE_QWORD,
            }
            table.insert(results, var)
        end
    end
    results = gg.getValues(results)

    -- Set region Anonymous.
    gg.setRanges(gg.REGION_ANONYMOUS)

    -- Find QWORD with value 000000{value}h. Copy it's address.
    local final_floats = {}
    for _, v in ipairs(results) do
        local pointer2find = string.format("%016Xh", v.value)
        gg.searchNumber(pointer2find, gg.TYPE_QWORD)
        local vars = gg.getResults(100)
        gg.clearResults()

        for _, var in ipairs(vars) do
            for i = -1023, 1024, 1 do
                local QWORD_SIZE = 4
                local tmp = {
                    address = var.address + i * QWORD_SIZE,
                    flags = gg.TYPE_FLOAT,
                }
                table.insert(final_floats, tmp)
            end
        end
    end

    -- Use mempage around this address as results. Use it's values as float.
    -- Refind 0.01F~500F.
    -- Enjoy: each filtered variable affects something in the game.
    gg.clearResults()
    gg.loadResults(final_floats)
    gg.refineNumber("0.01F~500F", gg.TYPE_FLOAT)

    -- Find & edit speed of hero.
    gg.refineNumber("1.0F", gg.TYPE_FLOAT)
    gg.editAll("2.0", gg.TYPE_FLOAT)
end

-- Start program
if gg == nil then
    print("WARN: 'gg' недоступен. Используется mock-версия для теста")
    gg = require("mock_gg")
end

main()

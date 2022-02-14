local contains = {
    'addListItems', 'alert', 'allocatePage', 'bytes', 'choice',
    'clearList', 'clearResults', 'copyMemory', 'copyText',
    'disasm', 'dumpMemory', 'editAll', 'getActiveTab', 'getFile',
    'getLine', 'getListItems', 'getLocale', 'getRanges',
    'getRangesList', 'getResults', 'getResultsCount',
    'getSelectedElements', 'getSelectedListItems',
    'getSelectedResults', 'getSpeed', 'getTargetInfo',
    'getTargetPackage', 'getValues', 'getValuesRange',
    'gotoAddress', 'hideUiButton', 'isClickedUiButton',
    'isPackageInstalled', 'isProcessPaused', 'isVisible',
    'loadList', 'loadResults', 'makeRequest', 'multiChoice',
    'numberFromLocale', 'numberToLocale', 'processKill',
    'processPause', 'processResume', 'processToggle', 'prompt',
    'refineAddress', 'refineNumber', 'removeListItems',
    'removeResults', 'require', 'saveList', 'saveVariable',
    'searchAddress', 'searchFuzzy', 'searchNumber', 'searchPointer',
    'setRanges', 'setSpeed', 'setValues', 'setVisible',
    'showUiButton', 'skipRestoreState', 'sleep', 'startFuzzy',
    'timeJump', 'toast', 'unrandomizer', 'ANDROID_SDK_INT',
    'ASM_ARM', 'ASM_ARM64', 'ASM_THUMB', 'BUILD', 'CACHE_DIR',
    'DUMP_SKIP_SYSTEM_LIBS', 'EXT_CACHE_DIR', 'EXT_FILES_DIR',
    'EXT_STORAGE', 'FILES_DIR', 'FREEZE_IN_RANGE',
    'FREEZE_MAY_DECREASE', 'FREEZE_MAY_INCREASE', 'FREEZE_NORMAL',
    'LOAD_APPEND', 'LOAD_VALUES', 'LOAD_VALUES_FREEZE', 'PACKAGE',
    'POINTER_EXECUTABLE', 'POINTER_EXECUTABLE_WRITABLE', 'POINTER_NO',
    'POINTER_READ_ONLY', 'POINTER_WRITABLE', 'PROT_EXEC', 'PROT_NONE',
    'PROT_READ', 'PROT_WRITE', 'REGION_ANONYMOUS', 'REGION_ASHMEM',
    'REGION_BAD', 'REGION_C_ALLOC', 'REGION_C_BSS', 'REGION_C_DATA',
    'REGION_C_HEAP', 'REGION_CODE_APP', 'REGION_CODE_SYS',
    'REGION_JAVA', 'REGION_JAVA_HEAP', 'REGION_OTHER', 'REGION_PPSSPP',
    'REGION_STACK', 'REGION_VIDEO', 'SAVE_AS_TEXT', 'SIGN_EQUAL',
    'SIGN_FUZZY_EQUAL', 'SIGN_FUZZY_GREATER', 'SIGN_FUZZY_LESS',
    'SIGN_FUZZY_NOT_EQUAL', 'SIGN_GREATER_OR_EQUAL',
    'SIGN_LESS_OR_EQUAL', 'SIGN_NOT_EQUAL', 'TAB_MEMORY_EDITOR',
    'TAB_SAVED_LIST', 'TAB_SEARCH', 'TAB_SETTINGS', 'TYPE_AUTO',
    'TYPE_BYTE', 'TYPE_DOUBLE', 'TYPE_DWORD', 'TYPE_FLOAT',
    'TYPE_QWORD', 'TYPE_WORD', 'TYPE_XOR', 'VERSION', 'VERSION_INT',
}

local gg = {}

for i, v in ipairs(contains) do
    if string.find(v, '_') then
        gg[v] = 1234
    else
        gg[v] = function(...)
        end
    end
end

function gg.getResults()
    return {
        {
            address = 0x00,
            value = -0.07,
            flags = gg.TYPE_FLOAT,
        },
        {
            address = 0x00,
            value = -0.07,
            flags = gg.TYPE_FLOAT,
        },
        {
            address = 0x00,
            value = -0.07,
            flags = gg.TYPE_FLOAT,
        },
        {
            address = 0x00,
            value = -0.07,
            flags = gg.TYPE_FLOAT,
        },
        {
            address = 0x00,
            value = -0.07,
            flags = gg.TYPE_FLOAT,
        },
        {
            address = 0x00,
            value = -0.07,
            flags = gg.TYPE_FLOAT,
        },
    }
end

function gg.getValues()
    return {
        {
            address = 0x00,
            value = -7.66,
            flags = gg.TYPE_FLOAT,
        },
        {
            address = 0x00,
            value = -10.98,
            flags = gg.TYPE_FLOAT,
        },
        {
            address = 0x00,
            value = -7.62,
            flags = gg.TYPE_FLOAT,
        },
        {
            address = 0x00,
            value = 42.86,
            flags = gg.TYPE_FLOAT,
        },
        {
            address = 0x00,
            value = -134.10,
            flags = gg.TYPE_FLOAT,
        },
        {
            address = 0x00,
            value = -0.07,
            flags = gg.TYPE_FLOAT,
        },
    }
end

function gg.sleep(ms)
    local sec = tonumber(os.clock() + ms / 1000);
    while os.clock() < sec do
    end
end

function gg.isClickedUiButton()
    return math.random(0, 1) == 1
end

function gg.choice(labels, default, input_types)
    for i, label in ipairs(labels) do
        print(i .. '. ' .. label)
    end

    local input = io.read("*n")
    return input
end

return gg

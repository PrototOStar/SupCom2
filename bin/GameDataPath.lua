
path = {}

local function mount_dir(dir, mountpoint)
    table.insert(path, { dir = dir, mountpoint = mountpoint } )
end

local function mount_contents(dir, mountpoint)
    LOG('checking ' .. dir)
    for _,entry in io.dir(dir .. '\\*') do
        if entry != '.' and entry != '..' then
            local mp = string.lower(entry)
            mp = string.gsub(mp, '[.]scd$', '')
            mp = string.gsub(mp, '[.]zip$', '')
            mount_dir(dir .. '\\' .. entry, mountpoint .. '/' .. mp)
        end
    end
end

toc_root = InitFileDir .. '\\..'
mount_contents(SHGetFolderPath('PERSONAL') .. 'My Games\\Gas Powered Games\\Supreme Commander 2\\mods', '/mods')
mount_contents(SHGetFolderPath('PERSONAL') .. 'My Games\\Gas Powered Games\\Supreme Commander 2\\maps', '/maps')
mount_dir(InitFileDir .. '\\..\\gamedata\\*.scd', '/')
mount_dir(InitFileDir .. '\\..\\gamedata\\*.enc', '/')
mount_dir(InitFileDir .. '\\..', '/')

hook = {
}

protocols = {
    "http",
    "https",
    "mailto",
    "ventrilo",
    "teamspeak",
    "daap",
    "im",
}

cachedFiles = {
    "/gamedata/lua.scd"
}

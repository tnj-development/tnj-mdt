QBCore = exports['qb-core']:GetCoreObject()
local messsages = {}
local activeOfficers = {}

-- DISPATCH

-- Get Dispatch Calls
---@return table -- A table containing the dispatch calls from ps-dispatch.
lib.callback.register('nxt_mdt:callback:getActiveCalls', function(source)
    return exports['ps-dispatch']:GetDispatchCalls()
end)

-- ACTIVE OFFICERS

RegisterNetEvent('nxt_mdt:server:setCallsign', function(cid, newCallsign)
	local Player = QBCore.Functions.GetPlayerByCitizenId(cid)
	Player.Functions.SetMetaData("callsign", newCallsign)
end)

--- Syncs the status of the player with the server for the active officers list.
RegisterNetEvent('nxt_mdt:server:syncStatus', function()
    local PlayerData = QBCore.Functions.GetPlayer(source).PlayerData

    local job = PlayerData.job
    local charinfo = PlayerData.charinfo
    local metadata = PlayerData.metadata

    -- Only add people with the allowed job types
    if not lib.table.contains(Config.Jobs, job.type) then
        return
    end

    local data = {
        source = source,
        cid = PlayerData.citizenid,
        job = job.label,
        jobGrade = job.grade.name,
        jobType = job.type,
        duty = job.onduty,
        name = charinfo.firstname.." "..charinfo.lastname,
        callsign = metadata.callsign,
    }

    activeOfficers[#activeOfficers+1] = data
end)

AddEventHandler('playerDropped', function(_reason)
    for index, data in pairs(activeOfficers) do
        if data.source == source then
            activeOfficers[index] = nil
            break
        end
    end
end)

-- Get Active officers
---@return table -- A table containing the active officers.
lib.callback.register('nxt_mdt:callback:getActiveOfficers', function(source)
    return activeOfficers
end)

-- ANNOUCEMENTS

-- Get Annoucements
---@param jobType string -- Job type
---@return table -- A table containing the annoucements.
lib.callback.register('nxt_mdt:callback:getAnnouncements', function(source, jobType)
    local result = MySQL.query.await("SELECT * FROM `mdt_bulletin` WHERE `jobtype` = ?", {
        jobType
    })
    return result
end)

-- Creates a new annoucement in the database.
---@param title string -- The title of the annoucement.
---@param desc string -- The description of the annoucement.
---@param author string -- The player who created the annoucement.
---@param jobType string -- The job type of the player who created the annoucement.
---@return table -- The created annoucement.
lib.callback.register('nxt_mdt:callback:newAnnouncement', function(source, title, desc, author, jobType)
    local time = os.time() * 1000

    local annoucement = MySQL.insert.await('INSERT INTO `mdt_bulletin` (`title`, `desc`, `author`, `time`, `jobtype`) VALUES (?, ?, ?, ?, ?)', {
        title, desc, author, time, jobType
    })

    NewLog(author.." created a new annoucement: "..title, "Annoucement", jobType)
    return { id = annoucement, title = title, desc = desc, author = author, time = time, jobtype = jobType }
end)

-- Edits an annoucement in the database.
---@param id number -- The ID of the annoucement to edit.
---@param title string -- The new title of the annoucement.
---@param desc string -- The new description of the annoucement.
---@param author string -- The player who edited the annoucement.
---@param jobType string -- The job type of the player who edited the annoucement.
---@return table -- The edited annoucement.
lib.callback.register('nxt_mdt:callback:editAnnouncement', function(source, id, title, desc, time, author, jobType)
    MySQL.query.await('UPDATE `mdt_bulletin` SET `title` = ?, `desc` = ?, `author` = ? WHERE `id` = ?', {
        title, desc, author, id
    })

    NewLog(author.." edited an annoucement: "..title, "Annoucement", jobType)
    return { id = id, title = title, desc = desc, author = author, time = time, jobtype = jobType }
end)

-- Deletes an annoucement from the database.
---@param id number -- The ID of the annoucement to delete.
---@param title string -- The title of the annoucement to delete.
---@param player string -- The player who deleted the annoucement.
---@param jobType string -- The job type of the player who deleted the annoucement.
RegisterNetEvent('nxt_mdt:server:deleteAnnouncement', function(id, title, player, jobType)
    MySQL.query.await('DELETE FROM `mdt_bulletin` WHERE id = ?', { id })
    NewLog(player.." deleted an annoucement: "..title, "Annoucement", jobType)
end)

-- INCIDENTS

-- Searches for incidents in the database that match the given search query.
---@param search string -- The search query to match incidents against.
---@return table -- A table containing the matching incidents.
lib.callback.register('nxt_mdt:callback:searchIncidents', function(source, search)
    local result = MySQL.query.await("SELECT * FROM `mdt_incidents` WHERE `title` LIKE ? OR `author` LIKE ?", {"%"..search.."%", "%"..search.."%"})

    local incidents = {}
    for i, incident in ipairs(result) do
        incident.tags = json.decode(incident.tags)
        incident.officersinvolved = json.decode(incident.officersinvolved)
        incident.civsinvolved = json.decode(incident.civsinvolved)
        incident.evidence = json.decode(incident.evidence)
        incidents[#incidents+1] = incident
    end

    return incidents
end)


-- Get Incidents
---@param jobType string -- Job type
---@return table -- A table containing the incidents.
lib.callback.register('nxt_mdt:callback:getIncidents', function(source, jobType)
    local result = MySQL.query.await("SELECT * FROM `mdt_incidents` ORDER BY `last_updated` DESC LIMIT 15", {})

    for i, incident in ipairs(result) do
        incident.tags = json.decode(incident.tags)
        incident.officersinvolved = json.decode(incident.officersinvolved)
        incident.civsinvolved = json.decode(incident.civsinvolved)
        incident.evidence = json.decode(incident.evidence)
    end

    return result
end)

-- Creates a new incident in the database.
---@param author string -- The player who created the incident.
---@param title string -- The title of the incident.
---@param details string -- The details of the incident.
---@param tags string -- The tags of the incident.
---@param officersinvolved string -- The officers involved in the incident.
---@param civsinvolved string -- The civilians involved in the incident.
---@param evidence string -- The evidence of the incident.
---@param jobType string -- The job type of the player who created the incident.
---@return table -- The created incident.
lib.callback.register('nxt_mdt:callback:newIncident', function(source, author, title, details, tags, officersinvolved, civsinvolved, evidence, jobType)
    local time = os.time() * 1000

    local incident = MySQL.insert.await('INSERT INTO `mdt_incidents` (`author`, `title`, `details`, `tags`, `officersinvolved`, `civsinvolved`, `evidence`, `time`, `jobtype`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)', {
        author, title, details, tags, officersinvolved, civsinvolved, evidence, time, jobType
    })

    NewLog(author.." created a new incident: "..title, "Incident", jobType)
    return { id = incident, author = author, title = title, details = details, tags = json.decode(tags), officersinvolved = json.decode(officersinvolved), civsinvolved = json.decode(civsinvolved), evidence = json.decode(evidence), time = time, jobtype = jobType }
end)

-- Saves an incident in the database.
---@param id number -- The ID of the incident to save.
---@param author string -- The player who created the incident.
---@param title string -- The title of the incident.
---@param details string -- The details of the incident.
---@param tags string -- The tags of the incident.
---@param officersinvolved string -- The officers involved in the incident.
---@param civsinvolved string -- The civilians involved in the incident.
---@param evidence string -- The evidence of the incident.
---@param jobType string -- The job type of the player who created the incident.
---@return table -- The saved incident data, to update the ui.
lib.callback.register('nxt_mdt:callback:saveIncident', function(source, author, title, details, tags, officersinvolved, civsinvolved, evidence, jobType, id)
    MySQL.query.await('UPDATE `mdt_incidents` SET `author` = ?, `title` = ?, `details` = ?, `tags` = ?, `officersinvolved` = ?, `civsinvolved` = ?, `evidence` = ?, `jobtype` = ? WHERE `id` = ?', {
        author, title, details, tags, officersinvolved, civsinvolved, evidence, jobType, id
    })

    NewLog(author.." edited an incident: "..title, "Incident", jobType)
    return { id = id, author = author, title = title, details = details, tags = json.decode(tags), officersinvolved = json.decode(officersinvolved), civsinvolved = json.decode(civsinvolved), evidence = json.decode(evidence), jobtype = jobType }
end)

-- Deletes an incident from the database.
RegisterNetEvent('nxt_mdt:server:deleteIncident', function(title, id, player, jobType)
    MySQL.query.await('DELETE FROM `mdt_incidents` WHERE id = ?', {
        id
    })
    NewLog(player.." deleted an incident: "..title, "Incident", jobType)
end)

-- REPORTS

-- Get Reports
---@param jobType string -- Job type
---@return table -- A table containing the reports.
lib.callback.register('nxt_mdt:callback:getReports', function(source, jobType)
    local result = MySQL.query.await("SELECT * FROM `mdt_reports` ORDER BY `last_updated` DESC LIMIT 15", {})

    for i, report in ipairs(result) do
        report.tags = json.decode(report.tags)
        report.officersinvolved = json.decode(report.officersinvolved)
        report.civsinvolved = json.decode(report.civsinvolved)
        report.evidence = json.decode(report.evidence)
    end

    return result
end)

-- LOGS

-- Get Logs
---@return table -- A table containing the logs.
lib.callback.register('nxt_mdt:callback:getLogs', function(source)
    local result = MySQL.query.await("SELECT * FROM `mdt_logs` ORDER BY `id` DESC LIMIT 30", {})
    return result
end)

-- CHAT

-- Get all messages
---@return table -- A table containing the messages.
lib.callback.register('nxt_mdt:callback:getMessages', function(source)
    return messsages
end)

-- Creates a new message
---@param message string -- The message to send
---@param player string -- The player who sent the message
RegisterNetEvent('nxt_mdt:server:newMessage', function(message, player)
	print("test server")
    local time = os.time() * 1000
    local data = {
        message = message,
        player = player,
        time = time
    }
    messsages[#messsages+1] = data
    TriggerClientEvent('nxt_mdt:client:sendMessage', -1, data)
end)

-- PROFILES

-- Retrieves the owned vehicles of the players.
---@param cid string -- Citizen ID of the player
---@return table -- A table containing the player's vehicles.
local function getVehicles(cid)
    local result = MySQL.query.await("SELECT * FROM `player_vehicles` WHERE `citizenid` = ?", { cid })

    local vehicles = {}
    for i, vehicle in ipairs(result) do
        local label = GetVehicleName(vehicle.vehicle)
        local data = {
            label = label,
            model = vehicle.vehicle,
            plate = vehicle.plate,
            vinScrached = vehicle.vinscratched
        }

        vehicles[#vehicles+1] = data
    end

    return vehicles
end

-- Retrieves the apartment of a player.
---@param cid string -- Citizen ID of the player
---@return table -- Table containing the apartment label
local function getApartment(cid)
    local result = MySQL.single.await("SELECT * FROM `apartments` WHERE `citizenid` = ?", { cid })

    local apartment = {
        label = result.label,
    }

    return apartment
end

-- Retrieves houses owned by a player with the specified Citizen ID.
---@param cid string -- The Citizen ID of the player.
---@return table -- A table containing the houses owned by the player.
local function getHouses(cid)
    local result =  MySQL.query.await('SELECT houselocations.label, houselocations.coords FROM player_houses INNER JOIN houselocations ON player_houses.house = houselocations.name where player_houses.citizenid = ?', {cid})

    local houses = {}
    for i, house in ipairs(result) do
        local data = {
            label = house.label,
            coords = house.coords,
        }
        houses[#houses+1] = data
    end

    return houses
end

-- Gets player properties / apartment if using Config.PSHousing
---@param cid string -- Citizen ID
---@return table -- A table containing properties / apartment information
local function getPSProperties(cid)
    local result = MySQL.query.await("SELECT * FROM `properties` WHERE `owner_citizenid` = ?", { cid })

    local properties = {}
    for i, property in ipairs(result) do
        local label = property.street or property.apartment
        local coords = { property.door_data.x, property.door_data.y, property.door_data.z }

        local data = {
            label = label,
            coords = coords,
        }

        properties[#properties+1] = data
    end

    return properties
end

-- Gets the properties of a player based on their Citizen ID.
---@param cid string -- Citizen ID
---@return table -- Properties
local function getProperties(cid)
    if Config.PSHousing then
        local properties = getPSProperties(cid)

        return properties
    else
        local apartment = getApartment(cid)
        local houses = getHouses(cid)

        return { apartment, houses }
    end
end

--- Gets the PlayerData for a given citizen ID.
---@param cid string -- The citizen ID of the player.
---@return table -- A table containing the player's data.
local function getPlayerData(cid)
    print(cid)
    local result = MySQL.single.await("SELECT charinfo, metadata, job FROM `players` WHERE `citizenid` = ?", { cid })
    local charinfo = json.decode(result.charinfo)
    local metadata = json.decode(result.metadata)
    local job = json.decode(result.job)

    local playerData = {
        fullname = charinfo.firstname.." "..charinfo.lastname,
        birthdate = charinfo.birthdate,
        phoneNumber = charinfo.phone,
        gender = charinfo.gender,
        licences = metadata.licences,
        job = job.label,
        jobGrade = job.grade.name
    }

    return playerData
end

-- Retrieves the profile data of a citizen with the given Citizen ID and jobType same as the officer from the database.
-- If the profile data does not exist, it creates a new profile.
---@param cid string -- Citizen ID
---@param jobType string -- Job type
---@return table -- Profile data
local function getProfileInformation(cid, jobType)
    local result = MySQL.single.await("SELECT * FROM `mdt_data` WHERE `cid` = ? AND `jobtype` = ?", {
        cid, jobType
    })

    if not result then
        MySQL.insert.await("INSERT INTO `mdt_data` (`cid`, `jobtype`) VALUES (?, ?)", {
            cid, jobType
        })
        result = MySQL.single.await("SELECT * FROM `mdt_data` WHERE `cid` = ? AND `jobtype` = ?", { 
            cid, jobType
        })
    end

    return result
end

-- Retrieves a table of convictions for a given citizen ID from the database.
---@param cid string The citizen ID to retrieve convictions for.
---@return table A table of convictions for the given citizen ID.
local function getConvictions(cid)
    local result = MySQL.query.await("SELECT * FROM `mdt_convictions` WHERE `cid` = ?", { cid })
    return result
end

--- Retrieves profile data for a given citizen ID.
---@param cid string -- Citizen ID
---@param jobType string -- Job type
---@return table -- Profile data
local function getProfileData(cid, jobType)
    local profile = getProfileInformation(cid, jobType)
    local playerData = getPlayerData(cid)
    local properties = getProperties(cid)
    local vehicles = getVehicles(cid)
    local convictions = getConvictions(cid)

    local data = {
        id = profile.id,
        cid = cid,
        fullname = playerData.fullname,
        birthdate = playerData.birthdate,
        phoneNumber = playerData.phoneNumber,
        gender = playerData.gender,
        licences = playerData.licences,
        job = playerData.job,
        jobGrade = playerData.jobGrade,
        pfp = profile.pfp,
        fingerprint = profile.fingerprint,
        information = profile.information,
        tags = json.decode(profile.tags) or {},
        gallery = json.decode(profile.gallery) or {},
        properties = properties,
        vehicles = vehicles,
        convictions = convictions,
        jobtype = profile.jobtype,
    }

    return data
end

--- Retrieves profile data for a given citizen ID.
---@param cid string -- Citizen ID
---@param jobType string -- Job type
---@return table -- Profile data
lib.callback.register('nxt_mdt:callback:getProfileData', function(source, cid, jobType)
    local profile = getProfileData(cid, jobType)
    return profile
end)

-- Saves a profile in the database.
---@return table -- The saved profile data, to update the ui.
lib.callback.register('nxt_mdt:callback:saveProfile', function(source, id, cid, newInformation, newTags, newGallery, newPfp, newFingerprint, jobtype)
    local result = MySQL.query.await('UPDATE `mdt_data` SET `cid` = ?, `information` = ?, `tags` = ?, `gallery` = ?, `pfp` = ?, `fingerprint` = ? WHERE `id` = ?', {
        cid, newInformation, newTags, newGallery, newPfp, newFingerprint, id
    })

    return { id = id, cid = cid, information = newInformation, tags = json.decode(newTags), gallery = json.decode(newGallery), pfp = newPfp, fingerprint = newFingerprint, jobtype = jobtype }
end)

-- Get Profiles
---@return table -- A table containing the 10 most recent updated profiles.
lib.callback.register('nxt_mdt:callback:getProfiles', function(source)
    local result = MySQL.query.await("SELECT cid, jobtype FROM `mdt_data` ORDER BY `last_updated` DESC LIMIT 3", {})

    local profiles = {}
    for i, profile in ipairs(result) do
        local data = getProfileData(profile.cid, profile.jobtype)
        profiles[#profiles+1] = data
    end

    return profiles
end)

--- Searches for profiles in the database that match the given search query.
---@param search string -- The search query to match profiles against.
---@return table -- A table containing the matching profiles.
lib.callback.register('nxt_mdt:callback:searchProfiles', function(source, search)
    local result = MySQL.query.await("SELECT * FROM `players` WHERE `charinfo` LIKE ? OR (`charinfo` LIKE ? AND `charinfo` LIKE ?) LIMIT 25", {"%"..search.."%", "%" .. search:match("%S+") .. "%", "%" .. search:match("%S+$")})

    local profiles = {}
    for i, profile in ipairs(result) do
        local charinfo = json.decode(profile.charinfo)
        local metadata = json.decode(profile.metadata)
        local data = {
            citizenid = profile.citizenid,
            fullname = charinfo.firstname.." "..charinfo.lastname,
            gender = charinfo.gender,
            licences = metadata.licences,
        }

        profiles[#profiles+1] = data
    end

    return profiles
end)

-- VEHICLES

-- Get Vehicles
---@return table -- A table containing the 15 most recent updated vehicles.
lib.callback.register('nxt_mdt:callback:getVehicles', function(source)
    local result = MySQL.query.await("SELECT * FROM `mdt_vehicleinfo` ORDER BY `last_updated` DESC LIMIT 15", {})
    return result
end)

-- Searches for vehicles in the `player_vehicles` table that match the given search query.
---@param search string -- The search query to match against vehicle plates and models
---@return table -- A table of matching vehicles, each containing `plate`, `model`, and `garage` fields
lib.callback.register('nxt_mdt:callback:searchVehicles', function(source, search)
    local result = MySQL.query.await("SELECT * FROM `player_vehicles` WHERE `plate` LIKE ? OR `vehicle` LIKE ?", {"%"..search.."%", "%"..search.."%"})

    local vehicles = {}
    for i, vehicle in ipairs(result) do
        local label = GetVehicleName(vehicle.vehicle)
        local data = {
            label = label,
            plate = vehicle.plate,
            model = vehicle.vehicle,
            vinScrached = vehicle.vinscratched
        }

        vehicles[#vehicles+1] = data
    end

    return vehicles
end)

-- WEAPONS

-- Creates a new weapon in the database.
---@param serial string -- The serial of the weapon.
---@param img string -- The image of the weapon, should just be weapon_pistol, since it gets the img from inventory
---@param information string -- The information of the weapon.
---@param owner string -- The owner of the weapon.
---@param class string -- The class of the weapon.
---@param model string -- The model of the weapon.
local function createWeaponInfo(serial, img, information, owner, class, model)
    print("Creating weapon info")
    print(serial, img, information, owner, class, model)
end
exports("createWeaponInfo", createWeaponInfo)

-- Get Weapons
---@return table -- A table containing the 15 most recent updated weapons.
lib.callback.register('nxt_mdt:callback:getWeapons', function(source)
    local result = MySQL.query.await("SELECT * FROM `mdt_weaponinfo` ORDER BY `last_updated` DESC LIMIT 15", {})
    return result
end)

-- Searches for weapons in the database based on a search query.
---@param search string -- The search query to match against weapon information.
---@return table -- A table of matching weapons.
lib.callback.register('nxt_mdt:callback:searchWeapons', function(source, search)
    local result = MySQL.query.await("SELECT * FROM `mdt_weaponinfo` WHERE `owner` LIKE ? OR `serial` LIKE ? OR `weapModel` LIKE ?", {"%"..search.."%", "%"..search.."%", "%"..search.."%"})
    return result
end)

-- Saves a weapon in the database.
---@param id number -- The ID of the weapon to save.
---@param information string -- The information to save.
---@return table -- The saved weapon data, to update the ui.
lib.callback.register('nxt_mdt:callback:saveWeapon', function(source, id, newInformation)
    MySQL.query.await('UPDATE `mdt_weaponinfo` SET `information` = ? WHERE `id` = ?', {
        information, id
    })
    return { id = id, information = newInformation }
end)

QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}

local isTabletOpen = false
local tabletObject = 0

-- Functions

local function initalizeMDT()
	local locales = lib.getLocales()
	PlayerData = QBCore.Functions.GetPlayerData()
	Wait(500)
	SendSvelteMessage("initalize", {
		player = PlayerData,
		locales = locales,
		cameras = Config.Cameras,
		documents = Config.Documents
	})
	DebugPrint("MDT has been initalized.")
end

-- Deletes the tablet object
local function deleteTablet()
    if DoesEntityExist(tabletObject) then
        DeleteEntity(tabletObject)
    end

    tabletObject = 0
end

-- Creates the tablet object and attaches it to the player ped
local function createTablet()
    if tabletObject ~= 0 then
        deleteTablet()
    end

    local tablet = Config.Tablet
    tabletObject = CreateObject(tablet.model, 0.0, 0.0, 0.0, true, true, false)
    AttachEntityToEntity(tabletObject, cache.ped, GetPedBoneIndex(cache.ped, tablet.bone), tablet.offset.x, tablet.offset.y, tablet.offset.z, tablet.rotation.x, tablet.rotation.y, tablet.rotation.z, false, true, false, true, 1, true)
end

-- Handles tablet object and animation
local function playTabletAnimation()
    local tablet = Config.Tablet
    lib.RequestAnimDict(tablet.animation.dict)
    TaskPlayAnim(cache.ped, tablet.animation.dict, tablet.animation.name, 2.0, 2.0, -1, 49, 1.0, false, false, false)
    createTablet()

    CreateThread(function()
        while isTabletOpen do
            if not IsEntityPlayingAnim(cache.ped, tablet.animation.dict, tablet.animation.name, 3) then
                TaskPlayAnim(cache.ped, tablet.animation.dict, tablet.animation.name, 2.0, 2.0, -1, 49, 1.0, false, false, false)
            end

            Wait(250)
        end

        StopAnimTask(cache.ped, tablet.animation.dict, tablet.animation.name, 2.0)
        deleteTablet()
    end)
end

-- Toggle the visibilty of the MDT
---@param bool boolean
local function toggleMDT(bool)
	if not IsJobValid() then return end
	SetNuiFocus(bool, bool)
	SendSvelteMessage("setVisible", bool)

	isTabletOpen = bool

	if bool then
		playTabletAnimation()
	end

	DebugPrint("MDT has been toggled to: " .. tostring(bool))
end
exports("toggleMDT", toggleMDT)

-- Event Handlers

RegisterNetEvent("QBCore:Client:OnJobUpdate", initalizeMDT)

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	initalizeMDT()
	TriggerServerEvent('nxt_mdt:server:syncStatus')
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		initalizeMDT()
		TriggerServerEvent('nxt_mdt:server:syncStatus')
	end
end)

AddEventHandler('onResourceStop', function(resource)
	if resource ~= GetCurrentResourceName() then
		return
	end

	if tabletObject ~= 0 then
		deleteTablet()
	end
end)

-- NUI Callbacks

RegisterNUICallback("hideUI", function()
	toggleMDT(false)
end)

-- Active Officers

RegisterNUICallback("toggleDuty", function()
	TriggerServerEvent('QBCore:ToggleDuty')
end)

RegisterNUICallback("setCallsign", function(data)
	TriggerServerEvent('nxt_mdt:server:setCallsign', data.cid, data.newCallsign)
end)

RegisterNUICallback("setRadio", function(data)
	print("Radio Channel: " .. data.newRadio)
end)

RegisterNUICallback("getOfficers", function(data, cb)
	local activeOfficers = lib.callback.await('nxt_mdt:callback:getActiveOfficers', false)
	cb(activeOfficers)
end)

-- DISPATCH

RegisterNUICallback("setWaypoint", function(coords)
	SetNewWaypoint(coords.x, coords.y)
end)

RegisterNUICallback("attachAlert", function(data)
	TriggerServerEvent('ps-dispatch:server:attach', data.id, data.player)
end)

RegisterNUICallback("detachAlert", function(data)
	TriggerServerEvent('ps-dispatch:server:detach', data.id, data.player)
end)

RegisterNUICallback("getActiveCalls", function(_, cb)
	local activeCalls = lib.callback.await('nxt_mdt:callback:getActiveCalls', false)
	cb(activeCalls)
end)

-- ANNOUNCEMENTS

RegisterNUICallback("getAnnouncements", function(jobType, cb)
	local announcements = lib.callback.await('nxt_mdt:callback:getAnnouncements', false, jobType)
	cb(announcements)
end)

RegisterNUICallback("newAnnouncement", function(data, cb)
	local announcement = lib.callback.await('nxt_mdt:callback:newAnnouncement', false, data.title, data.desc, data.author, data.jobType)
	cb(announcement)
end)

RegisterNUICallback("editAnnouncement", function(data, cb)
	local announcement = lib.callback.await('nxt_mdt:callback:editAnnouncement', false, data.id, data.title, data.desc, data.time, data.author, data.jobType)
	cb(announcement)
end)

RegisterNUICallback("deleteAnnouncement", function(data)
	TriggerServerEvent('nxt_mdt:server:deleteAnnouncement', data.id, data.title, data.player, data.jobType)
end)

-- INCIDENTS

RegisterNUICallback("getIncidents", function(data, cb)
	local incidents = lib.callback.await('nxt_mdt:callback:getIncidents', false, data.jobType)
	cb(incidents)
end)

RegisterNUICallback("searchIncidents", function(data, cb)
	local incidents = lib.callback.await('nxt_mdt:callback:searchIncidents', false, data.searchQuery)
	cb(incidents)
end)

RegisterNUICallback("newIncident", function(data, cb)
	local incident = lib.callback.await('nxt_mdt:callback:newIncident', false, data.author, data.title, data.details, json.encode(data.tags), json.encode(data.officersinvolved), json.encode(data.civsinvolved), json.encode(data.evidence), data.jobType)
	cb(incident)
end)

RegisterNUICallback("saveIncident", function(data, cb)
	local incident = lib.callback.await('nxt_mdt:callback:saveIncident', false, data.author, data.title, data.details, json.encode(data.tags), json.encode(data.officersinvolved), json.encode(data.civsinvolved), json.encode(data.evidence), data.jobType, data.id)
	cb(incident)
end)

RegisterNUICallback("deleteIncident", function(data)
	TriggerServerEvent("nxt_mdt:server:deleteIncident", data.title, data.id, data.player, data.jobType)
end)

-- REPORTS

RegisterNUICallback("getReports", function(data, cb)
	local reports = lib.callback.await('nxt_mdt:callback:getReports', false, data.jobType)
	cb(reports)
end)
-- LOGS

RegisterNUICallback("getLogs", function(_, cb)
	local logs = lib.callback.await('nxt_mdt:callback:getLogs', false)
	cb(logs)
end)

-- CAMERAS

---@param camID string camera id
RegisterNuiCallback("viewCamera", function(camID)
	toggleMDT(false)
	TriggerEvent("police:client:ActiveCamera", camID)
end)

-- CHAT

RegisterNUICallback("getMessages", function(_, cb)
	local messages = lib.callback.await('nxt_mdt:callback:getMessages', false)
	cb(messages)
end)

---@param data table message data
RegisterNUICallback("newMesssage", function(data)
	TriggerServerEvent('nxt_mdt:server:newMessage', data.message, data.player)
end)

---@param data table message data 
RegisterNetEvent('nxt_mdt:client:sendMessage', function(data)
	SendSvelteMessage("newMessage", data)
end)

-- PROFILES

RegisterNUICallback("searchProfiles", function(data, cb)
	local profiles = lib.callback.await('nxt_mdt:callback:searchProfiles', false, data.searchQuery)
	cb(profiles)
end)

RegisterNUICallback("selectProfile", function(data, cb)
	local profile = lib.callback.await('nxt_mdt:callback:getProfileData', false, data.citizenid, data.jobType)
	cb(profile)
end)

RegisterNUICallback("saveProfile", function(data, cb)
	local profile = lib.callback.await('nxt_mdt:callback:saveProfile', false, data.id, data.cid, data.information, json.encode(data.tags), json.encode(data.gallery), data.pfp, data.fingerprint, data.jobtype)
	cb(profile)
end)

RegisterNUICallback("getProfiles", function(_, cb)
	local profiles = lib.callback.await('nxt_mdt:callback:getProfiles', false)
	cb(profiles)
end)

-- VEHICLES

RegisterNUICallback("getVehicles", function(_, cb)
	local vehicles = lib.callback.await('nxt_mdt:callback:getVehicles', false)
	cb(vehicles)
end)

RegisterNUICallback("searchVehicles", function(data, cb)
	local vehicles = lib.callback.await('nxt_mdt:callback:searchVehicles', false, data.searchQuery)
	cb(vehicles)
end)

-- WEAPONS

RegisterNUICallback("getWeapons", function(_, cb)
	local weapons = lib.callback.await('nxt_mdt:callback:getWeapons', false)
	cb(weapons)
end)

---@param search string search query
---@return table weapons
RegisterNUICallback("searchWeapons", function(search, cb)
	local weapons = lib.callback.await('nxt_mdt:callback:searchWeapons', false, search)
	cb(weapons)
end)

RegisterNUICallback("saveWeapon", function(data, cb)
	local weapon = lib.callback.await('nxt_mdt:callback:saveWeapon', false, data.id, data.information)
	cb(weapon)
end)

-- COMMAND

RegisterCommand("mdt", function()
	toggleMDT(true)
end, false)

-- Check if the player has a valid jobtype
---@return boolean
function IsJobValid()
    local jobType = PlayerData.job.type

	if lib.table.contains(Config.Jobs, jobType) then
		return true
	end

	lib.notify({
		description = 'Du kan ikke bruke mdten',
		type = 'error'
	})

    return false
end

---@param action string The action you wish to target
---@param data any The data you wish to send along with this action
function SendSvelteMessage(action, data)
	SendNUIMessage({
		action = action,
		data = data
	})
end

-- Debug print
function DebugPrint(...)
	if not Config.Debug then return end
	local args <const> = { ... }

	local appendStr = ''
	for _, v in ipairs(args) do
		appendStr = appendStr .. ' ' .. tostring(v)
	end
	local msgTemplate = '^3[%s]^0%s'
	local finalMsg = msgTemplate:format("nxt_mdt", appendStr)
	print(finalMsg)
end
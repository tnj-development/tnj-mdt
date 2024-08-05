--- Creates a new log in the database
---@param text string
---@param category string
---@param jobtype string
function NewLog(text, category, jobtype)
    local time = os.time() * 1000

    MySQL.insert.await('INSERT INTO `mdt_logs` (`text`, `category`, `time`, `jobtype`) VALUES (?, ?, ?, ?)', {
        text, category, time, jobtype
    })
end

-- Retrieves the name of a vehicle model.
---@param model string -- The model of the vehicle.
---@return string -- The name of the vehicle.
function GetVehicleName(model)
    for i, vehicle in pairs(QBCore.Shared.Vehicles) do
        if vehicle.model == model then
            return vehicle.name
        end
    end

    return model
end
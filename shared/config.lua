Config = Config or {}

Config.Debug = true -- debug prints
Config.PSHousing = true -- Set to true if you have ps-housing installed

Config.Jobs = { -- Add job types here that you want to be able to use the MDT
    "leo",
    "ems"
}

Config.Tablet = {
    model = `prop_mdt_tablet`,
    bone = 28422,
    offset = vector3(-0.03, 0.0, -0.04),
    rotation = vector3(0.0, 180.0, 0.0),
    animation = {
        dict = "amb@code_human_in_bus_passenger_idles@female@tablet@base",
        name = "base"
    }
}

-- Comment out for later 
-- Config.Permissions = {
--     leo = {
--         create_incident = 2,
--         delete_incident = 2,
--         create_report = 2,
--         delete_report = 2,
--         create_annoucement = 2,
--         delete_annoucement = 2,
--         create_warrant = 2,
--         delete_warrant = 2,
--         create_bolo = 2,
--         delete_bolo = 2,
--         hire = 4,
--         fire = 4,
--         logs = 4,
--     },
--     ems = {
--         create_incident = 2,
--         delete_incident = 2,
--         create_report = 2,
--         delete_report = 2,
--         create_annoucement = 2,
--         delete_annoucement = 2,
--         hire = 4,
--         fire = 4,
--         logs = 4,
--     }
-- }

-- Google Docs
-- Config.Documents = {
--     sop = {
--         leo = {
--             title = "Håndbok",
--             link = ""
--         },
--     },
--     roster = {
--         leo = "",
--         ems = "",
--         doj = "",
--     }
-- }

-- Config.Templates = {
--     incidents = {
--         leo = "<b>Summary:&nbsp;</b><div><br></div><div><b>Hostages:&nbsp;</b></div><div><b><br></b></div><div><b>Weapons:&nbsp;</b></div><div><b><br></b></div><div><b>Fine:&nbsp;</b></div><div><b>Months:&nbsp;</b></div>",
--         ems = "<b>Summary:&nbsp;</b>"
--     },
--     reports = {
--         leo = "<b>Summary:&nbsp;</b><div><br></div><div><b>Hostages:&nbsp;</b></div><div><b><br></b></div><div><b>Weapons:&nbsp;</b></div><div><b><br></b></div><div><b>Fine:&nbsp;</b></div><div><b>Months:&nbsp;</b></div>",
--         ems = "<b>Summary:&nbsp;</b>"
--     }
-- }

Config.Cameras = {
    { id = 1, label = "CAM 1", location = "Pacific Bank", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 2, label = "CAM 2", location = "Pacific Bank", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 3, label = "CAM 3", location = "Pacific Bank", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 4, label = "CAM 1", location = "Limited Ltd Grove St.", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 5, label = "CAM 1", location = "Rob's Liqour Prosperity St.", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 6, label = "CAM 1", location = "Rob's Liqour San Andreas Ave.", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 7, label = "CAM 1", location = "Limited Ltd Ginger St.", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 8, label = "CAM 1", location = "24/7 Supermarkt Innocence Blvd.", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 9, label = "CAM 1", location = "Rob's Liqour El Rancho Blvd.", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 10, label = "CAM 1", location = "Limited Ltd West Mirror Drive", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 11, label = "CAM 1", location = "24/7 Supermarkt Clinton Ave", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 12, label = "CAM 1", location = "Limited Ltd Banham Canyon Dr", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 13, label = "CAM 1", location = "Rob's Liqour Great Ocean Hwy", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 14, label = "CAM 1", location = "24/7 Supermarkt Ineseno Road", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 15, label = "CAM 1", location = "24/7 Supermarkt Barbareno Rd.", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 16, label = "CAM 1", location = "24/7 Supermarkt Route 68", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 17, label = "CAM 1", location = "Rob's Liqour Route 68", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 18, label = "CAM 1", location = "24/7 Supermarkt Senora Fwy", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 19, label = "CAM 1", location = "24/7 Supermarkt Alhambra Dr.", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 20, label = "CAM 2", location = "24/7 Supermarkt Senora Fwy", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 21, label = "CAM 1", location = "Fleeca Bank Hawick Ave", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 22, label = "CAM 2", location = "Fleeca Bank Hawick Ave", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 23, label = "CAM 1", location = "Fleeca Bank Legion Square", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 24, label = "CAM 1", location = "Fleeca Bank Del Perro Blvd", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 25, label = "CAM 1", location = "Fleeca Bank Great Ocean Hwy", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 26, label = "CAM 1", location = "Paleto Bank", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 27, label = "CAM 1", location = "Liquor Paleto Bay", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 28, label = "CAM 1", location = "Don's Country Store Paleto Bay", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 29, label = "CAM 2", location = "Don's Country Store Paleto Bay", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 30, label = "CAM 3", location = "Don's Country Store Paleto Bay", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 31, label = "CAM 1", location = "Vangelico Jewelery", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 32, label = "CAM 2", location = "Vangelico Jewelery", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 33, label = "CAM 3", location = "Vangelico Jewelery", img = "https://i.imgur.com/Pfa57ud.png" },
    { id = 34, label = "CAM 4", location = "Vangelico Jewelery", img = "https://i.imgur.com/Pfa57ud.png" },
}
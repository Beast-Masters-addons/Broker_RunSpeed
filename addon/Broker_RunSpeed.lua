local addonName = ...
local _, addonTitle, addonDescription = _G.C_AddOns.GetAddOnInfo(addonName)
local HowRunning

local brsRunSpeed = _G.LibStub("LibDataBroker-1.1"):NewDataObject(addonTitle, {
	type = "data source",
	icon = "Interface\\Icons\\Inv_boots_02.blp",
	label = addonTitle,
	OnTooltipShow = function()end,
})

local string = string
local GetUnitSpeed = _G.GetUnitSpeed
local canaccessvalue = _G.canaccessvalue
local UnitInVehicle = _G.UnitInVehicle

local function UpdateRunSpeed(frame,elapsed)
	HowRunning = "player"
	if _G.UnitInVehicle ~= nil and UnitInVehicle("player") then
		HowRunning = "vehicle"
	end
    local speed = GetUnitSpeed(HowRunning)
    if canaccessvalue(speed) then
        brsRunSpeed.value = string.format("%.0f", speed / 7 * 100) .. "%"
        brsRunSpeed.text = string.format("%.0f", speed / 7 * 100) .. "%"
    else
        brsRunSpeed.value = "N/A"
        brsRunSpeed.text = "N/A"
    end
end

local brsFrame = CreateFrame("Frame")
brsFrame:SetScript("OnUpdate", UpdateRunSpeed)

local addonName = ...
local _, addonTitle = _G.GetAddOnInfo(addonName)
local _G = _G
local HowRunning

local brsRunSpeed = _G.LibStub("LibDataBroker-1.1"):NewDataObject(addonTitle, {
	type = "data source",
	icon = "Interface\\Icons\\Inv_boots_02.blp",
	label = addonTitle,
	OnTooltipShow = function()end,
})

local string = string

local function UpdateRunSpeed(frame,elapsed)
	HowRunning = "player"
	if _G.UnitInVehicle ~= nil and UnitInVehicle("player") then
		HowRunning = "vehicle"
	end
	brsRunSpeed.value = string.format("%.0f",  GetUnitSpeed(HowRunning) / 7 * 100 ) .. "%"
	brsRunSpeed.text = string.format("%.0f",  GetUnitSpeed(HowRunning) / 7 * 100 ) .. "%"
end

local brsFrame = CreateFrame("Frame")
brsFrame:SetScript("OnUpdate", UpdateRunSpeed)

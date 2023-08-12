local kursiKosong = function ( v )
    local seat = GetVehicleMaxNumberOfPassengers(v)
    for i= -1, seat do
        if GetPedInVehicleSeat(v, i) ~= 0 then
            return false
        end
    end
    return true
end

RegisterNetEvent('hapus', function ()
    local smuaKendaraan = GetGamePool('CVehicle')
    for i = 1, #smuaKendaraan do
        local kendaraan = smuaKendaraan[i]
        if DoesEntityExist(kendaraan) and kursiKosong(kendaraan) then
            DeleteVehicle(kendaraan)
        end
    end
end)

RegisterNetEvent('changeSeat', function( seatId )
    if cache.vehicle then
        if IsVehicleSeatFree(cache.vehicle, tonumber(seatId)) then
            SetPedIntoVehicle(cache.ped, cache.vehicle, tonumber(seatId))
        end
    end
end)

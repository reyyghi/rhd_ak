local notify = function ( data )
    TriggerClientEvent('ox_lib:notify', -1, {
        id = 'asuransi_kota',
        title = 'ASURANSI KOTA',
        duration = data.durasi or 3000,
        description = data.pesan,
        position = 'top',
        type = data.tipe or 'inform',
        icon = data.icon or 'circle-info',
        iconColor = data.iconColor or 'red'
    })
end

local hapus = function ()
    notify({ pesan = 'Akan ada asuransi keliling dalam waktu 1 menit. Tolong masuk ke dalam kendaraan !', iconColor = '#f5f105'})
    Wait(30000)
    notify({ pesan = 'Akan ada asuransi keliling dalam waktu 30 detik. Tolong masuk ke dalam kendaraan !', iconColor = '#f5f105'})
    Wait(15000)
    notify({ pesan = 'Akan ada asuransi keliling dalam waktu 15 detik. Tolong masuk ke dalam kendaraan !', iconColor = '#f5f105'})
    Wait(5000)
    notify({ pesan = 'Akan ada asuransi keliling dalam waktu 10 detik. Tolong masuk ke dalam kendaraan !', iconColor = '#f5f105'})
    Wait(5000)
    notify({ pesan = 'Akan ada asuransi keliling dalam waktu 5 detik. Tolong masuk ke dalam kendaraan !', iconColor = '#f5f105'})
    Wait(5000)
    notify({ pesan = 'Semua kendaraan yang terparkir sembarangan telah di bawa oleh pihak asuransi !', icon = 'circle-check', iconColor = '#04d60b', durasi = 8000})
    TriggerClientEvent('hapus', -1)
end

lib.addCommand('seat', {
    help = 'Change seat',
    params = {
        {
            name = 'seatid',
            type = 'number',
            help = 'Seat Id',
        },
    },
}, function(source, args, raw)
    local seat = args.seatid

    if seat then
        TriggerClientEvent('changeSeat', source, seat)
    end
end)

lib.cron.new('* */' .. Config.cooldown .. ' * * *', function()
    hapus()
end)

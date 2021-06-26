@echo off
cls
echo *** CLEARING OLD LOGS ***
del "logs/zone/" /q

if exist bin/shared_memory.exe (
    "bin/shared_memory.exe"
) else (
    shared_memory.exe
)

start perl win_server_launcher.pl zones="30" zone_background_start loginserver kill_all_on_start
TIMEOUT 15
start discordeq-0.52.0-windows-x86.exe
exit

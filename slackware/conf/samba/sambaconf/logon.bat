@echo off
NET TIME \\MAPSERVER /SET /YES
NET USE P: \\MAPSERVER\PUBLIC
NET USE H: \\MAPSERVER\HOMES
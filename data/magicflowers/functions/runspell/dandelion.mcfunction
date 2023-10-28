# Projectile particles
particle crit ~ ~ ~ 0 0 0 0 0 normal

# Entity detection
execute positioned ~ ~-1.35 ~ if entity @e[distance=..0.75, type=!item, type=!item_frame, type=!item_display, type=!block_display, type=!armor_stand] positioned ~ ~1.35 ~ run summon tnt ~ ~ ~ {Fuse:0}

# Block detection
execute unless block ~ ~ ~ air run summon tnt ~ ~ ~ {Fuse:0}

# Movement
execute if block ~ ~ ~ air positioned ~ ~-1.35 ~ unless entity @e[distance=..0.75, type=!item, type=!item_frame, type=!item_display, type=!block_display, type=!armor_stand] positioned ~ ~1.35 ~ positioned ^ ^ ^1 run function magicflowers:runspell/dandelion
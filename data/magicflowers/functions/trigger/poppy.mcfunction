##
#   EXECUTE as PLAYER at PLAYER
##

# Check if poppy is enchanted (A.K.A Enchanted Dandelion)
execute positioned ~ ~1 ~ unless entity @e[distance=..1, type=item, nbt={Item:{tag:{magicflowers:1b}}}] run scoreboard players set @s magicflowers.usedPoppy 0

# Kill poppy item
execute as @s[scores={magicflowers.usedPoppy=1..}] at @e[sort=nearest, type=item] run kill @e[distance=..1, type=item, nbt={Item:{tag:{magicflowers:1b}}}]

# Return item to player
execute as @s[scores={magicflowers.usedPoppy=1..}] run give @s poppy{display:{Name:'{"text":"Enchanted Poppy","color":"dark_purple","italic":false}'},magicflowers:1b,Enchantments:[{}]} 1

# Run spell if has enough XP
execute as @s[scores={magicflowers.usedPoppy=1.., magicflowers.playerXP=450..}] at @s positioned ~ ~1.4 ~ positioned ^ ^ ^1 run function magicflowers:runspell/poppy

# Remove XP
execute as @s[scores={magicflowers.usedPoppy=1.., magicflowers.playerXP=450..}] run xp add @s -450 points

# Play sound to indicate not enough XP
execute as @s[scores={magicflowers.usedPoppy=1.., magicflowers.playerXP=..450}] at @s run playsound entity.enderman.teleport player @s ~ ~ ~ 5

# Play sound to indicate spell cast
execute as @s[scores={magicflowers.usedPoppy=1.., magicflowers.playerXP=450..}] at @s run playsound block.enchantment_table.use player @s ~ ~ ~ 5

# Update scoreboard and remove tag
scoreboard players set @s magicflowers.usedPoppy 0
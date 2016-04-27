math.randomseed(os.time())
minetest.register_node("slot_machine:slotmachine", {
	tiles = {
	"side.png", 
	"side.png", 
	"lever.png", 
	"side.png", 
	"side.png", 
	"front.png"
	},
	groups = {cracky=1},
})

minetest.register_craft({
	output = 'slot_machine:slotmachine 1',
	recipe = {
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:gold_ingot', 'default:steel_ingot'},
		{'default:steel_ingot', 'default:steel_ingot', 'default:steel_ingot'},
	}
})

minetest.register_on_punchnode(function(pos, node, puncher, pointed_thing)	
	if node.name == "slot_machine:slotmachine" then
		local puncher_name = puncher:get_player_name()
		
		local num = math.random(0,20)
		if num <= 15 then
			minetest.chat_send_player(puncher_name, "You lose, you receive 5 dirt")
			puncher:get_inventory():add_item("main", "default:dirt 5")
		elseif num > 15 and num < 20 then
			minetest.chat_send_player(puncher_name, "Success! You receive 3 steel ingots!")
			puncher:get_inventory():add_item("main", "default:steel_ingot 3")         			
		elseif num == 20 then
			minetest.chat_send_player(puncher_name, "Lucky duck! You receive 5 gold ingots!")
			puncher:get_inventory():add_item("main", "default:gold_ingot 5")		
		end
	end
end)

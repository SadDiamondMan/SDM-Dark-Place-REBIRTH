local item, super = Class(Item, "white_ribbon")

function item:init()
    super.init(self)

    -- Display name
    self.name = "White Ribbon"

    -- Item type (item, key, weapon, armor)
    self.type = "armor"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/armor"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "A crinkly hair ribbon that slightly\nincreases your defense."

    -- Default shop price (sell price is halved)
    self.price = 90
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        defense = 2
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = "Cuteness"
    self.bonus_icon = "ui/menu/icon/up"

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        susie = false,
        dess = false
    }

    -- Character reactions
    self.reactions = {
        susie = "I said NO! C'mon already!",
        ralsei = "It's nice being dressed up...",
        noelle = "... feels familiar.",
        dess = "ew i hate cute things",
        jamm = "How adorable!",
    }
end

function item:getReaction(user_id, reactor_id)
    if user_id == "jamm" and reactor_id == user_id and Game:getFlag("marcy_joined") then
		return "It looks great on you, Marcy!"
	end
	return super.getReaction(self, user_id, reactor_id)
end

return item